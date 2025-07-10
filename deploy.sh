#!/bin/bash

set -e

echo "🚀 Cleaning up previous K8s resources..."
kubectl delete -f k8s/ --ignore-not-found

echo "📦 Applying new K8s manifests..."
kubectl apply -f k8s/

echo "⏳ Waiting for pods to be ready..."
while true; do
  NOT_READY=$(kubectl get pods --no-headers | grep -v "Running" | wc -l)
  if [ "$NOT_READY" -eq 0 ]; then
    echo "✅ All pods are ready!"
    break
  else
    echo "🔄 Waiting for pods... ($NOT_READY not ready)"
    sleep 3
  fi
done

echo "🌐 Fetching service URL..."
SERVICE_URL=$(minikube service fastapi-service --url)
echo "📡 Application is live at: $SERVICE_URL"

# Open in browser (optional)
if command -v xdg-open &> /dev/null; then
  xdg-open "$SERVICE_URL"
elif command -v open &> /dev/null; then
  open "$SERVICE_URL"
fi
