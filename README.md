# L'Institut de l'informatique - مركز الحاسوبي

Plateforme d'apprentissage complète pour devenir développeur full stack en 1 an.

## 🎯 Objectif

Cette plateforme propose un parcours complet d'apprentissage du développement full stack avec une pédagogie adaptée incluant:
- Exemples pratiques
- Phrases clés
- Analogies
- Explications par points
- Exercices pratiques
- QCM avec corrigés
- Espaces de codage interactifs

## 🌍 Langues supportées

- 🇫🇷 Français
- 🇬🇧 Anglais
- 🇸🇦 Arabe

## 🏗️ Architecture

### Stack technique

- **Backend**: Java Spring Boot
- **Frontend**: Angular avec i18n
- **Base de données**: PostgreSQL
- **Containerisation**: Docker
- **Orchestration**: Kubernetes
- **Cloud**: AWS
- **Infrastructure as Code**: Terraform
- **Monitoring**: Prometheus
- **CI/CD**: GitHub Actions
- **DevOps & GitOps**: ArgoCD

## 📁 Structure du projet

```
.
├── backend/              # Application Spring Boot
├── frontend/             # Application Angular
├── docker/               # Configurations Docker
├── k8s/                  # Manifests Kubernetes
├── terraform/            # Infrastructure AWS
├── ci-cd/                # Pipelines CI/CD
├── monitoring/            # Configuration Prometheus
└── docs/                 # Documentation
```

## 🚀 Démarrage rapide

### Prérequis

- Java 17+
- Node.js 18+
- Docker & Docker Compose
- Terraform
- kubectl
- AWS CLI

### Installation locale

```bash
# Backend
cd backend
./mvnw clean install
./mvnw spring-boot:run

# Frontend
cd frontend
npm install
ng serve
```

### Avec Docker

```bash
docker-compose up -d
```

## 📚 Modules d'apprentissage

1. **Fondamentaux du développement**
2. **Java & Spring Boot**
3. **Angular & TypeScript**
4. **Bases de données**
5. **Docker & Containerisation**
6. **Kubernetes**
7. **AWS Cloud**
8. **Terraform**
9. **CI/CD**
10. **DevOps & GitOps**
11. **Monitoring avec Prometheus**

## 🔧 Déploiement

Voir la documentation dans `docs/DEPLOYMENT.md`

## 📝 Licence

MIT

## 📚 Documentation Complète

- [Guide de Démarrage](docs/GETTING_STARTED.md)
- [Guide de Déploiement](docs/DEPLOYMENT.md)
- [Configuration GitOps](docs/GITOPS.md)
- [Structure du Projet](PROJECT_STRUCTURE.md)

## 🎓 Contenu Pédagogique

La plateforme propose un parcours complet sur 1 an avec:

1. **Fondamentaux** - Bases de la programmation
2. **Java & Spring Boot** - Backend robuste
3. **Angular & TypeScript** - Frontend moderne
4. **Bases de données** - PostgreSQL, SQL
5. **Docker** - Containerisation
6. **Kubernetes** - Orchestration
7. **AWS** - Cloud computing
8. **Terraform** - Infrastructure as Code
9. **CI/CD** - Automatisation
10. **DevOps & GitOps** - Bonnes pratiques
11. **Monitoring** - Prometheus, observabilité

Chaque module contient:
- 📖 Leçons avec explications détaillées
- 💡 Points clés et analogies
- 📝 Exemples pratiques
- 💻 Exercices de codage
- ✅ QCM avec corrigés
- 🎯 Projets réels
