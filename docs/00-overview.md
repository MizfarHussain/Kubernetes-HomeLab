# Kubernetes Tutorial: Complete Learning Path

*Master DevOps by building a real application that scales from local development to global production*

## 🎯 What You'll Learn

By the end of this tutorial, you'll know how to:
- **Deploy applications** on Kubernetes (the industry standard)
- **Monitor performance** with production-grade tools
- **Automate deployments** using GitOps principles


## Why This Matters

This project teaches you enterprise-grade DevOps by building a real application that scales from local development to global production. You'll learn the same patterns used by companies like Netflix, Airbnb, and GitHub.





| Milestone | Goal | What You'll Learn | ⏱️ Time |
|-----------|------|-------------------|----------|
| **0. Setup** | Tools ready | Install Docker/Colima, kubectl, k3d, Helm, Node, jq | 15-30 min |
| **1. Compose** | App works locally | Docker Compose with postgres, redis, backend, frontend services | 20-40 min |
| **2. K8s Core** | App on k3d | Kubernetes deployment to humor-game namespace | 30-60 min |
| **3. Ingress** | Prod-style access | humor-game-nginx controller with gameapp.local and gameapp.games | 20-40 min |
| **4. Observability** | See/measure | Prometheus and Grafana in monitoring namespace | 45-90 min |
| **5. GitOps** | Automate | ArgoCD in argocd namespace for automated deployments | 30-60 min |


## Success Metrics

**By the end, you'll have:**
- ✅ **4 pods running** in humor-game namespace (postgres, redis, backend, frontend)
- ✅ **Monitoring stack** in monitoring namespace (prometheus, grafana)
- ✅ **GitOps automation** in argocd namespace
- ✅ **Global access** via Cloudflare CDN
- ✅ **Production security** with network policies and security contexts

## Technology Stack

**Application Layer:**
- **Frontend**: Vanilla JS with nginx (port 80)
- **Backend**: Node.js Express API (port 3001)
- **Database**: PostgreSQL 15 (port 5432)
- **Cache**: Redis 7 (port 6379)

**Infrastructure Layer:**
- **Containerization**: Docker & Docker Compose
- **Orchestration**: Kubernetes (k3d)
- **Ingress**: humor-game-nginx controller
- **Monitoring**: Prometheus (port 9090) + Grafana (port 3000)
- **GitOps**: ArgoCD
- **CDN**: Cloudflare

**Development Tools:**
- **Cluster**: k3d (lightweight Kubernetes)
- **Package Manager**: Helm
- **CLI**: kubectl, docker, docker-compose
- **Scripting**: Node.js, jq

## Prerequisites

**System Requirements:**
- 4GB+ RAM available
- 10GB+ disk space
- macOS or Linux (Windows via WSL2)

**Required Tools:**
- Docker 20.0+ / Colima (macOS)
- kubectl 1.28+
- k3d 5.6+
- Helm 3.18+
- Node.js 18+
- jq 1.6+

## Getting Started

1. **Install tools** → [01-prereqs.md](01-prereqs.md)
2. **Verify setup** → Run verification commands
3. **Start building** → [02-compose.md](02-compose.md)



## Next Steps

Start with [01-prereqs.md](01-prereqs.md) to set up your development environment.
