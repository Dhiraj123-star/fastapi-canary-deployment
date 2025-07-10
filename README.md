# 🚀 FastAPI Canary Deployment on Kubernetes

A **production-grade canary deployment system** built with **FastAPI**, **Docker**, and **Kubernetes (Minikube)**. This project simulates modern DevOps practices by gradually shifting traffic from a stable app version (`v1`) to a new release (`v2`) using pod distribution and Kubernetes services.

---

## 🎯 Core Functionality

### ✅ Canary Deployment Strategy
- Uses two Kubernetes Deployments (`v1` and `v2`) with a shared `app: fastapi` label.
- Traffic is **automatically split** by pod count: e.g., 3 pods for v1 and 1 pod for v2 simulates a ~75/25 split.
- Enables **progressive delivery**, A/B testing, and **safe rollout strategies**.

### ✅ FastAPI Web App with Version Visibility
- Serves a **Jinja2-powered HTML page** indicating which version responded.
- UI styles are controlled via separate static CSS file (`style.css`) based on version:
  - `v1` ➜ Sky Blue background
  - `v2` ➜ Light Green background
- Demonstrates how frontend feedback helps in tracking deployment versions.

### ✅ Dockerized and Cloud-Ready
- Each version is built as a separate image and tagged as `v1` and `v2`.
- Docker images are pushed to [Docker Hub](https://hub.docker.com/r/dhiraj918106/fastapi-canary) (`dhiraj918106/fastapi-canary:{tag}`).
- Kubernetes pods **pull from Docker Hub**, making it portable and CI/CD-friendly.

### ✅ Kubernetes Deployments (Minikube)
- Separate `deployment-v1.yaml` and `deployment-v2.yaml` files.
- Includes:
  - `imagePullPolicy: Always`
  - CPU/memory resource requests & limits for fair scheduling
- Shared service (`fastapi-service.yaml`) sends requests to both versions based on replica count.

### ✅ Designed for Local Kubernetes Testing (Minikube)
- Perfect for development, interviews, or demos without needing cloud infrastructure.
- Compatible with `minikube service` for local URL access.
- Tested and verified to work end-to-end.

---

## 💼 Why This Project Stands Out to Recruiters

- 💡 **Demonstrates modern deployment patterns** used in real-world production environments.
- 🐳 Shows proficiency with **Docker**, container tagging, and public registries (Docker Hub).
- ☸️ Validates hands-on **Kubernetes experience** (deployments, services, resource management).
- ⚙️ Clean separation of versions, HTML, and styling using professional code practices.
- ✅ Ready to scale, integrate into GitHub Actions, or extend into service mesh routing (Istio, Linkerd).

---

## 🛠️ Tech Stack

- **FastAPI** – High-performance web API in Python.
- **Docker & Docker Hub** – Container packaging and cloud image registry.
- **Kubernetes (Minikube)** – Local K8s cluster for simulating production environments.
- **Jinja2 + HTML + CSS** – Server-rendered HTML with static styling for version awareness.

---
