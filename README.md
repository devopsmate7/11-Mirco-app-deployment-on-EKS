<p align="center"># 🛒 Mini Flipkart - Microservices E-Commerce Application<p align="center">

  <img src="https://img.shields.io/badge/🛒-Mini%20Flipkart-ff6f00?style=for-the-badge&labelColor=000000" alt="Mini Flipkart"/>

</p>  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F172A,45:326CE5,100:16A34A&height=200&section=header&text=mini-flipkart%20on%20EKS&fontSize=42&fontColor=ffffff&animation=fadeIn" alt="EKS Banner" />



<h1 align="center">🛒 Mini Flipkart</h1>A cloud-native e-commerce application built with **11 microservices**, demonstrating modern DevOps practices with Docker, Amazon ECR, and Kubernetes (EKS) deployment.</p>

<h3 align="center">11 Microservices E-Commerce Application Deployment on Amazon EKS</h3>



<p align="center">

  <img src="https://img.shields.io/badge/Microservices-11-brightgreen?style=flat-square" alt="Microservices"/>![Architecture](https://img.shields.io/badge/Architecture-Microservices-blue)<p align="center">

  <img src="https://img.shields.io/badge/Docker-Compose-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Docker"/>

  <img src="https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=flat-square&logo=kubernetes&logoColor=white" alt="Kubernetes"/>![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)  <img src="https://img.shields.io/badge/App-mini--flipkart-2563EB?style=for-the-badge" alt="App" />

  <img src="https://img.shields.io/badge/AWS-ECR%20|%20EKS-FF9900?style=flat-square&logo=amazon-aws&logoColor=white" alt="AWS"/>

  <img src="https://img.shields.io/badge/License-Apache%202.0-blue?style=flat-square" alt="License"/>![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)  <img src="https://img.shields.io/badge/Platform-Amazon%20EKS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" alt="EKS" />

</p>

![AWS](https://img.shields.io/badge/AWS-ECR%20%7C%20EKS-FF9900?logo=amazon-aws)  <img src="https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" alt="K8s" />

<p align="center">

  <a href="#-architecture">Architecture</a> •  <img src="https://img.shields.io/badge/Path-EC2%20%E2%86%92%20Docker%20%E2%86%92%20K8s-16A34A?style=for-the-badge" alt="Path" />

  <a href="#-agenda">Agenda</a> •

  <a href="#-microservices">Microservices</a> •---</p>

  <a href="#-deployment-steps">Deployment</a> •

  <a href="#-quick-commands">Quick Commands</a>

</p>

## 📋 Table of Contents# Project 11: Application Deployment End-to-End on Kubernetes (EKS)

---



## 📋 Agenda

1. [Architecture Overview](#-architecture-overview)**Application name:** `mini-flipkart`

```

┌─────────────────────────────────────────────────────────────────────────────────┐2. [Microservices](#-microservices)

│                        MINI FLIPKART DEPLOYMENT JOURNEY                         │

├─────────────────────────────────────────────────────────────────────────────────┤3. [Prerequisites](#-prerequisites)> Learning style: **Understand the story first → see architecture → create EKS in AWS Console → deploy YAML manifests in clear order.**

│                                                                                 │

│   📦 STEP 1: Create EC2 & Install Software (ekssetup.sh)                       │4. [Deployment Options](#-deployment-options)

│       └──▶ Docker, kubectl, AWS CLI, Helm, eksctl                              │

│                                                                                 │   - [Option 1: Docker Compose (Local/Development)](#option-1-docker-compose-localdevelopment)Demo login:

│   🐳 STEP 2: Docker Compose - Build from Source                                │

│       └──▶ Path: src/* → docker-compose.yaml                                   │   - [Option 2: Docker Compose with ECR Images](#option-2-docker-compose-with-ecr-images)

│                                                                                 │

│   📤 STEP 3: Build & Push Images to ECR                                        │   - [Option 3: Kubernetes (EKS Production)](#option-3-kubernetes-eks-production)```text

│       └──▶ Create ECR repos → Build → Tag → Push                               │

│                                                                                 │5. [AWS Infrastructure Setup](#-aws-infrastructure-setup)Email: demo@devopsmate.com

│   🚀 STEP 4: Docker Compose - ECR Images                                       │

│       └──▶ docker-compose-ecr.yaml (test deployment)                           │6. [Quick Start Commands](#-quick-start-commands)Password: password

│                                                                                 │

│   ☸️  STEP 5: Kubernetes (EKS) Production Deployment                           │7. [Accessing the Application](#-accessing-the-application)```

│       └──▶ kubernetes-manifests/ → kubectl apply                               │

│                                                                                 │

└─────────────────────────────────────────────────────────────────────────────────┘

```------



---



## 🏗 Architecture## 🏗 Architecture Overview## Agenda



```

                                        🌐 INTERNET

                                             │```| Step | What you do |

                                             ▼

                            ┌────────────────────────────────┐                                    ┌─────────────────┐|---|---|

                            │     ⚖️  LOAD BALANCER          │

                            │      (Ingress/ALB)             │                                    │   Load Balancer │| 1 | Understand why we move **EC2 → Docker → Kubernetes** |

                            │    mini-flipkart.com           │

                            └────────────────┬───────────────┘                                    │    (Ingress)    │| 2 | Learn Kubernetes architecture (control plane + worker nodes) |

                                             │

                                             ▼                                    └────────┬────────┘| 3 | See what happens internally when DevOps applies a Deployment |

                            ┌────────────────────────────────┐

                            │         🖥️  FRONTEND           │                                             │| 4 | Learn Namespace, ConfigMap, Secret, Deployment, StatefulSet, Service, Ingress |

                            │          (Go :8080)            │

                            │      Mini Flipkart UI          │                                    ┌────────▼────────┐| 5 | Create **EKS cluster** in AWS Console |

                            └────────────────┬───────────────┘

                                             │                                    │    Frontend     │| 6 | Push Docker images to **ECR** |

           ┌─────────────┬─────────────┬─────┴─────┬─────────────┬─────────────┐

           │             │             │           │             │             │                                    │   (Go - :8080)  │| 7 | Deploy `mini-flipkart` manifests to EKS |

           ▼             ▼             ▼           ▼             ▼             ▼

    ┌─────────────┐┌─────────────┐┌─────────┐┌─────────────┐┌─────────────┐┌─────────────┐                                    └────────┬────────┘| 8 | Access app using **domain / host mapping** via Ingress |

    │ 📢 AD SVC   ││ 💡 RECOMMEND││ 🛒 CART ││ 💳 CHECKOUT ││ 📦 PRODUCT  ││ 💵 CURRENCY │

    │ Java:9555   ││ Python:8080 ││  :7070  ││  Go:5050    ││  Go:3550    ││ Node:7000   │                                             │

    └─────────────┘└─────────────┘└────┬────┘└──────┬──────┘└─────────────┘└─────────────┘

                                       │           │        ┌────────────────────────────────────┼────────────────────────────────────┐---

                                       ▼           │

                               ┌─────────────┐     │        │                    │               │               │                    │

                               │ 🔴 REDIS    │     │

                               │   :6379     │     │┌───────▼───────┐  ┌────────▼────────┐ ┌────▼────┐ ┌───────▼───────┐  ┌─────────▼─────────┐## Journey So Far (Clear Sequence)

                               └─────────────┘     │

                                                   ││  Ad Service   │  │ Recommendation  │ │  Cart   │ │   Checkout    │  │ Product Catalog   │

                          ┌────────────────────────┼────────────────────────┐

                          │                        │                        ││ (Java - 9555) │  │ (Python - 8080) │ │ (:7070) │ │  (Go - 5050)  │  │   (Go - 3550)     │```mermaid

                          ▼                        ▼                        ▼

                   ┌─────────────┐          ┌─────────────┐          ┌─────────────┐└───────────────┘  └─────────────────┘ └────┬────┘ └───────┬───────┘  └───────────────────┘flowchart LR

                   │ 📧 EMAIL    │          │ 💰 PAYMENT  │          │ 🚚 SHIPPING │

                   │ Python:8080 │          │ Node:50051  │          │  Go:50051   │                                            │              │  classDef done fill:#dcfce7,stroke:#16a34a,stroke-width:2px,color:#111827;

                   └─────────────┘          └─────────────┘          └─────────────┘

```                                    ┌───────▼───────┐      │  classDef now fill:#dbeafe,stroke:#2563eb,stroke-width:3px,color:#111827;



---                                    │     Redis     │      │



## 🔧 Microservices                                    │    (:6379)    │      │  P9["Project 09\nEC2 + PM2\nOne server manual"]



<table>                                    └───────────────┘      │  P10["Project 10\nDocker containers\n12 boxes on one host"]

<tr>

<th>🔢</th>                                                           │  P11["Project 11\nEKS + Kubernetes\nAuto-heal + scale"]

<th>Service</th>

<th>Language</th>        ┌──────────────────────────────────────────────────┼──────────────────┐

<th>Port</th>

<th>Description</th>        │                         │                        │                  │  P9 --> P10 --> P11

</tr>

<tr><td>1️⃣</td><td><b>Frontend</b></td><td>🔵 Go</td><td>8080</td><td>Web UI - Mini Flipkart Shop</td></tr>┌───────▼───────┐  ┌──────────────▼──────────────┐ ┌──────▼──────┐  ┌────────▼────────┐

<tr><td>2️⃣</td><td><b>Cart Service</b></td><td>🟣 C# (.NET)</td><td>7070</td><td>Shopping cart management</td></tr>

<tr><td>3️⃣</td><td><b>Product Catalog</b></td><td>🔵 Go</td><td>3550</td><td>Product listing & details</td></tr>│   Currency    │  │         Email               │ │   Payment   │  │    Shipping     │  class P9,P10 done

<tr><td>4️⃣</td><td><b>Currency Service</b></td><td>🟢 Node.js</td><td>7000</td><td>Currency conversion</td></tr>

<tr><td>5️⃣</td><td><b>Payment Service</b></td><td>🟢 Node.js</td><td>50051</td><td>Payment processing</td></tr>│(Node.js-7000) │  │     (Python - 8080)         │ │(Node.js-50051)│ │  (Go - 50051)   │  class P11 now

<tr><td>6️⃣</td><td><b>Shipping Service</b></td><td>🔵 Go</td><td>50051</td><td>Shipping cost calculation</td></tr>

<tr><td>7️⃣</td><td><b>Email Service</b></td><td>🟡 Python</td><td>8080</td><td>Order confirmation emails</td></tr>└───────────────┘  └─────────────────────────────┘ └─────────────┘  └─────────────────┘```

<tr><td>8️⃣</td><td><b>Checkout Service</b></td><td>🔵 Go</td><td>5050</td><td>Checkout orchestration</td></tr>

<tr><td>9️⃣</td><td><b>Recommendation</b></td><td>🟡 Python</td><td>8080</td><td>Product recommendations</td></tr>```

<tr><td>🔟</td><td><b>Ad Service</b></td><td>🔴 Java</td><td>9555</td><td>Advertisement serving</td></tr>

<tr><td>1️⃣1️⃣</td><td><b>Load Generator</b></td><td>🟡 Python</td><td>-</td><td>Traffic simulation (optional)</td></tr>| Project | How app runs | Main problem solved | New problem created |

<tr><td>🔴</td><td><b>Redis</b></td><td>Redis</td><td>6379</td><td>Cart data storage</td></tr>

</table>---|---|---|---|---|



---| **09 EC2** | All services on one VM with PM2 | First real deployment | Manual recovery, no auto scaling |



## 📁 Project Structure## 🔧 Microservices| **10 Docker** | Each service in its own container | Isolation + repeatable images | Still one machine; if node dies, all containers die |



```| **11 EKS/K8s** | Containers orchestrated across nodes | **Auto-healing, scaling, rollout, traffic routing** | More concepts to learn (worth it for production) |

📦 11-Mirco-app-deployment-on-EKS/

│| # | Service | Language | Port | Description |

├── 📂 src/                              # 🔧 Source Code (11 Microservices)

│   ├── adservice/                      # Java - Ad Service|---|---------|----------|------|-------------|---

│   ├── cartservice/                    # C# - Cart Service

│   ├── checkoutservice/                # Go - Checkout Service| 1 | **Frontend** | Go | 8080 | Web UI for the shop |

│   ├── currencyservice/                # Node.js - Currency Service

│   ├── emailservice/                   # Python - Email Service| 2 | **Cart Service** | C# (.NET) | 7070 | Manages shopping cart (Redis backend) |## Why Move from Docker to Kubernetes?

│   ├── frontend/                       # Go - Frontend UI ⭐

│   ├── loadgenerator/                  # Python - Load Generator| 3 | **Product Catalog** | Go | 3550 | Product listing and details |

│   ├── paymentservice/                 # Node.js - Payment Service

│   ├── productcatalogservice/          # Go - Product Catalog| 4 | **Currency Service** | Node.js | 7000 | Currency conversion |### Docker solved packaging — not production operations

│   ├── recommendationservice/          # Python - Recommendations

│   └── shippingservice/                # Go - Shipping Service| 5 | **Payment Service** | Node.js | 50051 | Payment processing |

│

├── 📂 kubernetes-manifests/             # ☸️ K8s Deployment Files| 6 | **Shipping Service** | Go | 50051 | Shipping cost calculation |In Project 10 you learned:

│   ├── namespace.yaml                  # mini-flipkart namespace

│   ├── kustomization.yaml              # Kustomize config| 7 | **Email Service** | Python | 8080 | Order confirmation emails |

│   ├── ingress.yaml                    # Ingress rules

│   ├── frontend.yaml                   # Frontend deployment| 8 | **Checkout Service** | Go | 5050 | Order checkout orchestration |- Build image once → run anywhere

│   ├── redis.yaml                      # Redis deployment

│   └── *service.yaml                   # All service deployments| 9 | **Recommendation** | Python | 8080 | Product recommendations |- Each microservice in its own container

│

├── 📂 release/                          # 📦 Pre-built manifests| 10 | **Ad Service** | Java | 9555 | Advertisement serving |- `docker ps`, `docker logs`, `docker exec` for debugging

│   └── kubernetes-manifests.yaml       # Combined K8s manifest

│| 11 | **Load Generator** | Python | - | Traffic simulation (optional) |

├── 🐳 docker-compose.yaml               # Build from source (dev)

├── 🐳 docker-compose-ecr.yaml           # ECR images (prod-like)| - | **Redis** | Redis | 6379 | Cart data storage |But on a single Docker host:

├── 🔧 ekssetup.sh                       # EC2 setup script

└── 📖 README.md                         # This file

```

---| Problem | What happens |

---

|---|---|

## 🚀 Deployment Steps

## 📦 Prerequisites| Container crash | Stays down until you manually `docker run` again |

### 📦 STEP 1: Create EC2 & Install Software

| Server crash | All 12 containers go offline together |

```bash

# Launch EC2 (Ubuntu 22.04/24.04) with:- **AWS Account** with appropriate permissions| Traffic spike | You manually add more containers / bigger EC2 |

# - Instance Type: t3.medium (or t2.micro for free tier)

# - IAM Role: mini-flipkart-devops-ec2-role (AdministratorAccess)- **EC2 Instance** (Ubuntu 22.04/24.04) for DevOps server| New app version | Manual stop old container, start new one (downtime risk) |

# - Security Group: Allow SSH (22), HTTP (80), HTTPS (443)

- **Docker** and **Docker Compose**| Secret/config change | Rebuild or re-run with new `-e` flags |

# SSH into EC2

ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>- **kubectl** for Kubernetes management



# Clone repository- **AWS CLI** configured with credentials### Kubernetes (on EKS) gives you production behavior

git clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git

cd 11-Mirco-app-deployment-on-EKS- **eksctl** (optional, for EKS management)



# Run setup script (installs Docker, kubectl, AWS CLI, Helm, eksctl)| Capability | Real-life meaning |

bash ekssetup.sh

---|---|---|

# ⚠️ IMPORTANT: Reconnect SSH for docker group

exit| **Auto-healing** | Pod dies → controller creates a new pod automatically |

ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>

## 🚀 Deployment Options| **Self-healing nodes** | Unhealthy node → workloads rescheduled to healthy nodes |

# Verify installations

docker --version| **Scaling** | Increase replicas when load increases |

kubectl version --client

aws --version### Option 1: Docker Compose (Local/Development)| **Rolling updates** | Deploy v2 without taking whole app down |

```

| **Service discovery** | Services talk by DNS name (`api-gateway`, `mysql`) |

---

**Use Case:** Build images from source code for local development and testing.| **Ingress routing** | One domain routes `/` to frontend and `/api` to gateway |

### 🐳 STEP 2: Docker Compose - Build from Source

| **Secrets management** | Passwords in Secret object, not hardcoded in image |

> **Path:** `src/*` → `docker-compose.yaml`

**File:** `docker-compose.yaml`

```bash

cd ~/11-Mirco-app-deployment-on-EKS> **Simple story:** Docker packs your lunch. Kubernetes runs the entire restaurant — staff replacement, more counters during rush hour, and routing customers to the right counter.



# Build and run all services from source```bash

docker compose up -d --build

# Clone the repository---

# Check status

docker compose psgit clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git



# Test applicationcd 11-Mirco-app-deployment-on-EKS## Kubernetes Architecture (Control Plane + Worker Nodes)

curl http://localhost:8080



# View logs

docker compose logs -f frontend# Build and run all services```mermaid



# Stop when done testingdocker compose up -d --buildflowchart TB

docker compose down

```  classDef control fill:#ede9fe,stroke:#7c3aed,stroke-width:2px,color:#111827;



| Access URL | Port |# Check status  classDef worker fill:#dbeafe,stroke:#2563eb,stroke-width:2px,color:#111827;

|------------|------|

| `http://<EC2-IP>:8080` | 8080 |docker compose ps  classDef store fill:#ffedd5,stroke:#f97316,stroke-width:2px,color:#111827;



---



### 📤 STEP 3: Build & Push Images to ECR# View logs  subgraph CP["Control Plane (EKS manages this for you)"]



#### 3.1 Create ECR Repositoriesdocker compose logs -f frontend    API["API Server\nFront door of cluster"]



```bash    ETCD["etcd\nCluster memory / state DB"]

# Create all 11 ECR repositories

aws ecr create-repository --repository-name adservice --region us-east-1# Access application    SCH["Scheduler\nPicks best node"]

aws ecr create-repository --repository-name cartservice --region us-east-1

aws ecr create-repository --repository-name checkoutservice --region us-east-1curl http://localhost:8080    CTL["Controllers\nKeep desired state"]

aws ecr create-repository --repository-name currencyservice --region us-east-1

aws ecr create-repository --repository-name emailservice --region us-east-1  end

aws ecr create-repository --repository-name frontend --region us-east-1

aws ecr create-repository --repository-name paymentservice --region us-east-1# Stop all services

aws ecr create-repository --repository-name productcatalogservice --region us-east-1

aws ecr create-repository --repository-name recommendationservice --region us-east-1docker compose down  subgraph W1["Worker Node 1"]

aws ecr create-repository --repository-name shippingservice --region us-east-1

aws ecr create-repository --repository-name loadgenerator --region us-east-1```    K1["kubelet agent"]

```

    P1["Pod: api-gateway"]

#### 3.2 Login to ECR

---    P2["Pod: auth-service"]

```bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com  end

```

### Option 2: Docker Compose with ECR Images

#### 3.3 Build & Push All Images

  subgraph W2["Worker Node 2"]

```bash

cd ~/11-Mirco-app-deployment-on-EKS/src**Use Case:** Deploy using pre-built images from Amazon ECR (faster deployment, no build required).    K2["kubelet agent"]



# 📧 emailservice    P3["Pod: web"]

cd emailservice && docker build -t emailservice . && \

docker tag emailservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/emailservice:latest && \**File:** `docker-compose-ecr.yaml`    P4["Pod: product-service"]

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/emailservice:latest && cd ..

  end

# ✅ checkoutservice

cd checkoutservice && docker build -t checkoutservice . && \#### Step 1: Setup EC2 DevOps Server

docker tag checkoutservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/checkoutservice:latest && \

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/checkoutservice:latest && cd ..  API <--> ETCD



# 💡 recommendationservice```bash  API --> SCH

cd recommendationservice && docker build -t recommendationservice . && \

docker tag recommendationservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/recommendationservice:latest && \# Run the setup script (installs Docker, kubectl, AWS CLI, etc.)  API --> CTL

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/recommendationservice:latest && cd ..

bash ekssetup.sh  CTL <--> ETCD

# 🖥️ frontend

cd frontend && docker build -t frontend . && \  SCH --> API

docker tag frontend:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/frontend:latest && \

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/frontend:latest && cd ..# Reconnect SSH for docker group to take effect  API --> K1



# 💰 paymentserviceexit  API --> K2

cd paymentservice && docker build -t paymentservice . && \

docker tag paymentservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/paymentservice:latest && \# ssh back in  K1 --> P1

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/paymentservice:latest && cd ..

```  K1 --> P2

# 📦 productcatalogservice

cd productcatalogservice && docker build -t productcatalogservice . && \  K2 --> P3

docker tag productcatalogservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/productcatalogservice:latest && \

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/productcatalogservice:latest && cd ..#### Step 2: Create ECR Repositories  K2 --> P4



# 🛒 cartservice (note: Dockerfile in src subdirectory)

cd cartservice/src && docker build -t cartservice . && \

docker tag cartservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/cartservice:latest && \```bash  class API,ETCD,SCH,CTL control

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/cartservice:latest && cd ../..

# Create all 11 ECR repositories  class K1,K2,P1,P2,P3,P4 worker

# 🔄 loadgenerator

cd loadgenerator && docker build -t loadgenerator . && \aws ecr create-repository --repository-name adservice --region us-east-1  class ETCD store

docker tag loadgenerator:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/loadgenerator:latest && \

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/loadgenerator:latest && cd ..aws ecr create-repository --repository-name cartservice --region us-east-1```



# 💵 currencyserviceaws ecr create-repository --repository-name checkoutservice --region us-east-1

cd currencyservice && docker build -t currencyservice . && \

docker tag currencyservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/currencyservice:latest && \aws ecr create-repository --repository-name currencyservice --region us-east-1| Component | Role in simple words |

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/currencyservice:latest && cd ..

aws ecr create-repository --repository-name emailservice --region us-east-1|---|---|

# 🚚 shippingservice

cd shippingservice && docker build -t shippingservice . && \aws ecr create-repository --repository-name frontend --region us-east-1| **API Server** | Receives all requests (`kubectl apply`, scheduler, controllers) |

docker tag shippingservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/shippingservice:latest && \

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/shippingservice:latest && cd ..aws ecr create-repository --repository-name paymentservice --region us-east-1| **etcd** | Stores desired + current state (deployments, pods, services) |



# 📢 adserviceaws ecr create-repository --repository-name productcatalogservice --region us-east-1| **Scheduler** | Finds a node with enough CPU/RAM and assigns pod |

cd adservice && docker build -t adservice . && \

docker tag adservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/adservice:latest && \aws ecr create-repository --repository-name recommendationservice --region us-east-1| **Controllers** | Watch etcd and fix drift (example: want 2 pods, only 1 running → create 1 more) |

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/adservice:latest && cd ..

```aws ecr create-repository --repository-name shippingservice --region us-east-1| **kubelet** | Agent on each worker node; pulls image and starts containers |



---aws ecr create-repository --repository-name loadgenerator --region us-east-1| **Pod** | Smallest run unit (1+ containers sharing network) |



### 🚀 STEP 4: Docker Compose - ECR Images```



> **File:** `docker-compose-ecr.yaml`---



```bash#### Step 3: Build and Push Images to ECR

cd ~/11-Mirco-app-deployment-on-EKS

## What Happens When DevOps Applies a Deployment (Animated Flow)

# Update docker-compose-ecr.yaml with your AWS Account ID (if needed)

# Images should already be configured```bash



# Deploy using ECR images# Login to ECR**Scenario:** DevOps engineer runs `kubectl apply -f 20-api-gateway.yaml` and says *"I need 2 replicas of api-gateway deployment."*

docker compose -f docker-compose-ecr.yaml up -d

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

# Check all containers running

docker compose -f docker-compose-ecr.yaml ps```mermaid



# Test application# Navigate to src directorysequenceDiagram

curl http://localhost:80

cd src  autonumber

# ✅ Verify "Mini Flipkart" branding appears!

  participant Dev as DevOps Engineer

# Stop when done

docker compose -f docker-compose-ecr.yaml down# Build and push each service (replace <AWS_ACCOUNT_ID> with your account ID)  participant API as API Server

```

  participant ETCD as etcd

| Access URL | Port |

|------------|------|# emailservice  participant CTL as Deployment Controller

| `http://<EC2-IP>:80` | 80 |

cd emailservice && docker build -t emailservice . && docker tag emailservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/emailservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/emailservice:latest && cd ..  participant SCH as Scheduler

---

  participant KUB as kubelet (Worker Node)

### ☸️ STEP 5: Kubernetes (EKS) Production Deployment

# checkoutservice  participant POD as Pod / Container

#### 5.1 Create EKS Cluster (Console or CLI)

cd checkoutservice && docker build -t checkoutservice . && docker tag checkoutservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/checkoutservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/checkoutservice:latest && cd ..

```bash

# Update kubeconfig  Dev->>API: kubectl apply Deployment (replicas=2)

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1

# recommendationservice  API->>ETCD: Save desired state

# Verify connection

kubectl get nodescd recommendationservice && docker build -t recommendationservice . && docker tag recommendationservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/recommendationservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/recommendationservice:latest && cd ..  ETCD-->>CTL: Watch event: new Deployment

```

  CTL->>ETCD: Create 2 Pod objects (pending)

#### 5.2 Update Images in kubernetes-manifests (if needed)

# frontend  SCH->>ETCD: Read unscheduled pods

Images are already configured in `kubernetes-manifests/*.yaml` files with ECR paths:

```yamlcd frontend && docker build -t frontend . && docker tag frontend:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/frontend:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/frontend:latest && cd ..  SCH->>API: Bind pod to Node-A and Node-B

image: <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/<service>:latest

```  API->>ETCD: Update pod -> node assignment



#### 5.3 Deploy to EKS# paymentservice  KUB->>API: What pods should run on my node?



```bashcd paymentservice && docker build -t paymentservice . && docker tag paymentservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/paymentservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/paymentservice:latest && cd ..  API-->>KUB: Run api-gateway pod spec

cd ~/11-Mirco-app-deployment-on-EKS

  KUB->>POD: Pull image from ECR + start container

# Pull latest code

git pull origin main# productcatalogservice  POD-->>KUB: Container healthy (readiness probe)



# Deploy using Kustomize (recommended)cd productcatalogservice && docker build -t productcatalogservice . && docker tag productcatalogservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/productcatalogservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/productcatalogservice:latest && cd ..  KUB->>API: Pod status = Running

kubectl apply -k kubernetes-manifests/

  API->>ETCD: Update current state

# Watch pods come up

kubectl get pods -n mini-flipkart -w# cartservice (note: Dockerfile is in src subdirectory)```



# Check all resourcescd cartservice/src && docker build -t cartservice . && docker tag cartservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/cartservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/cartservice:latest && cd ../..

kubectl get all -n mini-flipkart

**If a pod crashes later:**

# Check services

kubectl get svc -n mini-flipkart# loadgenerator

```

cd loadgenerator && docker build -t loadgenerator . && docker tag loadgenerator:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/loadgenerator:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/loadgenerator:latest && cd ..```mermaid

#### 5.4 Install NGINX Ingress Controller

sequenceDiagram

```bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml# currencyservice  autonumber



# Wait for LoadBalancercd currencyservice && docker build -t currencyservice . && docker tag currencyservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/currencyservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/currencyservice:latest && cd ..  participant POD as Pod (crashed)

kubectl get svc -n ingress-nginx ingress-nginx-controller

  participant KUB as kubelet

# Get LoadBalancer URL

kubectl get ingress -n mini-flipkart# shippingservice  participant API as API Server

```

cd shippingservice && docker build -t shippingservice . && docker tag shippingservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/shippingservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/shippingservice:latest && cd ..  participant ETCD as etcd

#### 5.5 Access Application

  participant CTL as Deployment Controller

```bash

# Add to /etc/hosts (on your local machine)# adservice  participant SCH as Scheduler

<LOADBALANCER-IP>  mini-flipkart.com

cd adservice && docker build -t adservice . && docker tag adservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/adservice:latest && docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/adservice:latest && cd ..  participant NEW as New Pod

# Access in browser

http://mini-flipkart.com```

```

  POD--xKUB: Container exits / fails health check

---

#### Step 4: Deploy with Docker Compose ECR  KUB->>API: Pod status = Failed

## ⚡ Quick Commands

  API->>ETCD: Update state

```bash

# ═══════════════════════════════════════════════════════════════```bash  ETCD-->>CTL: Desired replicas still = 2, running = 1

# 📦 EC2 SETUP

# ═══════════════════════════════════════════════════════════════# Update docker-compose-ecr.yaml with your AWS Account ID (if needed)  CTL->>ETCD: Create replacement Pod

bash ekssetup.sh                                    # Install all tools

# Then run:  SCH->>API: Schedule replacement on healthy node

# ═══════════════════════════════════════════════════════════════

# 🐳 DOCKER COMPOSE (Source)docker compose -f docker-compose-ecr.yaml up -d  API->>NEW: kubelet starts new container

# ═══════════════════════════════════════════════════════════════

docker compose up -d --build                        # Build & run  NEW-->>API: Pod Running again

docker compose ps                                   # Check status

docker compose down                                 # Stop all# Check status```



# ═══════════════════════════════════════════════════════════════docker compose -f docker-compose-ecr.yaml ps

# 🐳 DOCKER COMPOSE (ECR)

# ═══════════════════════════════════════════════════════════════That is **auto-healing** — no manual `docker run`.

docker compose -f docker-compose-ecr.yaml up -d    # Run ECR images

docker compose -f docker-compose-ecr.yaml ps       # Check status# Access application

docker compose -f docker-compose-ecr.yaml down     # Stop all

curl http://localhost:80---

# ═══════════════════════════════════════════════════════════════

# ☸️ KUBERNETES (EKS)

# ═══════════════════════════════════════════════════════════════

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1# Stop## Kubernetes Objects Used in This Project

kubectl get nodes                                   # Check nodes

kubectl apply -k kubernetes-manifests/             # Deploy appdocker compose -f docker-compose-ecr.yaml down

kubectl get pods -n mini-flipkart                  # Check pods

kubectl get svc -n mini-flipkart                   # Check services``````mermaid

kubectl get ingress -n mini-flipkart               # Check ingress

kubectl logs <pod-name> -n mini-flipkart           # View logsflowchart LR

kubectl delete -k kubernetes-manifests/            # Delete all

```---  classDef obj fill:#f1f5f9,stroke:#334155,stroke-width:2px,color:#111827;



---



## 🔧 Troubleshooting### Option 3: Kubernetes (EKS Production)  NS["Namespace\nmini-flipkart"]



<details>  CM["ConfigMap\nservice URLs, DB host"]

<summary>❌ Pods not starting</summary>

**Use Case:** Production-grade deployment on Amazon EKS with high availability.  SEC["Secret\nDB password, JWT"]

```bash

kubectl describe pod <pod-name> -n mini-flipkart  SS["StatefulSet\nMySQL + persistent disk"]

kubectl logs <pod-name> -n mini-flipkart

```**Directory:** `kubernetes-manifests/`  DEP["Deployment\nstateless microservices"]

</details>

  SVC["Service\nstable internal DNS"]

<details>

<summary>❌ Cannot pull ECR images</summary>#### Kubernetes Manifest Files  ING["Ingress\ndomain routing"]



```bash

# Verify node role has AmazonEC2ContainerRegistryReadOnly policy

aws ecr describe-images --repository-name frontend --region us-east-1| File | Purpose |  NS --> CM

```

</details>|------|---------|  NS --> SEC



<details>| `namespace.yaml` | Creates `mini-flipkart` namespace |  NS --> SS

<summary>❌ kubectl access denied</summary>

| `adservice.yaml` | Ad Service Deployment + Service |  NS --> DEP

```bash

# Add IAM role to EKS access entries| `cartservice.yaml` | Cart Service Deployment + Service |  DEP --> SVC

# EKS Console → Access → Create access entry → Add AmazonEKSClusterAdminPolicy

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1| `checkoutservice.yaml` | Checkout Service Deployment + Service |  SVC --> ING

```

</details>| `currencyservice.yaml` | Currency Service Deployment + Service |



<details>| `emailservice.yaml` | Email Service Deployment + Service |  class NS,CM,SEC,SS,DEP,SVC,ING obj

<summary>❌ Node group Fleet Request quota error</summary>

| `frontend.yaml` | Frontend Deployment + Service |```

```bash

# Use Spot instances with 1 node| `paymentservice.yaml` | Payment Service Deployment + Service |

aws eks create-nodegroup \

  --cluster-name mini-flipkart-eks \| `productcatalogservice.yaml` | Product Catalog Deployment + Service || Object | Why we use it in mini-flipkart |

  --nodegroup-name mf-nodes \

  --node-role arn:aws:iam::<ACCOUNT_ID>:role/mini-flipkart-eks-node-role \| `recommendationservice.yaml` | Recommendation Service Deployment + Service ||---|---|

  --subnets subnet-xxx subnet-yyy \

  --instance-types t3.small \| `redis.yaml` | Redis Deployment + Service || **Namespace** | Isolate all Project 11 resources under `mini-flipkart` |

  --capacity-type SPOT \

  --scaling-config minSize=1,maxSize=2,desiredSize=1 \| `shippingservice.yaml` | Shipping Service Deployment + Service || **ConfigMap** | Non-secret config (service URLs, DB host/port/name) |

  --region us-east-1

```| `ingress.yaml` | Ingress for external access || **Secret** | Passwords and JWT secret |

</details>

| `kustomization.yaml` | Kustomize configuration || **StatefulSet** | MySQL needs stable identity + persistent volume |

---

| **Deployment** | Stateless services (gateway, auth, product, web, etc.) |

## 📊 Deployment Summary

#### Deploy to EKS| **Service** | Stable DNS name inside cluster (`api-gateway:3000`) |

| Stage | File/Path | Description |

|-------|-----------|-------------|| **Ingress** | Map domain `mini-flipkart.local` to web + API paths |

| 🔧 Setup | `ekssetup.sh` | Install Docker, kubectl, AWS CLI |

| 🐳 Dev | `docker-compose.yaml` | Build from `src/*` |```bash

| 📤 Build | `src/*` → ECR | Push images to ECR |

| 🚀 Test | `docker-compose-ecr.yaml` | Test with ECR images |# Connect to EKS cluster---

| ☸️ Prod | `kubernetes-manifests/` | Deploy to EKS |

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1

---

## mini-flipkart on EKS — End Architecture

## 👤 Author

# Verify connection

**devopsmate7**

kubectl get nodes```mermaid

- GitHub: [@devopsmate7](https://github.com/devopsmate7)

- Repository: [11-Mirco-app-deployment-on-EKS](https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS)flowchart TB



---# Deploy using Kustomize (recommended)  classDef user fill:#dcfce7,stroke:#16a34a,stroke-width:2px,color:#111827;



## 📝 Licensekubectl apply -k kubernetes-manifests/  classDef net fill:#dbeafe,stroke:#2563eb,stroke-width:2px,color:#111827;



This project is licensed under the Apache License 2.0.  classDef app fill:#ede9fe,stroke:#7c3aed,stroke-width:2px,color:#111827;



---# Or deploy files individually  classDef data fill:#ffedd5,stroke:#f97316,stroke-width:2px,color:#111827;



<p align="center">kubectl apply -f kubernetes-manifests/namespace.yaml

  <b>⭐ Star this repo if you found it helpful! ⭐</b>

</p>kubectl apply -f kubernetes-manifests/  U["User Browser"]



<p align="center">  DOM["Domain: mini-flipkart.local"]

  Made with ❤️ for DevOps Learning

</p># Watch pods come up  ING["Ingress Controller\n(NGINX Ingress)"]


kubectl get pods -n mini-flipkart -w  WEB["Service: web\n(Nginx + frontend)"]

  GW["Service: api-gateway"]

# Check all resources  MS["auth / user / product / cart / order / payment / inventory / notification / review"]

kubectl get all -n mini-flipkart  MYSQL["StatefulSet: mysql\nPVC disk"]



# Check ingress  U --> DOM --> ING

kubectl get ingress -n mini-flipkart  ING -->|"/"| WEB

```  ING -->|"/api"| GW

  WEB --> GW

---  GW --> MS

  MS --> MYSQL

## ☁️ AWS Infrastructure Setup

  class U,DOM user

### Step 1: Create VPC  class ING,WEB,GW net

  class MS app

| Resource | Name | Value |  class MYSQL data

|----------|------|-------|```

| VPC | `mini-flipkart-eks-vpc` | CIDR: `10.0.0.0/16` |

**Traffic story:**

### Step 2: Create Subnets

1. User opens `http://mini-flipkart.local`

| Subnet | AZ | CIDR | Type |2. Hostname resolves to Ingress external IP (or `/etc/hosts` mapping for lab)

|--------|-----|------|------|3. Ingress sends `/` to `web` pods (frontend)

| `mini-flipkart-public-1a` | us-east-1a | `10.0.1.0/24` | Public |4. Frontend calls `/api/...` → Ingress routes to `api-gateway`

| `mini-flipkart-public-1b` | us-east-1b | `10.0.2.0/24` | Public |5. Gateway forwards to correct microservice Service

| `mini-flipkart-private-1a` | us-east-1a | `10.0.11.0/24` | Private |6. Services read/write MySQL StatefulSet

| `mini-flipkart-private-1b` | us-east-1b | `10.0.12.0/24` | Private |

---

> **Note:** Enable auto-assign public IPv4 for public subnets only.

# Phase 1 — Create EKS Cluster (AWS Console)

### Step 3: Create Internet Gateway

Use AWS Console (clear clicks). Replace names if needed.

| Resource | Name | Attach To |

|----------|------|-----------|### Step 1 — Create VPC network

| IGW | `mini-flipkart-igw` | `mini-flipkart-eks-vpc` |

**AWS Console → VPC → Your VPCs → Create VPC**

### Step 4: Create NAT Gateway

| Field | Value |

| Resource | Name | Subnet | Elastic IP ||---|---|

|----------|------|--------|------------|| Name | `mini-flipkart-eks-vpc` |

| NAT | `mini-flipkart-nat-1a` | `mini-flipkart-public-1a` | Allocate new || IPv4 CIDR | `10.0.0.0/16` |



### Step 5: Create Route Tables**Create 2 public subnets (2 AZs required for EKS):**



**Public Route Table:** `mini-flipkart-public-rt`| Subnet name | AZ | CIDR |

| Destination | Target ||---|---|---|

|-------------|--------|| `mini-flipkart-public-1a` | `us-east-1a` | `10.0.1.0/24` |

| `10.0.0.0/16` | Local || `mini-flipkart-public-1b` | `us-east-1b` | `10.0.2.0/24` |

| `0.0.0.0/0` | `mini-flipkart-igw` |

For each public subnet: **Actions → Edit subnet settings → Enable auto-assign public IPv4**.

Associate with: `mini-flipkart-public-1a`, `mini-flipkart-public-1b`

**Create Internet Gateway** → attach to `mini-flipkart-eks-vpc`.

**Private Route Table:** `mini-flipkart-private-rt`

| Destination | Target |**Create route table** `mini-flipkart-public-rt`:

|-------------|--------|

| `10.0.0.0/16` | Local |- Route: `0.0.0.0/0` → Internet Gateway

| `0.0.0.0/0` | `mini-flipkart-nat-1a` |- Associate with both public subnets



Associate with: `mini-flipkart-private-1a`, `mini-flipkart-private-1b`**Create security group** `mini-flipkart-eks-sg` in this VPC:



### Step 6: Create Security Groups| Type | Port | Source |

|---|---|---|

**EKS Security Group:** `mini-flipkart-eks-sg`| HTTP | 80 | `0.0.0.0/0` |

| Type | Port | Source || HTTPS | 443 | `0.0.0.0/0` |

|------|------|--------|

| HTTP | 80 | `0.0.0.0/0` |---

| HTTPS | 443 | `0.0.0.0/0` |

| All Traffic | All | `10.0.0.0/16` |### Step 2 — Create IAM roles



**DevOps EC2 Security Group:** `mini-flipkart-devops-sg`**Role A: EKS Cluster Role**

| Type | Port | Source |

|------|------|--------|- IAM → Roles → Create role → Service: **EKS - Cluster**

| SSH | 22 | My IP |- Name: `mini-flipkart-eks-cluster-role`

- Attach: `AmazonEKSClusterPolicy`

### Step 7: Create IAM Roles

**Role B: EKS Node Group Role**

**Role 1: EKS Cluster Role**

| Field | Value |- IAM → Roles → Create role → Service: **EC2**

|-------|-------|- Name: `mini-flipkart-eks-node-role`

| Name | `mini-flipkart-eks-cluster-role` |- Attach:

| Trusted Entity | AWS Service → EKS → EKS - Cluster |  - `AmazonEKSWorkerNodePolicy`

| Policy | `AmazonEKSClusterPolicy` |  - `AmazonEC2ContainerRegistryReadOnly`

  - `AmazonEKS_CNI_Policy`

**Role 2: EKS Node Role**

| Field | Value |---

|-------|-------|

| Name | `mini-flipkart-eks-node-role` |### Step 3 — Create EKS cluster

| Trusted Entity | AWS Service → EC2 |

| Policies | `AmazonEKSWorkerNodePolicy`, `AmazonEC2ContainerRegistryReadOnly`, `AmazonEKS_CNI_Policy` |**AWS Console → EKS → Clusters → Create cluster**



**Role 3: DevOps EC2 Role (Optional)**| Setting | Value |

| Field | Value ||---|---|

|-------|-------|| Name | `mini-flipkart-eks` |

| Name | `mini-flipkart-devops-ec2-role` || Kubernetes version | Latest stable |

| Trusted Entity | AWS Service → EC2 || Cluster role | `mini-flipkart-eks-cluster-role` |

| Policy | `AdministratorAccess` (or restricted policies for production) || VPC | `mini-flipkart-eks-vpc` |

| Subnets | both public subnets |

### Step 8: Create EKS Cluster| Cluster security group | `mini-flipkart-eks-sg` |

| Endpoint access | Public |

| Setting | Value |

|---------|-------|Wait until cluster status = **Active** (10–20 min).

| Name | `mini-flipkart-eks` |

| Kubernetes Version | Latest (e.g., 1.35) |---

| Cluster Role | `mini-flipkart-eks-cluster-role` |

| VPC | `mini-flipkart-eks-vpc` |### Step 4 — Create node group

| Subnets | All 4 subnets |

| Security Group | `mini-flipkart-eks-sg` |**Cluster → Compute → Add node group**

| Endpoint Access | Public and Private |

| Authentication Mode | EKS API and ConfigMap || Setting | Value |

|---|---|

> **Important:** Allow cluster administrator access for your IAM principal.| Name | `mini-flipkart-nodes` |

| Node IAM role | `mini-flipkart-eks-node-role` |

### Step 9: Create Node Group| Instance type | `t3.medium` |

| Desired size | `2` |

| Setting | Value || Min / Max | `1` / `3` |

|---------|-------|| Disk | `20 GiB` |

| Name | `mini-flipkart-nodes` || Subnets | both public subnets |

| Node Role | `mini-flipkart-eks-node-role` |

| AMI Type | Amazon Linux 2023 |Wait until node group status = **Active** and nodes show **Ready**.

| Instance Type | `t3.medium` (or `t3.small` for cost savings) |

| Capacity Type | On-Demand (or Spot for cost savings) |---

| Disk Size | 20 GiB |

| Desired Size | 2 |# Phase 2 — Connect to Cluster (kubectl)

| Minimum Size | 1 |

| Maximum Size | 3 |Use a machine with AWS CLI + kubectl (CloudShell, EC2 bastion, or laptop).

| Subnets | **Private subnets only** |

### Step 1 — Install kubectl (one time)

> **Note:** For free tier accounts with quota limits, use Spot instances with 1 node:

> ```bashDownload kubectl binary for Linux amd64, make executable, move to `/usr/local/bin/kubectl`, verify with `kubectl version --client`.

> aws eks create-nodegroup \

>   --cluster-name mini-flipkart-eks \### Step 2 — Configure kubeconfig

>   --nodegroup-name mf-nodes \

>   --node-role arn:aws:iam::<ACCOUNT_ID>:role/mini-flipkart-eks-node-role \Run:

>   --subnets subnet-xxx subnet-yyy \

>   --instance-types t3.small \```bash

>   --capacity-type SPOT \aws eks update-kubeconfig --region us-east-1 --name mini-flipkart-eks

>   --scaling-config minSize=1,maxSize=2,desiredSize=1 \```

>   --region us-east-1

> ```This updates `~/.kube/config` with cluster API endpoint and IAM auth.



---### Step 3 — Verify connection



## ⚡ Quick Start Commands```bash

kubectl get nodes

```bashkubectl get ns

# 1. Setup EC2 and install tools```

bash ekssetup.sh

You should see 2 worker nodes in `Ready` state.

# 2. Connect to EKS

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1---



# 3. Verify nodes# Phase 3 — Build and Push Images to ECR

kubectl get nodes

### Step 1 — Create ECR repositories (Console)

# 4. Deploy application

kubectl apply -k kubernetes-manifests/**ECR → Create repository** for each image:



# 5. Check pods| Repository name |

kubectl get pods -n mini-flipkart|---|

| `mini-flipkart-api-gateway` |

# 6. Get Ingress URL (after installing NGINX Ingress Controller)| `mini-flipkart-auth-service` |

kubectl get svc -n ingress-nginx ingress-nginx-controller| `mini-flipkart-user-service` |

| `mini-flipkart-product-service` |

# 7. Access application| `mini-flipkart-cart-service` |

# Add to /etc/hosts: <LOADBALANCER-IP> mini-flipkart.com| `mini-flipkart-order-service` |

# Then visit: http://mini-flipkart.com| `mini-flipkart-payment-service` |

```| `mini-flipkart-inventory-service` |

| `mini-flipkart-notification-service` |

---| `mini-flipkart-review-service` |

| `mini-flipkart-web` |

## 🌐 Accessing the Application

### Step 2 — Login to ECR

### Docker Compose

| File | URL |```bash

|------|-----|aws ecr get-login-password --region us-east-1 | \

| `docker-compose.yaml` | `http://localhost:8080` |docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

| `docker-compose-ecr.yaml` | `http://localhost:80` |```



### Kubernetes (EKS)### Step 3 — Build, tag, push (repeat per service)

```bash

# Install NGINX Ingress Controller (if not installed)Example for API Gateway from project root:

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml

```bash

# Get LoadBalancer URLdocker build -t mini-flipkart-api-gateway -f services/api-gateway/Dockerfile .

kubectl get svc -n ingress-nginx ingress-nginx-controllerdocker tag mini-flipkart-api-gateway:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/mini-flipkart-api-gateway:latest

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/mini-flipkart-api-gateway:latest

# Add to /etc/hosts (on your local machine)```

<LOADBALANCER-IP>  mini-flipkart.com

Web frontend (uses K8s nginx config):

# Access

http://mini-flipkart.com```bash

```docker build -t mini-flipkart-web -f nginx/Dockerfile.k8s .

docker tag mini-flipkart-web:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/mini-flipkart-web:latest

---docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/mini-flipkart-web:latest

```

## 📁 Project Structure

Repeat same pattern for each service Dockerfile under `services/*/Dockerfile`.

```

11-Mirco-app-deployment-on-EKS/### Step 4 — Replace image placeholder in YAML

├── src/                          # Microservices source code

│   ├── adservice/               # Java - Ad ServiceIn all files under `k8s/`, replace:

│   ├── cartservice/             # C# - Cart Service

│   ├── checkoutservice/         # Go - Checkout Service```text

│   ├── currencyservice/         # Node.js - Currency ServiceREPLACE_ECR_REGISTRY

│   ├── emailservice/            # Python - Email Service```

│   ├── frontend/                # Go - Frontend UI

│   ├── loadgenerator/           # Python - Load Generatorwith:

│   ├── paymentservice/          # Node.js - Payment Service

│   ├── productcatalogservice/   # Go - Product Catalog```text

│   ├── recommendationservice/   # Python - Recommendations<AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

│   └── shippingservice/         # Go - Shipping Service```

├── kubernetes-manifests/         # K8s deployment files (with namespace)

│   ├── namespace.yaml           # mini-flipkart namespace---

│   ├── kustomization.yaml       # Kustomize config

│   ├── ingress.yaml             # Ingress rules# Phase 4 — Deploy mini-flipkart to EKS (Clear Order)

│   └── *.yaml                   # Service deployments

├── release/                      # Pre-built manifests (with ECR images)Deploy in this exact order so dependencies exist before pods start.

│   └── kubernetes-manifests.yaml

├── docker-compose.yaml           # Local development (build from source)| Order | File / Action | Purpose |

├── docker-compose-ecr.yaml       # ECR images deployment|---|---|---|

├── ekssetup.sh                   # EC2 setup script| 1 | `k8s/00-namespace.yaml` | Create namespace |

└── README.md                     # This file| 2 | `k8s/01-configmap.yaml` | App config |

```| 3 | Copy `k8s/02-secrets.example.yaml` → `k8s/02-secrets.yaml` | Secrets |

| 4 | `kubectl create configmap mysql-init --from-file=database/ -n mini-flipkart` | DB schema + seed |

---| 5 | `k8s/10-mysql-statefulset.yaml` | MySQL with persistent volume |

| 6 | Wait for MySQL ready | `kubectl get pods -n mini-flipkart -w` |

## 🔧 Troubleshooting| 7 | `k8s/21-backend-services.yaml` | 9 microservices |

| 8 | `k8s/20-api-gateway.yaml` | API gateway |

### Pods not starting| 9 | `k8s/30-web-frontend.yaml` | Frontend nginx |

```bash| 10 | Install Ingress controller | NGINX Ingress |

kubectl describe pod <pod-name> -n mini-flipkart| 11 | `k8s/40-ingress.yaml` | Domain routing |

kubectl logs <pod-name> -n mini-flipkart

```### Commands



### Nodes not joining cluster```bash

- Check node IAM role has required policieskubectl apply -f k8s/00-namespace.yaml

- Check NAT Gateway is working for private subnetskubectl apply -f k8s/01-configmap.yaml

- Check Security Group allows VPC internal traffickubectl apply -f k8s/02-secrets.yaml

kubectl create configmap mysql-init --from-file=database/ -n mini-flipkart

### Cannot pull images from ECRkubectl apply -f k8s/10-mysql-statefulset.yaml

```bash

# Verify node role has AmazonEC2ContainerRegistryReadOnly policykubectl wait --for=condition=ready pod -l app=mysql -n mini-flipkart --timeout=300s

# Check ECR repository exists and has images

aws ecr describe-images --repository-name frontend --region us-east-1kubectl apply -f k8s/21-backend-services.yaml

```kubectl apply -f k8s/20-api-gateway.yaml

kubectl apply -f k8s/30-web-frontend.yaml

### kubectl access denied```

```bash

# Add your IAM role to EKS access entries### Check rollout

# EKS Console → Access → Create access entry

# Select your IAM role → Add AmazonEKSClusterAdminPolicy```bash

kubectl get all -n mini-flipkart

# Then update kubeconfigkubectl get pods -n mini-flipkart -o wide

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1kubectl logs deploy/api-gateway -n mini-flipkart

``````



### Node group creation fails (Fleet Request quota)---

```bash

# Use Spot instances with 1 node# Phase 5 — Ingress + Domain Access

aws eks create-nodegroup \

  --cluster-name mini-flipkart-eks \### Step 1 — Install NGINX Ingress Controller

  --nodegroup-name mf-nodes \

  --node-role arn:aws:iam::<ACCOUNT_ID>:role/mini-flipkart-eks-node-role \```bash

  --subnets subnet-xxx subnet-yyy \kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

  --instance-types t3.small \```

  --capacity-type SPOT \

  --scaling-config minSize=1,maxSize=2,desiredSize=1 \Wait until controller pods are running:

  --region us-east-1

``````bash

kubectl get pods -n ingress-nginx

---```



## 📝 License### Step 2 — Apply project Ingress



This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.```bash

kubectl apply -f k8s/40-ingress.yaml

---kubectl get ingress -n mini-flipkart

```

## 🙏 Acknowledgments

### Step 3 — Get external entry point

- Based on [Google Cloud Microservices Demo](https://github.com/GoogleCloudPlatform/microservices-demo)

- Modified for AWS EKS deployment with Mini Flipkart branding```bash

kubectl get svc -n ingress-nginx

---```



**Happy Deploying! 🚀**Find `ingress-nginx-controller` **EXTERNAL-IP** (or hostname on AWS LB).


### Step 4 — Map domain to Ingress IP

For lab testing, map host locally:

```bash
sudo vi /etc/hosts
```

Add line:

```text
<INGRESS_EXTERNAL_IP>  mini-flipkart.local
```

### Step 5 — Test app

```bash
curl http://mini-flipkart.local/
curl http://mini-flipkart.local/api/products
```

Open browser: `http://mini-flipkart.local` and login with demo credentials.

**Production note:** In real projects, use Route 53 hosted zone and point your real domain (example: `shop.devopsmate.com`) to Ingress Load Balancer DNS.

---

## Deployment vs StatefulSet (Quick Compare)

| | Deployment | StatefulSet |
|---|---|---|
| Use case | Stateless apps (API, web) | Databases (MySQL) |
| Pod names | Random suffix | Stable ordinal (`mysql-0`) |
| Storage | Usually no persistent disk | PVC per pod |
| Scale style | Fast replace pods | Ordered startup/shutdown |
| In this project | gateway, auth, web, etc. | `mysql` |

---

## What You Will Achieve

| After this project |
|---|
| You understand why Kubernetes is needed after Docker |
| You can explain API Server → etcd → Scheduler → Controller → kubelet flow |
| You can create EKS cluster and node group from AWS Console |
| You can deploy Namespace, ConfigMap, Secret, StatefulSet, Deployment, Service, Ingress |
| You can route domain traffic to frontend and API using Ingress |
| You deployed full `mini-flipkart` microservices on production-style orchestration |

---

## Cleanup (Avoid Billing)

Delete in this order:

1. `kubectl delete namespace mini-flipkart`
2. `kubectl delete namespace ingress-nginx`
3. EKS Console → Delete node group `mini-flipkart-nodes`
4. EKS Console → Delete cluster `mini-flipkart-eks`
5. Delete VPC resources (subnets, IGW, route table, security group)
6. Delete ECR images/repos if not needed

---

## Project Folders

```text
project-11-ecommerce-eks-e2e/
├── k8s/                    # Kubernetes manifests (apply in order)
├── services/               # Node.js microservices + Dockerfiles
├── nginx/                  # Frontend proxy (Dockerfile.k8s for EKS)
├── frontend/               # mini-flipkart UI
├── database/               # schema.sql + seed.sql
└── shared/                 # common DB/auth helpers
```

---

<p align="center">
  <b>DevOpsMate — Project 11 complete. You moved from EC2 to Docker to Kubernetes.</b>
</p>
