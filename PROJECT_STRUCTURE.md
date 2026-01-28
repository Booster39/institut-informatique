# Structure du Projet

## 📁 Organisation

```
.
├── backend/                    # Application Spring Boot
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/institut/
│   │   │   │   ├── model/          # Entités JPA
│   │   │   │   ├── repository/     # Repositories Spring Data
│   │   │   │   ├── service/        # Services métier
│   │   │   │   ├── controller/     # Contrôleurs REST
│   │   │   │   └── config/         # Configurations
│   │   │   └── resources/
│   │   │       ├── application.yml
│   │   │       └── data.sql        # Données d'exemple
│   │   └── test/
│   ├── Dockerfile
│   └── pom.xml
│
├── frontend/                   # Application Angular
│   ├── src/
│   │   ├── app/
│   │   │   ├── components/         # Composants Angular
│   │   │   │   ├── home/
│   │   │   │   ├── course-list/
│   │   │   │   ├── lesson-view/
│   │   │   │   ├── exercise-view/
│   │   │   │   ├── code-editor/
│   │   │   │   ├── header/
│   │   │   │   ├── footer/
│   │   │   │   └── language-selector/
│   │   │   ├── services/           # Services Angular
│   │   │   └── app.module.ts
│   │   ├── assets/
│   │   ├── styles.scss
│   │   └── index.html
│   ├── Dockerfile
│   ├── nginx.conf
│   ├── angular.json
│   └── package.json
│
├── k8s/                        # Manifests Kubernetes
│   ├── namespace.yaml
│   ├── postgres-deployment.yaml
│   ├── backend-deployment.yaml
│   ├── frontend-deployment.yaml
│   ├── prometheus-deployment.yaml
│   ├── prometheus-configmap.yaml
│   ├── secrets.yaml
│   └── pvc.yaml
│
├── terraform/                  # Infrastructure as Code
│   ├── main.tf                 # Ressources AWS principales
│   ├── variables.tf            # Variables Terraform
│   └── outputs.tf              # Sorties Terraform
│
├── monitoring/                 # Configuration monitoring
│   └── prometheus.yml
│
├── argocd/                     # Configuration GitOps
│   └── applications.yaml
│
├── .github/workflows/          # CI/CD
│   └── ci-cd.yml
│
├── docs/                       # Documentation
│   ├── DEPLOYMENT.md
│   ├── GETTING_STARTED.md
│   └── GITOPS.md
│
├── scripts/                    # Scripts utilitaires
│   ├── init-project.sh
│   └── setup-k8s.sh
│
├── docker-compose.yml          # Développement local
├── README.md
└── .gitignore
```

## 🎯 Fonctionnalités Principales

### Backend (Spring Boot)
- ✅ API REST complète
- ✅ Modèles multilingues (FR, EN, AR)
- ✅ Gestion des cours, leçons, exercices
- ✅ Support QCM avec corrigés
- ✅ Espaces de codage
- ✅ Authentification JWT (préparé)
- ✅ Monitoring Prometheus
- ✅ Base de données PostgreSQL

### Frontend (Angular)
- ✅ Interface multilingue (FR, EN, AR)
- ✅ Support RTL pour l'arabe
- ✅ Liste des cours
- ✅ Visualisation des leçons
- ✅ Éditeur de code intégré
- ✅ Exercices et QCM
- ✅ Design moderne et responsive

### Infrastructure
- ✅ Docker & Docker Compose
- ✅ Kubernetes (EKS)
- ✅ Terraform pour AWS
- ✅ CI/CD avec GitHub Actions
- ✅ GitOps avec ArgoCD
- ✅ Monitoring avec Prometheus

## 🔄 Workflow de Développement

1. **Développement Local**
   ```bash
   docker-compose up -d
   ```

2. **Tests**
   ```bash
   cd backend && mvn test
   cd frontend && npm test
   ```

3. **Build**
   - Backend: `mvn clean package`
   - Frontend: `npm run build`

4. **Déploiement**
   - Push sur `main` → CI/CD automatique
   - ArgoCD synchronise les déploiements

## 📊 Modèles de Données

### Course (Cours)
- Titre multilingue
- Description multilingue
- Niveau (BEGINNER, INTERMEDIATE, ADVANCED)
- Ordre d'affichage

### Lesson (Leçon)
- Contenu multilingue
- Points clés (format liste)
- Analogies
- Exemples
- Blocs de code
- Durée estimée

### Exercise (Exercice)
- Type (CODING, QUIZ, PROJECT, THEORETICAL)
- Description et solution multilingues
- Questions QCM
- Difficulté (1-5)

### QuizQuestion (Question QCM)
- Question multilingue
- Options multilingues
- Bonne réponse
- Explication multilingue

## 🌍 Support Multilingue

Tous les contenus sont stockés en 3 langues:
- **Français (fr)**: Langue par défaut
- **Anglais (en)**
- **Arabe (ar)**: Support RTL complet

Le changement de langue se fait dynamiquement via le service `LanguageService`.

## 🚀 Prochaines Étapes

1. Ajouter plus de contenu pédagogique
2. Implémenter l'authentification complète
3. Ajouter un système de progression
4. Intégrer un éditeur de code avancé (Monaco Editor)
5. Ajouter des vidéos et médias
6. Système de badges et certifications
