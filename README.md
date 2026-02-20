# 🎮 Kubernetes Tutorial: Build Production Apps from Scratch

*Learn DevOps by building a real application: Docker → Kubernetes → Monitoring → GitOps → Global Deployment. Perfect for career switchers and beginners.*

> This project is part of the **Zee DevOps Learning Path**  
> Start: Quick Wins → Core: Beginner-DevOps-Labs → Reference: Troubleshooting Toolkit → Portfolio: Weekend Projects → Cloud: Cloud-DevOps-Projects

[![Kubernetes](https://img.shields.io/badge/Kubernetes-Production%20Ready-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com/)
[![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus%20%2B%20Grafana-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)](https://prometheus.io/)
[![ArgoCD](https://img.shields.io/badge/GitOps-ArgoCD-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)](https://argoproj.github.io/)

---

## 🎯 **What You'll Learn**

By completing this tutorial, you'll master:
- **Container orchestration** with Kubernetes (the same tech Netflix uses)
- **Production monitoring** with Prometheus and Grafana dashboards
- **Automated deployments** using GitOps principles


**Career Impact**: These skills are in high demand. DevOps engineers with Kubernetes experience earn 20-30% more than those without it.


---

## 🌟 **Live Demo**
![Humor Memory Game Interface](assets/images/hga.jpg)

*Experience the Humor Memory Game: A DevOps Learning Adventure! - A web-based memory game featuring a 4x4 grid of cards, game statistics, and navigation tabs for Game, Leaderboard, My Stats, and About.*

---



---



### **🏗️ Production Application Stack**
- 🎮 **Humor Memory Game** - Interactive web application with leaderboards
- 🔄 **4 Microservices** - Frontend, Backend, PostgreSQL, Redis
- 📊 **Full Observability** - Metrics, logs, traces, and custom dashboards
- 🔒 **Enterprise Security** - Network policies, security contexts, auto-scaling

### **🛠️ Technology Stack**

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Application** | Node.js + Express, Vanilla JS | Game logic and UI |
| **Database** | PostgreSQL 15, Redis 7 | Persistent data and caching |
| **Container** | Docker, Multi-stage builds | Application packaging |
| **Orchestration** | Kubernetes (k3d), NGINX Ingress | Container management |
| **Monitoring** | Prometheus, Grafana | Metrics and visualization |
| **GitOps** | ArgoCD, Git-based workflows | Automated deployments |
| **Security** | Network Policies, Security Contexts | Defense-in-depth |


---

## 📋 **Learning Milestones**

| Milestone | What You'll Learn | Time | Difficulty |
|-----------|-------------------|------|------------|
| **[0. Prerequisites](docs/01-prereqs.md)** | Development environment setup | 15-30 min | 
| **[1. Docker Compose](docs/02-compose.md)** | Multi-container application | 30-45 min | 
| **[2. Kubernetes Basics](docs/03-k8s-basics.md)** | Production app deployment | 45-60 min | 
| **[3. Production Ingress](docs/04-ingress.md)** | Internet access and networking | 30-45 min | 
| **[4. Observability](docs/05-observability.md)** | Performance monitoring | 60-90 min |
| **[5. GitOps](docs/06-gitops.md)** | Automated deployments | 45-60 min | 


**📚 Total Learning Time**: 5-8 hours  




---

## 🏆 **What Makes This Special**

### **✨ Beginner-Friendly Features**
- 📖 **Step-by-step guides** with copy-paste commands
- 🎯 **Clear learning objectives** for each milestone
- 🔧 **Comprehensive troubleshooting** with common issues and solutions
- 🎪 **Real application** - not just "hello world" demos


### **🚀 Production-Grade Features**
- ⚡ **Zero-downtime deployments** with rolling updates
- 📈 **Horizontal auto-scaling** based on CPU/memory metrics
- 🔍 **Full observability stack** with custom dashboards and alerting
- 🔒 **Enterprise security** with network policies and security contexts
- 🔄 **GitOps automation** for reliable, auditable deployments

### **🎓 Skills You'll Master**
- **Container Orchestration**: Kubernetes deployment strategies
- **Infrastructure as Code**: Declarative configurations and GitOps
- **Monitoring & Observability**: Metrics, dashboards, alerting
- **Production Security**: Network policies, security contexts, secrets
- **CI/CD & Automation**: GitOps workflows and deployment pipelines


---

## 📚 **Complete Documentation**

### **📖 Core Tutorials**
- **[🎯 Learning Path Overview](docs/00-overview.md)** - Complete tutorial roadmap
- **[⚙️ Development Environment Setup](docs/01-prereqs.md)** - Install all required tools
- **[🐳 Docker Multi-Container App](docs/02-compose.md)** - Build your first containerized app
- **[☸️ Kubernetes Production Deployment](docs/03-k8s-basics.md)** - Deploy apps on Kubernetes
- **[🌐 Internet Access & Networking](docs/04-ingress.md)** - Make your app accessible worldwide
- **[📊 Performance Monitoring](docs/05-observability.md)** - Track app health and performance
- **[🔄 Automated Deployments](docs/06-gitops.md)** - Deploy with GitOps automation


### **🎯 Career Development**
- **[📊 Architecture Overview](docs/00-overview.md#architecture-overview)** - Visual system documentation

---

## ⚠️ **Important Setup Notes**

### **🔑 Domain Configuration**
> **CRITICAL**: This project uses `gameapp.games` as an example domain. For your own deployment:
> 1. **Get a domain** (free options available for learning)
> 2. Replace all instances of `gameapp.games` with your domain

> **📝 See**: [Domain Replacement Guide](docs/domain-replacement-guide.md) | [Free Domain Setup](docs/07-global.md#step-3a-prerequisites---get-a-domain)

### **💻 System Requirements**
- **RAM**: 4GB+ available for Kubernetes cluster
- **Storage**: 10GB+ free disk space
- **OS**: macOS, Linux, or Windows with WSL2
- **Network**: Stable internet for image downloads

### **🛠️ Required Tools**
```bash
# Essential tools (install via prerequisite guide)
docker --version    # Container runtime
kubectl version     # Kubernetes CLI
k3d version        # Local Kubernetes cluster
helm version       # Package manager
node --version     # JavaScript runtime
jq --version       # JSON processor
```

---
## Start building using docs folder
