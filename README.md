# 🚀 FastAPI Canary Deployment on Kubernetes

A **production-grade canary deployment system** powered by **FastAPI**, **Docker**, and **Kubernetes (Minikube)**. This project demonstrates real-world DevOps strategies where traffic is gradually shifted from a stable version (`v1`) to a new release (`v2`) using Kubernetes deployments and services — with **zero downtime**.

---

## 🎯 Core Functionality

### ✅ Canary Deployment Strategy
- Two Kubernetes Deployments: `v1` (stable) and `v2` (canary).
- Shared `app: fastapi` selector in the Kubernetes Service distributes traffic across pods.
- Pod count determines the **traffic distribution** (e.g., 3 pods for `v1`, 1 pod for `v2` = ~75%/25%).
- Ideal for **progressive rollout**, **A/B testing**, and minimizing production risk.

---

### ✅ FastAPI App with Visual Feedback
- Built with **FastAPI**, renders an HTML page showing the current version (v1 or v2).
- UI is version-aware using **separate CSS styles**:
  - `v1` → Sky Blue background
  - `v2` → Light Green background
- Static assets are served via `StaticFiles`, and templates use **Jinja2** for dynamic version injection.

---

### ✅ Dockerized with CI/CD Support
- Uses a single `main.template.py` and injects version via **GitHub Actions**.
- Docker images tagged as `v1`, `v2` and pushed to Docker Hub:
  - 👉 `dhiraj918106/fastapi-canary:v1`
  - 👉 `dhiraj918106/fastapi-canary:v2`
- **CI/CD pipeline** (via GitHub Actions) automates:
  - Dynamic version injection
  - Docker build & push
  - Ready for deployment on Kubernetes

---

### ✅ Kubernetes Native Setup (Minikube)
- Two separate manifests: `deployment-v1.yaml`, `deployment-v2.yaml`
- Uses:
  - `imagePullPolicy: Always`
  - Proper CPU/memory resource management
- `fastapi-service.yaml` exposes both versions under a single NodePort service.

---

### ✅ Automated Local Deployment Script
- Includes a smart shell script: `deploy.sh`
- Automates:
  - Cleanup of old deployments
  - Apply K8s manifests
  - Wait for all pods to be in `Ready` state
  - Open the app in the browser once live
- Perfect for **quick local testing** and demo preparation.


---

## 🛠️ Tech Stack

- **FastAPI** – High-performance Python web API framework
- **Docker** – Containerization and image management
- **Docker Hub** – Public image registry
- **Kubernetes + Minikube** – Local cloud-native orchestration
- **GitHub Actions** – CI/CD for image builds and deployment automation
- **Jinja2 + HTML + CSS** – Version-aware UI with clean styling

---
