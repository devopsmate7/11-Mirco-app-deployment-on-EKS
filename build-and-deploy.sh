#!/bin/bash
# =============================================================================
# Build Custom Frontend Image with Mini Flipkart Branding
# =============================================================================
set -euo pipefail

# Configuration - UPDATE THESE
DOCKERHUB_USERNAME="${DOCKERHUB_USERNAME:-devopsmate7}"
IMAGE_TAG="${IMAGE_TAG:-v1.0.0}"
FRONTEND_IMAGE="${DOCKERHUB_USERNAME}/mini-flipkart-frontend:${IMAGE_TAG}"

echo "=========================================="
echo "Building Mini Flipkart Frontend Image"
echo "=========================================="
echo "Image: ${FRONTEND_IMAGE}"
echo ""

# Check if docker is available
if ! command -v docker &> /dev/null; then
    echo "ERROR: Docker is not installed"
    exit 1
fi

# Build the frontend image
echo "Building frontend image..."
cd "$(dirname "$0")/src/frontend"
docker build -t "${FRONTEND_IMAGE}" .

echo ""
echo "=========================================="
echo "Build Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo ""
echo "1. Login to Docker Hub:"
echo "   docker login"
echo ""
echo "2. Push the image:"
echo "   docker push ${FRONTEND_IMAGE}"
echo ""
echo "3. Update the kubernetes manifest to use your image:"
echo "   In release/kubernetes-manifests.yaml, change:"
echo "   FROM: image: gcr.io/google-samples/microservices-demo/frontend:v0.8.0"
echo "   TO:   image: ${FRONTEND_IMAGE}"
echo ""
echo "4. Redeploy:"
echo "   kubectl apply -f release/kubernetes-manifests.yaml"
echo "   kubectl rollout restart deployment/frontend"
echo ""
