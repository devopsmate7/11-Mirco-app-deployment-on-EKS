#!/bin/bash
# =============================================================================
# EKS DevOps Server — Complete Setup Script (Ubuntu 22.04 / 24.04)
# Includes: AWS CLI, kubectl, Terraform, Docker, Helm, eksctl, NGINX Ingress
# Run: bash ekssetup.sh
# =============================================================================
set -euo pipefail

log()  { echo -e "\n\033[1;32m========== $1 ==========\033[0m"; }
warn() { echo -e "\033[1;33mWARN: $1\033[0m"; }
fail() { echo -e "\033[1;31mERROR: $1\033[0m" >&2; exit 1; }

# Get the actual user (even when running with sudo)
ACTUAL_USER="${SUDO_USER:-$USER}"

# -----------------------------------------------------------------------------
# SECTION 0 — Base packages
# -----------------------------------------------------------------------------
log "SECTION 0: Base packages"
sudo apt-get update -y
sudo apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  unzip \
  jq \
  git \
  apt-transport-https \
  software-properties-common \
  dnsutils \
  net-tools \
  htop
echo "Base packages OK"

# -----------------------------------------------------------------------------
# SECTION 1 — AWS CLI v2
# -----------------------------------------------------------------------------
log "SECTION 1: AWS CLI v2"
if command -v aws >/dev/null 2>&1; then
  echo "Already installed: $(aws --version)"
else
  TMPDIR_AWS=$(mktemp -d)
  curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$TMPDIR_AWS/awscliv2.zip"
  unzip -q "$TMPDIR_AWS/awscliv2.zip" -d "$TMPDIR_AWS"
  sudo "$TMPDIR_AWS/aws/install" --update
  rm -rf "$TMPDIR_AWS"
  aws --version || fail "AWS CLI install failed"
fi
echo "AWS CLI OK"

# -----------------------------------------------------------------------------
# SECTION 2 — kubectl
# -----------------------------------------------------------------------------
log "SECTION 2: kubectl"
if command -v kubectl >/dev/null 2>&1; then
  echo "Already installed: $(kubectl version --client=true 2>/dev/null | head -1)"
else
  KUBECTL_VERSION="$(curl -fsSL https://dl.k8s.io/release/stable.txt)"
  curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /tmp/kubectl
  chmod +x /tmp/kubectl
  sudo mv /tmp/kubectl /usr/local/bin/kubectl
  kubectl version --client=true || fail "kubectl install failed"
  echo "Installed: ${KUBECTL_VERSION}"
fi
echo "kubectl OK"

# -----------------------------------------------------------------------------
# SECTION 3 — Terraform
# -----------------------------------------------------------------------------
log "SECTION 3: Terraform"
if command -v terraform >/dev/null 2>&1; then
  echo "Already installed: $(terraform version | head -1)"
else
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://apt.releases.hashicorp.com/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/hashicorp.gpg
  sudo chmod a+r /etc/apt/keyrings/hashicorp.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/hashicorp.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
  sudo apt-get update -y
  sudo apt-get install -y terraform
  terraform version || fail "Terraform install failed"
fi
echo "Terraform OK"

# -----------------------------------------------------------------------------
# SECTION 4 — Docker + Docker Compose
# -----------------------------------------------------------------------------
log "SECTION 4: Docker"
if command -v docker >/dev/null 2>&1; then
  echo "Already installed: $(docker --version)"
else
  for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove -y "$pkg" 2>/dev/null || true
  done

  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y
  sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

  sudo systemctl enable docker
  sudo systemctl start docker
  docker --version || fail "Docker install failed"
  docker compose version || fail "Docker Compose install failed"
fi

# Add user to docker group (so no sudo needed for docker commands)
if ! groups "$ACTUAL_USER" | grep -q '\bdocker\b'; then
  sudo usermod -aG docker "$ACTUAL_USER"
  echo "Added $ACTUAL_USER to docker group"
else
  echo "User $ACTUAL_USER already in docker group"
fi
echo "Docker OK"

# -----------------------------------------------------------------------------
# SECTION 5 — Helm
# -----------------------------------------------------------------------------
log "SECTION 5: Helm"
if command -v helm >/dev/null 2>&1; then
  echo "Already installed: $(helm version --short)"
else
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  helm version --short || fail "Helm install failed"
fi
echo "Helm OK"

# -----------------------------------------------------------------------------
# SECTION 6 — eksctl
# -----------------------------------------------------------------------------
log "SECTION 6: eksctl"
if command -v eksctl >/dev/null 2>&1; then
  echo "Already installed: $(eksctl version)"
else
  curl -fsSL "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" \
    | sudo tar xz -C /usr/local/bin
  eksctl version || fail "eksctl install failed"
fi
echo "eksctl OK"

# -----------------------------------------------------------------------------
# SECTION 7 — Shell environment
# -----------------------------------------------------------------------------
log "SECTION 7: Environment variables"
BASHRC_FILE="/home/$ACTUAL_USER/.bashrc"

grep -q 'export AWS_REGION=us-east-1' "$BASHRC_FILE" 2>/dev/null || \
  echo 'export AWS_REGION=us-east-1' >> "$BASHRC_FILE"
grep -q 'export AWS_DEFAULT_REGION=us-east-1' "$BASHRC_FILE" 2>/dev/null || \
  echo 'export AWS_DEFAULT_REGION=us-east-1' >> "$BASHRC_FILE"

# Add kubectl autocomplete
grep -q 'source <(kubectl completion bash)' "$BASHRC_FILE" 2>/dev/null || \
  echo 'source <(kubectl completion bash)' >> "$BASHRC_FILE"
grep -q 'alias k=kubectl' "$BASHRC_FILE" 2>/dev/null || \
  echo 'alias k=kubectl' >> "$BASHRC_FILE"
grep -q 'complete -o default -F __start_kubectl k' "$BASHRC_FILE" 2>/dev/null || \
  echo 'complete -o default -F __start_kubectl k' >> "$BASHRC_FILE"

export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=us-east-1
echo "Environment OK"

# -----------------------------------------------------------------------------
# SECTION 8 — Final verification (all tools)
# -----------------------------------------------------------------------------
log "SECTION 8: Final verification"

echo "--- Versions ---"
aws --version
kubectl version --client=true 2>/dev/null | head -1
terraform version | head -1
docker --version
docker compose version
helm version --short
eksctl version
git --version
jq --version

echo ""
echo "--- AWS identity (needs IAM role or credentials) ---"
if aws sts get-caller-identity 2>/dev/null; then
  echo "AWS auth OK"
else
  warn "AWS auth failed — attach IAM role to EC2 or run: aws configure"
fi

echo ""
echo "--- Docker test ---"
if sg docker -c "docker run --rm hello-world" >/dev/null 2>&1; then
  echo "Docker run OK (no sudo needed)"
elif sudo docker run --rm hello-world >/dev/null 2>&1; then
  echo "Docker run OK (via sudo - reconnect SSH session for non-sudo access)"
else
  fail "Docker test failed"
fi

# -----------------------------------------------------------------------------
# SECTION 9 — EKS Connection & NGINX Ingress Installation Function
# -----------------------------------------------------------------------------
log "SECTION 9: Creating EKS setup functions"

# Create a helper script for EKS connection and Ingress setup
cat > /tmp/eks-connect.sh << 'EKSSCRIPT'
#!/bin/bash
# =============================================================================
# EKS Connection & NGINX Ingress Setup
# Usage: bash eks-connect.sh <cluster-name> [region]
# =============================================================================
set -euo pipefail

CLUSTER_NAME="${1:-}"
REGION="${2:-us-east-1}"

if [ -z "$CLUSTER_NAME" ]; then
  echo "Usage: bash eks-connect.sh <cluster-name> [region]"
  echo "Example: bash eks-connect.sh mini-flipkart-eks us-east-1"
  exit 1
fi

echo "========== Connecting to EKS Cluster: $CLUSTER_NAME =========="

# Update kubeconfig
aws eks update-kubeconfig --region "$REGION" --name "$CLUSTER_NAME"

# Verify connection
echo ""
echo "--- Cluster Nodes ---"
kubectl get nodes

echo ""
echo "========== Installing NGINX Ingress Controller =========="

# Check if NGINX Ingress is already installed
if kubectl get namespace ingress-nginx >/dev/null 2>&1; then
  echo "NGINX Ingress namespace exists, checking pods..."
  if kubectl get pods -n ingress-nginx | grep -q "ingress-nginx-controller"; then
    echo "NGINX Ingress Controller already installed"
  else
    echo "Installing NGINX Ingress Controller..."
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml
  fi
else
  echo "Installing NGINX Ingress Controller for AWS..."
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml
fi

echo ""
echo "Waiting for NGINX Ingress Controller to be ready..."
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s 2>/dev/null || echo "Still starting up, check with: kubectl get pods -n ingress-nginx"

echo ""
echo "--- NGINX Ingress Controller Status ---"
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx

echo ""
echo "========== NGINX Ingress LoadBalancer URL =========="
kubectl get svc ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null && echo "" || echo "LoadBalancer still provisioning..."

echo ""
echo "========== EKS Setup Complete =========="
echo ""
echo "Next steps:"
echo "  1. Clone your app:  git clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git"
echo "  2. Deploy app:      kubectl apply -f release/kubernetes-manifests.yaml"
echo "  3. Deploy ingress:  kubectl apply -f kubernetes-manifests/ingress.yaml"
echo "  4. Get URL:         kubectl get svc -n ingress-nginx ingress-nginx-controller"
echo ""
echo "  5. Add to /etc/hosts for testing:"
echo "     <LOADBALANCER-IP>  mini-flipkart.com"
echo ""
echo "  Then access: http://mini-flipkart.com"
EKSSCRIPT

sudo mv /tmp/eks-connect.sh /usr/local/bin/eks-connect.sh
sudo chmod +x /usr/local/bin/eks-connect.sh

# Create a quick deploy script
cat > /tmp/deploy-app.sh << 'DEPLOYSCRIPT'
#!/bin/bash
# =============================================================================
# Deploy Microservices App to EKS
# Usage: bash deploy-app.sh [app-directory]
# =============================================================================
set -euo pipefail

APP_DIR="${1:-.}"

echo "========== Deploying Microservices Application =========="

# Check if connected to cluster
if ! kubectl cluster-info >/dev/null 2>&1; then
  echo "ERROR: Not connected to any Kubernetes cluster"
  echo "Run: eks-connect.sh <cluster-name> first"
  exit 1
fi

cd "$APP_DIR"

# Deploy the application
if [ -f "release/kubernetes-manifests.yaml" ]; then
  echo "Deploying from release/kubernetes-manifests.yaml..."
  kubectl apply -f release/kubernetes-manifests.yaml
elif [ -d "kubernetes-manifests" ]; then
  echo "Deploying from kubernetes-manifests/ using kustomize..."
  kubectl apply -k kubernetes-manifests/
else
  echo "ERROR: No kubernetes manifests found"
  exit 1
fi

echo ""
echo "Waiting for pods to be ready..."
sleep 5

echo ""
echo "--- Pod Status ---"
kubectl get pods

echo ""
echo "--- Services ---"
kubectl get svc

# Deploy ingress if exists
if [ -f "kubernetes-manifests/ingress.yaml" ]; then
  echo ""
  echo "Deploying Ingress..."
  kubectl apply -f kubernetes-manifests/ingress.yaml
  echo ""
  echo "--- Ingress ---"
  kubectl get ingress
fi

echo ""
echo "========== Deployment Complete =========="
echo ""
echo "Access your application:"
echo "  kubectl get svc -n ingress-nginx ingress-nginx-controller"
echo ""
echo "Monitor pods:"
echo "  kubectl get pods -w"
DEPLOYSCRIPT

sudo mv /tmp/deploy-app.sh /usr/local/bin/deploy-app.sh
sudo chmod +x /usr/local/bin/deploy-app.sh

echo "Created helper scripts:"
echo "  - eks-connect.sh <cluster-name> [region]  : Connect to EKS and install NGINX Ingress"
echo "  - deploy-app.sh [app-directory]           : Deploy the microservices app"

# -----------------------------------------------------------------------------
# DONE
# -----------------------------------------------------------------------------
log "ALL INSTALLATIONS COMPLETE"
cat << 'EOF'

╔══════════════════════════════════════════════════════════════════════════════╗
║                         EKS SETUP COMPLETE!                                  ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  STEP 1: Reconnect SSH (for docker group to take effect)                     ║
║          exit                                                                ║
║          ssh -i your-key.pem ubuntu@your-ec2-ip                              ║
║                                                                              ║
║  STEP 2: Connect to EKS & Install NGINX Ingress                              ║
║          eks-connect.sh <your-cluster-name> us-east-1                        ║
║                                                                              ║
║  STEP 3: Clone and Deploy Application                                        ║
║          git clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git  
║          cd 11-Mirco-app-deployment-on-EKS                                   ║
║          deploy-app.sh .                                                     ║
║                                                                              ║
║  STEP 4: Get Application URL                                                 ║
║          kubectl get svc -n ingress-nginx ingress-nginx-controller           ║
║                                                                              ║
║  Useful Commands:                                                            ║
║          kubectl get pods              # Check pod status                    ║
║          kubectl get svc               # Check services                      ║
║          kubectl get ingress           # Check ingress                       ║
║          kubectl logs <pod-name>       # Check pod logs                      ║
║          k get pods                    # Shortcut (kubectl alias)            ║
║                                                                              ║
║  For Testing (add to /etc/hosts on your local machine):                      ║
║          <LOADBALANCER-IP>  mini-flipkart.com                                ║
║          Then access: http://mini-flipkart.com                               ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

EOF
