<div align="center"><p align="center"># 🛒 Mini Flipkart - Microservices E-Commerce Application<p align="center">



# 🛒 Mini Flipkart  <img src="https://img.shields.io/badge/🛒-Mini%20Flipkart-ff6f00?style=for-the-badge&labelColor=000000" alt="Mini Flipkart"/>



### 11 Microservices E-Commerce Application on Amazon EKS</p>  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F172A,45:326CE5,100:16A34A&height=200&section=header&text=mini-flipkart%20on%20EKS&fontSize=42&fontColor=ffffff&animation=fadeIn" alt="EKS Banner" />



[![Microservices](https://img.shields.io/badge/Microservices-11-00C853?style=for-the-badge&logo=docker&logoColor=white)](.)

[![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](.)

[![AWS](https://img.shields.io/badge/AWS-ECR%20%7C%20EKS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](.)<h1 align="center">🛒 Mini Flipkart</h1>A cloud-native e-commerce application built with **11 microservices**, demonstrating modern DevOps practices with Docker, Amazon ECR, and Kubernetes (EKS) deployment.</p>

[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white)](.)

<h3 align="center">11 Microservices E-Commerce Application Deployment on Amazon EKS</h3>

---



</div>

<p align="center">

<br>

  <img src="https://img.shields.io/badge/Microservices-11-brightgreen?style=flat-square" alt="Microservices"/>![Architecture](https://img.shields.io/badge/Architecture-Microservices-blue)<p align="center">

<!-- ==================== AGENDA SECTION ==================== -->

  <img src="https://img.shields.io/badge/Docker-Compose-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Docker"/>

<table>

<tr>  <img src="https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=flat-square&logo=kubernetes&logoColor=white" alt="Kubernetes"/>![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)  <img src="https://img.shields.io/badge/App-mini--flipkart-2563EB?style=for-the-badge" alt="App" />

<td>

  <img src="https://img.shields.io/badge/AWS-ECR%20|%20EKS-FF9900?style=flat-square&logo=amazon-aws&logoColor=white" alt="AWS"/>

## 📋 Agenda

  <img src="https://img.shields.io/badge/License-Apache%202.0-blue?style=flat-square" alt="License"/>![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)  <img src="https://img.shields.io/badge/Platform-Amazon%20EKS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" alt="EKS" />

| # | Step | Description |

|:---:|:---|:---|</p>

| **1** | 🖥️ **EC2 Setup** | Create EC2 instance and install DevOps tools using `ekssetup.sh` |

| **2** | 🐳 **Docker Compose (Source)** | Build & run app from source code using `docker-compose.yaml` |![AWS](https://img.shields.io/badge/AWS-ECR%20%7C%20EKS-FF9900?logo=amazon-aws)  <img src="https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" alt="K8s" />

| **3** | 📤 **Build & Push to ECR** | Build Docker images and push to Amazon ECR |

| **4** | 🚀 **Docker Compose (ECR)** | Test deployment using ECR images with `docker-compose-ecr.yaml` |<p align="center">

| **5** | ☸️ **Kubernetes (EKS)** | Production deployment on Amazon EKS cluster |

  <a href="#-architecture">Architecture</a> •  <img src="https://img.shields.io/badge/Path-EC2%20%E2%86%92%20Docker%20%E2%86%92%20K8s-16A34A?style=for-the-badge" alt="Path" />

</td>

</tr>  <a href="#-agenda">Agenda</a> •

</table>

  <a href="#-microservices">Microservices</a> •---</p>

<br>

  <a href="#-deployment-steps">Deployment</a> •

<!-- ==================== ARCHITECTURE SECTION ==================== -->

  <a href="#-quick-commands">Quick Commands</a>

<table>

<tr></p>

<td>

## 📋 Table of Contents# Project 11: Application Deployment End-to-End on Kubernetes (EKS)

## 🏗️ Architecture Diagram

---

<div align="center">



```

                                    ┌─────────────────────────────────────────────────────────────┐## 📋 Agenda

                                    │                        🌐 INTERNET                          │

                                    └─────────────────────────────┬───────────────────────────────┘1. [Architecture Overview](#-architecture-overview)**Application name:** `mini-flipkart`

                                                                  │

                                                                  ▼```

                                    ┌─────────────────────────────────────────────────────────────┐

                                    │                   ⚖️  AWS LOAD BALANCER                     │┌─────────────────────────────────────────────────────────────────────────────────┐2. [Microservices](#-microservices)

                                    │                    (Ingress Controller)                     │

                                    │                    mini-flipkart.com                        ││                        MINI FLIPKART DEPLOYMENT JOURNEY                         │

                                    └─────────────────────────────┬───────────────────────────────┘

                                                                  │├─────────────────────────────────────────────────────────────────────────────────┤3. [Prerequisites](#-prerequisites)> Learning style: **Understand the story first → see architecture → create EKS in AWS Console → deploy YAML manifests in clear order.**

                                                                  ▼

                                    ┌─────────────────────────────────────────────────────────────┐│                                                                                 │

                                    │                      🖥️  FRONTEND                           │

                                    │                       Go | Port 8080                        ││   📦 STEP 1: Create EC2 & Install Software (ekssetup.sh)                       │4. [Deployment Options](#-deployment-options)

                                    │                    Mini Flipkart Web UI                     │

                                    └─────────────────────────────┬───────────────────────────────┘│       └──▶ Docker, kubectl, AWS CLI, Helm, eksctl                              │

                                                                  │

                ┌────────────────────┬────────────────────┬───────┴───────┬────────────────────┬────────────────────┐│                                                                                 │   - [Option 1: Docker Compose (Local/Development)](#option-1-docker-compose-localdevelopment)Demo login:

                │                    │                    │               │                    │                    │

                ▼                    ▼                    ▼               ▼                    ▼                    ▼│   🐳 STEP 2: Docker Compose - Build from Source                                │

┌───────────────────────┐ ┌───────────────────────┐ ┌───────────────────────┐ ┌───────────────────────┐ ┌───────────────────────┐

│     📢 AD SERVICE     │ │  💡 RECOMMENDATION    │ │     🛒 CART SERVICE   │ │  📦 PRODUCT CATALOG   │ │   💵 CURRENCY SERVICE ││       └──▶ Path: src/* → docker-compose.yaml                                   │   - [Option 2: Docker Compose with ECR Images](#option-2-docker-compose-with-ecr-images)

│     Java | 9555       │ │   Python | 8080       │ │     C# | 7070         │ │     Go | 3550         │ │    Node.js | 7000     │

└───────────────────────┘ └───────────────────────┘ └───────────┬───────────┘ └───────────────────────┘ └───────────────────────┘│                                                                                 │

                                                                │

                                                                ▼│   📤 STEP 3: Build & Push Images to ECR                                        │   - [Option 3: Kubernetes (EKS Production)](#option-3-kubernetes-eks-production)```text

                                                  ┌───────────────────────┐

                                                  │     🔴 REDIS CACHE    ││       └──▶ Create ECR repos → Build → Tag → Push                               │

                                                  │        Port 6379      │

                                                  └───────────────────────┘│                                                                                 │5. [AWS Infrastructure Setup](#-aws-infrastructure-setup)Email: demo@devopsmate.com



                                    ┌─────────────────────────────────────────────────────────────┐│   🚀 STEP 4: Docker Compose - ECR Images                                       │

                                    │                    ✅ CHECKOUT SERVICE                      │

                                    │                       Go | Port 5050                        ││       └──▶ docker-compose-ecr.yaml (test deployment)                           │6. [Quick Start Commands](#-quick-start-commands)Password: password

                                    │                  (Order Orchestration)                      │

                                    └─────────────────────────────┬───────────────────────────────┘│                                                                                 │

                                                                  │

                          ┌───────────────────────────────────────┼───────────────────────────────────────┐│   ☸️  STEP 5: Kubernetes (EKS) Production Deployment                           │7. [Accessing the Application](#-accessing-the-application)```

                          │                                       │                                       │

                          ▼                                       ▼                                       ▼│       └──▶ kubernetes-manifests/ → kubectl apply                               │

            ┌───────────────────────┐               ┌───────────────────────┐               ┌───────────────────────┐

            │    📧 EMAIL SERVICE   │               │   💰 PAYMENT SERVICE  │               │  🚚 SHIPPING SERVICE  ││                                                                                 │

            │    Python | 8080      │               │    Node.js | 50051    │               │     Go | 50051        │

            └───────────────────────┘               └───────────────────────┘               └───────────────────────┘└─────────────────────────────────────────────────────────────────────────────────┘

```

```------

</div>



</td>

</tr>---

</table>



<br>

## 🏗 Architecture## 🏗 Architecture Overview## Agenda

<!-- ==================== MICROSERVICES TABLE ==================== -->



<table>

<tr>```

<td>

                                        🌐 INTERNET

## 🔧 Microservices Details

                                             │```| Step | What you do |

| # | Service | Language | Port | Description |

|:---:|:---|:---:|:---:|:---|                                             ▼

| 1 | **Frontend** | ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat-square&logo=go&logoColor=white) | `8080` | Web UI - Mini Flipkart Shop |

| 2 | **Cart Service** | ![C#](https://img.shields.io/badge/C%23-239120?style=flat-square&logo=csharp&logoColor=white) | `7070` | Shopping cart management with Redis |                            ┌────────────────────────────────┐                                    ┌─────────────────┐|---|---|

| 3 | **Product Catalog** | ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat-square&logo=go&logoColor=white) | `3550` | Product listing and details |

| 4 | **Currency Service** | ![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white) | `7000` | Currency conversion rates |                            │     ⚖️  LOAD BALANCER          │

| 5 | **Payment Service** | ![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white) | `50051` | Payment processing (mock) |

| 6 | **Shipping Service** | ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat-square&logo=go&logoColor=white) | `50051` | Shipping cost calculation |                            │      (Ingress/ALB)             │                                    │   Load Balancer │| 1 | Understand why we move **EC2 → Docker → Kubernetes** |

| 7 | **Email Service** | ![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white) | `8080` | Order confirmation emails |

| 8 | **Checkout Service** | ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat-square&logo=go&logoColor=white) | `5050` | Checkout orchestration |                            │    mini-flipkart.com           │

| 9 | **Recommendation** | ![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white) | `8080` | Product recommendations |

| 10 | **Ad Service** | ![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=openjdk&logoColor=white) | `9555` | Advertisement serving |                            └────────────────┬───────────────┘                                    │    (Ingress)    │| 2 | Learn Kubernetes architecture (control plane + worker nodes) |

| 11 | **Load Generator** | ![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white) | `-` | Traffic simulation (Locust) |

| - | **Redis** | ![Redis](https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=redis&logoColor=white) | `6379` | Cart data cache storage |                                             │



</td>                                             ▼                                    └────────┬────────┘| 3 | See what happens internally when DevOps applies a Deployment |

</tr>

</table>                            ┌────────────────────────────────┐



<br>                            │         🖥️  FRONTEND           │                                             │| 4 | Learn Namespace, ConfigMap, Secret, Deployment, StatefulSet, Service, Ingress |



<!-- ==================== PROJECT STRUCTURE ==================== -->                            │          (Go :8080)            │



<table>                            │      Mini Flipkart UI          │                                    ┌────────▼────────┐| 5 | Create **EKS cluster** in AWS Console |

<tr>

<td>                            └────────────────┬───────────────┘



## 📁 Project Structure                                             │                                    │    Frontend     │| 6 | Push Docker images to **ECR** |



```           ┌─────────────┬─────────────┬─────┴─────┬─────────────┬─────────────┐

📦 11-Mirco-app-deployment-on-EKS

│           │             │             │           │             │             │                                    │   (Go - :8080)  │| 7 | Deploy `mini-flipkart` manifests to EKS |

├── 🔧 ekssetup.sh                    # EC2 DevOps tools installation script

├── 🐳 docker-compose.yaml            # Build from source (development)           ▼             ▼             ▼           ▼             ▼             ▼

├── 🐳 docker-compose-ecr.yaml        # ECR images (production-like)

├── 📖 README.md                      # Documentation (this file)    ┌─────────────┐┌─────────────┐┌─────────┐┌─────────────┐┌─────────────┐┌─────────────┐                                    └────────┬────────┘| 8 | Access app using **domain / host mapping** via Ingress |

│

├── 📂 src/                           # Source code for all 11 microservices    │ 📢 AD SVC   ││ 💡 RECOMMEND││ 🛒 CART ││ 💳 CHECKOUT ││ 📦 PRODUCT  ││ 💵 CURRENCY │

│   ├── adservice/                    # Java

│   ├── cartservice/                  # C# (.NET)    │ Java:9555   ││ Python:8080 ││  :7070  ││  Go:5050    ││  Go:3550    ││ Node:7000   │                                             │

│   ├── checkoutservice/              # Go

│   ├── currencyservice/              # Node.js    └─────────────┘└─────────────┘└────┬────┘└──────┬──────┘└─────────────┘└─────────────┘

│   ├── emailservice/                 # Python

│   ├── frontend/                     # Go (Web UI)                                       │           │        ┌────────────────────────────────────┼────────────────────────────────────┐---

│   ├── loadgenerator/                # Python (Locust)

│   ├── paymentservice/               # Node.js                                       ▼           │

│   ├── productcatalogservice/        # Go

│   ├── recommendationservice/        # Python                               ┌─────────────┐     │        │                    │               │               │                    │

│   └── shippingservice/              # Go

│                               │ 🔴 REDIS    │     │

├── 📂 kubernetes-manifests/          # Kubernetes deployment files

│   ├── namespace.yaml                # mini-flipkart namespace                               │   :6379     │     │┌───────▼───────┐  ┌────────▼────────┐ ┌────▼────┐ ┌───────▼───────┐  ┌─────────▼─────────┐## Journey So Far (Clear Sequence)

│   ├── kustomization.yaml            # Kustomize configuration

│   ├── ingress.yaml                  # Ingress rules                               └─────────────┘     │

│   └── *.yaml                        # All service deployments

│                                                   ││  Ad Service   │  │ Recommendation  │ │  Cart   │ │   Checkout    │  │ Product Catalog   │

└── 📂 release/                       # Pre-built combined manifests

    └── kubernetes-manifests.yaml                          ┌────────────────────────┼────────────────────────┐

```

                          │                        │                        ││ (Java - 9555) │  │ (Python - 8080) │ │ (:7070) │ │  (Go - 5050)  │  │   (Go - 3550)     │```mermaid

</td>

</tr>                          ▼                        ▼                        ▼

</table>

                   ┌─────────────┐          ┌─────────────┐          ┌─────────────┐└───────────────┘  └─────────────────┘ └────┬────┘ └───────┬───────┘  └───────────────────┘flowchart LR

<br>

                   │ 📧 EMAIL    │          │ 💰 PAYMENT  │          │ 🚚 SHIPPING │

<!-- ==================== STEP 1: EC2 SETUP ==================== -->

                   │ Python:8080 │          │ Node:50051  │          │  Go:50051   │                                            │              │  classDef done fill:#dcfce7,stroke:#16a34a,stroke-width:2px,color:#111827;

<table>

<tr>                   └─────────────┘          └─────────────┘          └─────────────┘

<td>

```                                    ┌───────▼───────┐      │  classDef now fill:#dbeafe,stroke:#2563eb,stroke-width:3px,color:#111827;

## 📦 Step 1: Create EC2 & Install Software



### 1.1 Launch EC2 Instance

---                                    │     Redis     │      │

| Setting | Value |

|:---|:---|

| **AMI** | Ubuntu 22.04 / 24.04 LTS |

| **Instance Type** | `t3.medium` (or `t2.micro` for free tier) |## 🔧 Microservices                                    │    (:6379)    │      │  P9["Project 09\nEC2 + PM2\nOne server manual"]

| **IAM Role** | `mini-flipkart-devops-ec2-role` with `AdministratorAccess` |

| **Security Group** | Allow SSH (22), HTTP (80), HTTPS (443), Custom (8080) |

| **Storage** | 20 GB gp3 |

<table>                                    └───────────────┘      │  P10["Project 10\nDocker containers\n12 boxes on one host"]

### 1.2 Connect and Setup

<tr>

```bash

# SSH into EC2<th>🔢</th>                                                           │  P11["Project 11\nEKS + Kubernetes\nAuto-heal + scale"]

ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>

<th>Service</th>

# Clone repository

git clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git<th>Language</th>        ┌──────────────────────────────────────────────────┼──────────────────┐

cd 11-Mirco-app-deployment-on-EKS

<th>Port</th>

# Run setup script

bash ekssetup.sh<th>Description</th>        │                         │                        │                  │  P9 --> P10 --> P11



# ⚠️ IMPORTANT: Reconnect SSH for docker group changes</tr>

exit

ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP><tr><td>1️⃣</td><td><b>Frontend</b></td><td>🔵 Go</td><td>8080</td><td>Web UI - Mini Flipkart Shop</td></tr>┌───────▼───────┐  ┌──────────────▼──────────────┐ ┌──────▼──────┐  ┌────────▼────────┐

```

<tr><td>2️⃣</td><td><b>Cart Service</b></td><td>🟣 C# (.NET)</td><td>7070</td><td>Shopping cart management</td></tr>

### 1.3 Verify Installations

<tr><td>3️⃣</td><td><b>Product Catalog</b></td><td>🔵 Go</td><td>3550</td><td>Product listing & details</td></tr>│   Currency    │  │         Email               │ │   Payment   │  │    Shipping     │  class P9,P10 done

```bash

docker --version          # Docker<tr><td>4️⃣</td><td><b>Currency Service</b></td><td>🟢 Node.js</td><td>7000</td><td>Currency conversion</td></tr>

kubectl version --client  # Kubernetes CLI

aws --version             # AWS CLI<tr><td>5️⃣</td><td><b>Payment Service</b></td><td>🟢 Node.js</td><td>50051</td><td>Payment processing</td></tr>│(Node.js-7000) │  │     (Python - 8080)         │ │(Node.js-50051)│ │  (Go - 50051)   │  class P11 now

helm version              # Helm

eksctl version            # eksctl<tr><td>6️⃣</td><td><b>Shipping Service</b></td><td>🔵 Go</td><td>50051</td><td>Shipping cost calculation</td></tr>

```

<tr><td>7️⃣</td><td><b>Email Service</b></td><td>🟡 Python</td><td>8080</td><td>Order confirmation emails</td></tr>└───────────────┘  └─────────────────────────────┘ └─────────────┘  └─────────────────┘```

</td>

</tr><tr><td>8️⃣</td><td><b>Checkout Service</b></td><td>🔵 Go</td><td>5050</td><td>Checkout orchestration</td></tr>

</table>

<tr><td>9️⃣</td><td><b>Recommendation</b></td><td>🟡 Python</td><td>8080</td><td>Product recommendations</td></tr>```

<br>

<tr><td>🔟</td><td><b>Ad Service</b></td><td>🔴 Java</td><td>9555</td><td>Advertisement serving</td></tr>

<!-- ==================== STEP 2: DOCKER COMPOSE SOURCE ==================== -->

<tr><td>1️⃣1️⃣</td><td><b>Load Generator</b></td><td>🟡 Python</td><td>-</td><td>Traffic simulation (optional)</td></tr>| Project | How app runs | Main problem solved | New problem created |

<table>

<tr><tr><td>🔴</td><td><b>Redis</b></td><td>Redis</td><td>6379</td><td>Cart data storage</td></tr>

<td>

</table>---|---|---|---|---|

## 🐳 Step 2: Docker Compose - Build from Source



> **File:** `docker-compose.yaml` | **Source:** `src/*`

---| **09 EC2** | All services on one VM with PM2 | First real deployment | Manual recovery, no auto scaling |

### 2.1 Build and Run



```bash

cd ~/11-Mirco-app-deployment-on-EKS## 📁 Project Structure## 🔧 Microservices| **10 Docker** | Each service in its own container | Isolation + repeatable images | Still one machine; if node dies, all containers die |



# Build and start all services

docker compose up -d --build

```| **11 EKS/K8s** | Containers orchestrated across nodes | **Auto-healing, scaling, rollout, traffic routing** | More concepts to learn (worth it for production) |

# Check status

docker compose ps📦 11-Mirco-app-deployment-on-EKS/



# View logs│| # | Service | Language | Port | Description |

docker compose logs -f frontend

```├── 📂 src/                              # 🔧 Source Code (11 Microservices)



### 2.2 Access Application│   ├── adservice/                      # Java - Ad Service|---|---------|----------|------|-------------|---



| URL | Port |│   ├── cartservice/                    # C# - Cart Service

|:---|:---:|

| `http://<EC2-PUBLIC-IP>:8080` | **8080** |│   ├── checkoutservice/                # Go - Checkout Service| 1 | **Frontend** | Go | 8080 | Web UI for the shop |



### 2.3 Stop Services│   ├── currencyservice/                # Node.js - Currency Service



```bash│   ├── emailservice/                   # Python - Email Service| 2 | **Cart Service** | C# (.NET) | 7070 | Manages shopping cart (Redis backend) |## Why Move from Docker to Kubernetes?

docker compose down

```│   ├── frontend/                       # Go - Frontend UI ⭐



</td>│   ├── loadgenerator/                  # Python - Load Generator| 3 | **Product Catalog** | Go | 3550 | Product listing and details |

</tr>

</table>│   ├── paymentservice/                 # Node.js - Payment Service



<br>│   ├── productcatalogservice/          # Go - Product Catalog| 4 | **Currency Service** | Node.js | 7000 | Currency conversion |### Docker solved packaging — not production operations



<!-- ==================== STEP 3: BUILD & PUSH TO ECR ==================== -->│   ├── recommendationservice/          # Python - Recommendations



<table>│   └── shippingservice/                # Go - Shipping Service| 5 | **Payment Service** | Node.js | 50051 | Payment processing |

<tr>

<td>│



## 📤 Step 3: Build & Push Images to ECR├── 📂 kubernetes-manifests/             # ☸️ K8s Deployment Files| 6 | **Shipping Service** | Go | 50051 | Shipping cost calculation |In Project 10 you learned:



### 3.1 Create ECR Repositories│   ├── namespace.yaml                  # mini-flipkart namespace



```bash│   ├── kustomization.yaml              # Kustomize config| 7 | **Email Service** | Python | 8080 | Order confirmation emails |

# Create all 11 repositories

for repo in adservice cartservice checkoutservice currencyservice emailservice \│   ├── ingress.yaml                    # Ingress rules

            frontend loadgenerator paymentservice productcatalogservice \

            recommendationservice shippingservice; do│   ├── frontend.yaml                   # Frontend deployment| 8 | **Checkout Service** | Go | 5050 | Order checkout orchestration |- Build image once → run anywhere

    aws ecr create-repository --repository-name $repo --region us-east-1

done│   ├── redis.yaml                      # Redis deployment

```

│   └── *service.yaml                   # All service deployments| 9 | **Recommendation** | Python | 8080 | Product recommendations |- Each microservice in its own container

### 3.2 Login to ECR

│

```bash

# Replace <AWS_ACCOUNT_ID> with your account ID├── 📂 release/                          # 📦 Pre-built manifests| 10 | **Ad Service** | Java | 9555 | Advertisement serving |- `docker ps`, `docker logs`, `docker exec` for debugging

aws ecr get-login-password --region us-east-1 | \

docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com│   └── kubernetes-manifests.yaml       # Combined K8s manifest

```

│| 11 | **Load Generator** | Python | - | Traffic simulation (optional) |

### 3.3 Build, Tag & Push All Images

├── 🐳 docker-compose.yaml               # Build from source (dev)

```bash

cd ~/11-Mirco-app-deployment-on-EKS/src├── 🐳 docker-compose-ecr.yaml           # ECR images (prod-like)| - | **Redis** | Redis | 6379 | Cart data storage |But on a single Docker host:

ACCOUNT_ID=<AWS_ACCOUNT_ID>

REGION=us-east-1├── 🔧 ekssetup.sh                       # EC2 setup script



# Build and push each service└── 📖 README.md                         # This file

for svc in emailservice checkoutservice recommendationservice frontend \

           paymentservice productcatalogservice loadgenerator currencyservice \```

           shippingservice adservice; do

    echo "🔨 Building $svc..."---| Problem | What happens |

    cd $svc

    docker build -t $svc .---

    docker tag $svc:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$svc:latest

    docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$svc:latest|---|---|

    cd ..

done## 🚀 Deployment Steps



# Special case: cartservice (Dockerfile in src subdirectory)## 📦 Prerequisites| Container crash | Stays down until you manually `docker run` again |

cd cartservice/src

docker build -t cartservice .### 📦 STEP 1: Create EC2 & Install Software

docker tag cartservice:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/cartservice:latest

docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/cartservice:latest| Server crash | All 12 containers go offline together |

cd ../..

``````bash



### 3.4 Verify Images in ECR# Launch EC2 (Ubuntu 22.04/24.04) with:- **AWS Account** with appropriate permissions| Traffic spike | You manually add more containers / bigger EC2 |



```bash# - Instance Type: t3.medium (or t2.micro for free tier)

aws ecr describe-repositories --region us-east-1 --query 'repositories[].repositoryName'

```# - IAM Role: mini-flipkart-devops-ec2-role (AdministratorAccess)- **EC2 Instance** (Ubuntu 22.04/24.04) for DevOps server| New app version | Manual stop old container, start new one (downtime risk) |



</td># - Security Group: Allow SSH (22), HTTP (80), HTTPS (443)

</tr>

</table>- **Docker** and **Docker Compose**| Secret/config change | Rebuild or re-run with new `-e` flags |



<br># SSH into EC2



<!-- ==================== STEP 4: DOCKER COMPOSE ECR ==================== -->ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>- **kubectl** for Kubernetes management



<table>

<tr>

<td># Clone repository- **AWS CLI** configured with credentials### Kubernetes (on EKS) gives you production behavior



## 🚀 Step 4: Docker Compose - ECR Imagesgit clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git



> **File:** `docker-compose-ecr.yaml`cd 11-Mirco-app-deployment-on-EKS- **eksctl** (optional, for EKS management)



### 4.1 Update Account ID (if needed)



```bash# Run setup script (installs Docker, kubectl, AWS CLI, Helm, eksctl)| Capability | Real-life meaning |

# Replace account ID in docker-compose-ecr.yaml

sed -i 's/<AWS_ACCOUNT_ID>/<YOUR_ACCOUNT_ID>/g' docker-compose-ecr.yamlbash ekssetup.sh

```

---|---|---|

### 4.2 Deploy with ECR Images

# ⚠️ IMPORTANT: Reconnect SSH for docker group

```bash

cd ~/11-Mirco-app-deployment-on-EKSexit| **Auto-healing** | Pod dies → controller creates a new pod automatically |



# Pull and run ECR imagesssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>

docker compose -f docker-compose-ecr.yaml up -d

## 🚀 Deployment Options| **Self-healing nodes** | Unhealthy node → workloads rescheduled to healthy nodes |

# Check status

docker compose -f docker-compose-ecr.yaml ps# Verify installations

```

docker --version| **Scaling** | Increase replicas when load increases |

### 4.3 Access Application

kubectl version --client

| URL | Port |

|:---|:---:|aws --version### Option 1: Docker Compose (Local/Development)| **Rolling updates** | Deploy v2 without taking whole app down |

| `http://<EC2-PUBLIC-IP>:80` | **80** |

```

### 4.4 Cleanup

| **Service discovery** | Services talk by DNS name (`api-gateway`, `mysql`) |

```bash

docker compose -f docker-compose-ecr.yaml down---

```

**Use Case:** Build images from source code for local development and testing.| **Ingress routing** | One domain routes `/` to frontend and `/api` to gateway |

</td>

</tr>### 🐳 STEP 2: Docker Compose - Build from Source

</table>

| **Secrets management** | Passwords in Secret object, not hardcoded in image |

<br>

> **Path:** `src/*` → `docker-compose.yaml`

<!-- ==================== STEP 5: KUBERNETES EKS ==================== -->

**File:** `docker-compose.yaml`

<table>

<tr>```bash

<td>

cd ~/11-Mirco-app-deployment-on-EKS> **Simple story:** Docker packs your lunch. Kubernetes runs the entire restaurant — staff replacement, more counters during rush hour, and routing customers to the right counter.

## ☸️ Step 5: Kubernetes (EKS) Production Deployment



### 5.1 Create EKS Cluster

# Build and run all services from source```bash

Create cluster via **AWS Console** or **eksctl**:

docker compose up -d --build

```bash

# Using eksctl# Clone the repository---

eksctl create cluster \

  --name mini-flipkart-eks \# Check status

  --region us-east-1 \

  --nodegroup-name mf-nodes \docker compose psgit clone https://github.com/devopsmate7/11-Mirco-app-deployment-on-EKS.git

  --node-type t3.medium \

  --nodes 2

```

# Test applicationcd 11-Mirco-app-deployment-on-EKS## Kubernetes Architecture (Control Plane + Worker Nodes)

### 5.2 Connect to EKS Cluster

curl http://localhost:8080

```bash

# Update kubeconfig

aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1

# View logs

# Verify connection

kubectl get nodesdocker compose logs -f frontend# Build and run all services```mermaid

```



### 5.3 Deploy Application

# Stop when done testingdocker compose up -d --buildflowchart TB

```bash

cd ~/11-Mirco-app-deployment-on-EKSdocker compose down



# Deploy using Kustomize```  classDef control fill:#ede9fe,stroke:#7c3aed,stroke-width:2px,color:#111827;

kubectl apply -k kubernetes-manifests/



# Watch pods starting

kubectl get pods -n mini-flipkart -w| Access URL | Port |# Check status  classDef worker fill:#dbeafe,stroke:#2563eb,stroke-width:2px,color:#111827;

```

|------------|------|

### 5.4 Install Ingress Controller

| `http://<EC2-IP>:8080` | 8080 |docker compose ps  classDef store fill:#ffedd5,stroke:#f97316,stroke-width:2px,color:#111827;

```bash

# Install NGINX Ingress Controller

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml

---

# Get LoadBalancer URL

kubectl get svc -n ingress-nginx ingress-nginx-controller

```

### 📤 STEP 3: Build & Push Images to ECR# View logs  subgraph CP["Control Plane (EKS manages this for you)"]

### 5.5 Access Application



```bash

# Get Ingress address#### 3.1 Create ECR Repositoriesdocker compose logs -f frontend    API["API Server\nFront door of cluster"]

kubectl get ingress -n mini-flipkart



# Add to /etc/hosts (local machine)

<LOADBALANCER-IP>  mini-flipkart.com```bash    ETCD["etcd\nCluster memory / state DB"]



# Open in browser# Create all 11 ECR repositories

http://mini-flipkart.com

```aws ecr create-repository --repository-name adservice --region us-east-1# Access application    SCH["Scheduler\nPicks best node"]



### 5.6 Useful Commandsaws ecr create-repository --repository-name cartservice --region us-east-1



```bashaws ecr create-repository --repository-name checkoutservice --region us-east-1curl http://localhost:8080    CTL["Controllers\nKeep desired state"]

# Check all resources

kubectl get all -n mini-flipkartaws ecr create-repository --repository-name currencyservice --region us-east-1



# View pod logsaws ecr create-repository --repository-name emailservice --region us-east-1  end

kubectl logs -f <pod-name> -n mini-flipkart

aws ecr create-repository --repository-name frontend --region us-east-1

# Describe pod for debugging

kubectl describe pod <pod-name> -n mini-flipkartaws ecr create-repository --repository-name paymentservice --region us-east-1# Stop all services



# Delete deploymentaws ecr create-repository --repository-name productcatalogservice --region us-east-1

kubectl delete -k kubernetes-manifests/

```aws ecr create-repository --repository-name recommendationservice --region us-east-1docker compose down  subgraph W1["Worker Node 1"]



</td>aws ecr create-repository --repository-name shippingservice --region us-east-1

</tr>

</table>aws ecr create-repository --repository-name loadgenerator --region us-east-1```    K1["kubelet agent"]



<br>```



<!-- ==================== QUICK COMMANDS ==================== -->    P1["Pod: api-gateway"]



<table>#### 3.2 Login to ECR

<tr>

<td>---    P2["Pod: auth-service"]



## ⚡ Quick Commands Reference```bash



| Action | Command |aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com  end

|:---|:---|

| **EC2 Setup** | `bash ekssetup.sh` |```

| **Docker Compose (Source)** | `docker compose up -d --build` |

| **Docker Compose (ECR)** | `docker compose -f docker-compose-ecr.yaml up -d` |### Option 2: Docker Compose with ECR Images

| **Stop Docker** | `docker compose down` |

| **Connect to EKS** | `aws eks update-kubeconfig --name mini-flipkart-eks --region us-east-1` |#### 3.3 Build & Push All Images

| **Deploy to K8s** | `kubectl apply -k kubernetes-manifests/` |

| **Check Pods** | `kubectl get pods -n mini-flipkart` |  subgraph W2["Worker Node 2"]

| **Check Services** | `kubectl get svc -n mini-flipkart` |

| **Check Ingress** | `kubectl get ingress -n mini-flipkart` |```bash

| **Delete from K8s** | `kubectl delete -k kubernetes-manifests/` |

cd ~/11-Mirco-app-deployment-on-EKS/src**Use Case:** Deploy using pre-built images from Amazon ECR (faster deployment, no build required).    K2["kubelet agent"]

</td>

</tr>

</table>

# 📧 emailservice    P3["Pod: web"]

<br>

cd emailservice && docker build -t emailservice . && \

<!-- ==================== TROUBLESHOOTING ==================== -->

docker tag emailservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/emailservice:latest && \**File:** `docker-compose-ecr.yaml`    P4["Pod: product-service"]

<table>

<tr>docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/emailservice:latest && cd ..

<td>

  end

## 🔧 Troubleshooting

# ✅ checkoutservice

| Issue | Solution |

|:---|:---|cd checkoutservice && docker build -t checkoutservice . && \#### Step 1: Setup EC2 DevOps Server

| **Pods not starting** | `kubectl describe pod <pod-name> -n mini-flipkart` |

| **Cannot pull ECR images** | Ensure node role has `AmazonEC2ContainerRegistryReadOnly` policy |docker tag checkoutservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/checkoutservice:latest && \

| **kubectl access denied** | Add IAM role to EKS access entries via Console |

| **Node group quota error** | Use SPOT instances: `--capacity-type SPOT` |docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/checkoutservice:latest && cd ..  API <--> ETCD

| **Docker permission denied** | Run `sudo usermod -aG docker $USER` and reconnect |



</td>

</tr># 💡 recommendationservice```bash  API --> SCH

</table>

cd recommendationservice && docker build -t recommendationservice . && \

<br>

docker tag recommendationservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/recommendationservice:latest && \# Run the setup script (installs Docker, kubectl, AWS CLI, etc.)  API --> CTL

<!-- ==================== AUTHOR ==================== -->

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/recommendationservice:latest && cd ..

<div align="center">

bash ekssetup.sh  CTL <--> ETCD

---

# 🖥️ frontend

## 👤 Author

cd frontend && docker build -t frontend . && \  SCH --> API

**devopsmate7**

docker tag frontend:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/frontend:latest && \

[![GitHub](https://img.shields.io/badge/GitHub-devopsmate7-181717?style=for-the-badge&logo=github)](https://github.com/devopsmate7)

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/frontend:latest && cd ..# Reconnect SSH for docker group to take effect  API --> K1

---



<p>

  <b>⭐ Star this repository if you found it helpful! ⭐</b># 💰 paymentserviceexit  API --> K2

</p>

cd paymentservice && docker build -t paymentservice . && \

<p>

  Made with ❤️ for DevOps Learningdocker tag paymentservice:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/paymentservice:latest && \# ssh back in  K1 --> P1

</p>

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/paymentservice:latest && cd ..

</div>

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


I'll update the README to add the step about changing hosts to access via mini-flipkart.com in the Kubernetes section.


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
