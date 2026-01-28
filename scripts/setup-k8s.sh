#!/bin/bash

echo "🚀 Configuration Kubernetes pour L'Institut de l'informatique"

# Créer le namespace
echo "📦 Création du namespace..."
kubectl create namespace institut --dry-run=client -o yaml | kubectl apply -f -

# Créer les secrets
echo "🔐 Création des secrets..."
kubectl apply -f k8s/secrets.yaml

# Créer les PVCs
echo "💾 Création des volumes persistants..."
kubectl apply -f k8s/pvc.yaml

# Créer les deployments
echo "🚢 Déploiement des applications..."
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/postgres-deployment.yaml
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/prometheus-configmap.yaml
kubectl apply -f k8s/prometheus-deployment.yaml

echo "✅ Configuration Kubernetes terminée!"
echo ""
echo "Vérifier le statut:"
echo "  kubectl get pods -n institut"
echo "  kubectl get svc -n institut"
