
# 🚀 FastAPI Canary Deployment on Kubernetes

A **production-grade canary deployment** system powered by **FastAPI**, **Docker**, and **Kubernetes (Minikube)**. This project demonstrates an advanced deployment strategy where traffic is gradually shifted to a new application version (v2) while monitoring performance alongside the existing stable version (v1).

---

## 🎯 Core Functionality

### ✅ Canary Deployment Strategy
- Simulates **progressive rollout** by running multiple pods of `v1` (stable) and a single pod of `v2` (canary).
- Kubernetes `Service` distributes traffic across both versions based on pod count (e.g., 3 pods for v1 and 1 pod for v2 results in ~25% traffic to v2).
- Ideal for reducing production risks and enabling **A/B testing** or **safe version testing**.

### ✅ FastAPI Web App with Visual Indicators
- Dynamic response shows which version (v1 or v2) served the request.
- Clean, responsive UI with unique background color for each version (e.g., skyblue for v1, lightgreen for v2).
- Implements **Jinja2 templates** and **static CSS files** for UI rendering.

### ✅ Dockerized for Portability
- Each version is built as a separate Docker image using the same base but tagged appropriately (`v1`, `v2`).
- Runs inside Kubernetes using Docker images that are either pulled from DockerHub or built directly inside Minikube.

### ✅ Kubernetes Native Deployments
- Uses two separate Kubernetes Deployments for v1 and v2.
- A single Service routes traffic to both deployments using a shared label selector (`app: fastapi`).
- Resource requests and limits are configured for efficient pod scheduling and cluster resource control.

### ✅ Designed for Local Development with Minikube
- Uses `minikube docker-env` to build images directly in Minikube’s Docker daemon.
- Fully tested with local Kubernetes cluster — no external cloud provider required.
- Ideal for showcasing **DevOps practices**, CI/CD pipelines, and traffic-splitting strategies to recruiters or interviewers.

---

## 💼 Why This Project Matters to Recruiters

- Demonstrates **hands-on expertise with cloud-native deployment strategies**.
- Reflects **real-world practices** in production-grade rollouts and rollback-ready architectures.
- Proves familiarity with **containerization (Docker)** and **Kubernetes orchestration**.
- Clean, maintainable, and modular — ready to be scaled or integrated with CI/CD pipelines or service meshes like Istio for weighted routing.

---

## 🛠️ Tech Stack

- **FastAPI**: Modern, high-performance Python web framework.
- **Docker**: Containerized deployment for consistent, reproducible builds.
- **Kubernetes (Minikube)**: Local K8s cluster to simulate production-like environments.
- **HTML + CSS**: Lightweight UI with environment-based styling.
- **Jinja2**: Server-side templating for clean and dynamic rendering.

---
