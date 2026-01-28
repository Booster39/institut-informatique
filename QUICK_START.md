# 🚀 Démarrage Rapide

## Option 1: Docker Compose (Recommandé)

```bash
# Cloner le repository
git clone <votre-repo>
cd institut-informatique

# Démarrer tous les services
docker-compose up -d

# Vérifier les services
docker-compose ps

# Voir les logs
docker-compose logs -f
```

**Accès:**
- Frontend: http://localhost:4200
- Backend API: http://localhost:8080
- Prometheus: http://localhost:9090
- PostgreSQL: localhost:5432

## Option 2: Développement Local

### Backend

```bash
cd backend

# Installer les dépendances (Maven télécharge automatiquement)
./mvnw clean install

# Démarrer l'application
./mvnw spring-boot:run
```

### Frontend

```bash
cd frontend

# Installer les dépendances
npm install

# Démarrer le serveur de développement
npm start
```

### Base de données

```bash
# Avec Docker
docker run -d \
  --name institut-postgres \
  -e POSTGRES_DB=institut_db \
  -e POSTGRES_USER=institut_user \
  -e POSTGRES_PASSWORD=institut_password \
  -p 5432:5432 \
  postgres:15-alpine
```

## Option 3: Déploiement sur AWS

### 1. Infrastructure avec Terraform

```bash
cd terraform

# Initialiser Terraform
terraform init

# Créer terraform.tfvars
cat > terraform.tfvars << EOF
aws_region = "us-east-1"
db_password = "votre-mot-de-passe-securise"
environment = "production"
EOF

# Planifier les changements
terraform plan

# Appliquer
terraform apply
```

### 2. Déployer sur Kubernetes

```bash
# Configurer kubectl
aws eks update-kubeconfig --name institut-cluster --region us-east-1

# Déployer
kubectl apply -f k8s/
```

### 3. Vérifier le déploiement

```bash
kubectl get pods -n institut
kubectl get svc -n institut
```

## 🧪 Tester l'API

```bash
# Lister les cours
curl http://localhost:8080/api/courses

# Créer un cours
curl -X POST http://localhost:8080/api/courses \
  -H "Content-Type: application/json" \
  -d '{
    "titleFr": "Test Cours",
    "titleEn": "Test Course",
    "titleAr": "دورة اختبار",
    "descriptionFr": "Description test",
    "level": "BEGINNER",
    "orderIndex": 1
  }'
```

## 📝 Premiers Pas

1. **Accéder à la plateforme**: http://localhost:4200
2. **Changer la langue**: Utiliser le sélecteur en haut à droite
3. **Explorer les cours**: Cliquer sur "Cours" dans le menu
4. **Voir une leçon**: Cliquer sur un cours puis une leçon

## 🔧 Configuration

Copier `.env.example` vers `.env` et modifier les valeurs selon vos besoins.

## ❓ Problèmes Courants

### Port déjà utilisé
```bash
# Changer le port dans docker-compose.yml ou application.yml
```

### Base de données non accessible
```bash
# Vérifier que PostgreSQL est démarré
docker ps | grep postgres
```

### Erreurs CORS
```bash
# Vérifier SecurityConfig.java - CORS est déjà configuré pour *
```

## 📚 Documentation Complète

- [Guide de Démarrage](docs/GETTING_STARTED.md)
- [Guide de Déploiement](docs/DEPLOYMENT.md)
- [Structure du Projet](PROJECT_STRUCTURE.md)
