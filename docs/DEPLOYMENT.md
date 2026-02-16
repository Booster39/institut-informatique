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

## HTTPS en production (ALB + certificat ACM)

Le site est exposé via un **Application Load Balancer**. Sans certificat, l’ALB ne sert que du HTTP.

### Activer HTTPS

1. **Obtenir un nom de domaine** pointant vers votre infrastructure (ou utiliser un sous-domaine existant).

2. **Créer un certificat ACM** (AWS Certificate Manager) dans la même région que l’ALB :
   - Console AWS → Certificate Manager → Request a certificate
   - Choisir « Public certificate », ajouter le nom de domaine (ex. `app.example.com`)
   - Valider par DNS (en créant l’enregistrement CNAME indiqué dans ACM) ou par e-mail

3. **Passer l’ARN du certificat** à Terraform :

```hcl
# terraform.tfvars
acm_certificate_arn = "arn:aws:acm:eu-west-3:123456789012:certificate/xxxxx"
```

4. **Réappliquer Terraform** :

```bash
cd terraform
terraform apply
```

5. **Pointer le domaine vers l’ALB** :
   - Dans Route 53 (ou votre DNS) : créer un enregistrement **A** (alias) pointant vers le DNS de l’ALB (`app_alb_dns_name` en output Terraform).

Après cela, le site est accessible en **https://votre-domaine** ; le trafic HTTP (port 80) est redirigé vers HTTPS (port 443).

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
