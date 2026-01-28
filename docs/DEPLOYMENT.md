# Guide de Déploiement

## Prérequis

- AWS CLI configuré
- Terraform >= 1.0
- kubectl
- Docker
- Accès à un registre Docker (GitHub Container Registry, Docker Hub, ECR)

## Déploiement sur AWS

### 1. Infrastructure avec Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 2. Configuration Kubernetes

```bash
# Configurer kubectl pour EKS
aws eks update-kubeconfig --name institut-cluster --region us-east-1

# Appliquer les manifests
kubectl apply -f k8s/
```

### 3. Vérification

```bash
# Vérifier les pods
kubectl get pods -n institut

# Vérifier les services
kubectl get svc -n institut

# Obtenir l'URL du LoadBalancer
kubectl get svc frontend -n institut
```

## Variables d'environnement

Créer un fichier `terraform/terraform.tfvars`:

```hcl
aws_region = "us-east-1"
db_password = "votre-mot-de-passe-securise"
environment = "production"
```

## CI/CD

Le pipeline GitHub Actions se déclenche automatiquement sur:
- Push sur `main` ou `develop`
- Pull requests vers `main`

Les images Docker sont automatiquement construites et poussées vers GitHub Container Registry.

## Monitoring

Prometheus est accessible via:
```bash
kubectl port-forward svc/prometheus 9090:9090 -n institut
```

Puis accéder à http://localhost:9090
