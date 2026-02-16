# L'Institut de l'informatique — Explication du projet de A à Z

Ce document décrit le projet dans son ensemble et **pourquoi chaque fichier ou dossier existe**.

---

## 1. Vue d’ensemble du projet

**Objectif** : Plateforme d’apprentissage en 9 modules pour réaliser son site et son application, avec contenu en **français**, **anglais** et **arabe** (FR, EN, AR).

**Fonctionnalités principales** :
- Parcours de cours (Java, Angular, Docker, Kubernetes, AWS, Terraform, CI/CD, etc.)
- Leçons avec points clés, analogies, exemples, blocs de code
- Exercices et QCM avec corrigés
- Éditeur de code intégré
- Interface multilingue (i18n) et support RTL pour l’arabe

**Stack** : Backend Spring Boot, Frontend Angular, PostgreSQL, Docker, Kubernetes (EKS), AWS, Terraform, Prometheus, GitHub Actions, ArgoCD.

---

## 2. Racine du projet

| Fichier / Dossier | Rôle |
|-------------------|------|
| **README.md** | Point d’entrée : objectif, architecture, démarrage rapide, liens vers la doc. |
| **PROJECT_STRUCTURE.md** | Structure des dossiers, fonctionnalités, workflow, modèles de données. |
| **QUICK_START.md** | Démarrage rapide : Docker Compose ou dev local (backend + frontend). |
| **CONTRIBUTING.md** | Règles pour contribuer au projet. |
| **.gitignore** | Fichiers et dossiers ignorés par Git (node_modules, target, .env, etc.). |
| **.gitattributes** | Règles Git (fin de ligne, binaires, etc.). |
| **.env.example** | Modèle de variables d’environnement (DB, JWT, API_URL, AWS) sans secrets réels. |
| **docker-compose.yml** | Définition des services : postgres, backend, frontend, prometheus ; réseau et volumes. Utilisé en dev local et sur EC2. |
| **DOCKER_TROUBLESHOOTING.md** | Dépannage Docker (ports, santé des conteneurs, proxy). |
| **FIX_502_ERROR.md** | Guide pour corriger les erreurs 502 (backend injoignable). |
| **TROUBLESHOOTING_API.md** | Dépannage de l’API (CORS, proxy, URLs). |
| **TROUBLESHOOTING_COURSES.md** | Dépannage lié aux cours (données, proxy). |
| **check-backend.ps1** | Script PowerShell : vérifie que le backend répond (health, /api/courses). |
| **check-lessons.ps1** | Vérifie la cohérence des leçons (données, doublons). |
| **test-api.ps1** | Teste l’API (courses) et le frontend (localhost). |
| **add-on-conflict-to-lessons.ps1** | Script utilitaire pour gérer les conflits/ON CONFLICT dans les leçons. |
| **cleanup-duplicates.ps1** / **cleanup-lessons-duplicates.ps1** | Nettoyage des doublons dans les données. |
| **fix-duplicates.sql** / **fix-lessons-duplicates.sql** | Scripts SQL pour corriger les doublons en base. |
| **README_CONTENT.md** | Documentation dédiée au contenu pédagogique (optionnel). |

---

## 3. Backend (Spring Boot)

**Rôle** : API REST qui sert les cours, leçons, exercices et QCM. Données en base PostgreSQL, modèles multilingues (FR/EN/AR).

### Racine backend

| Fichier | Rôle |
|---------|------|
| **pom.xml** | Dépendances Maven (Spring Boot Web, JPA, PostgreSQL, validation, JWT, Actuator/Prometheus, Lombok, etc.) et configuration du build. |
| **Dockerfile** | Image Docker du backend : build Maven puis exécution du JAR sur un runtime Java. Expose le port 8080. |

### Point d’entrée

| Fichier | Rôle |
|---------|------|
| **InstitutApplication.java** | Classe principale Spring Boot : `@SpringBootApplication` et `main()`. Démarre l’application et charge la config. |

### Modèles (`model/`)

Entités JPA mappées sur les tables PostgreSQL.

| Fichier | Rôle |
|---------|------|
| **Course.java** | Entité Cours : titres/descriptions FR/EN/AR, niveau, ordre. |
| **Lesson.java** | Entité Leçon : contenu multilingue, points clés, analogies, exemples, blocs de code, lien vers un cours. |
| **Exercise.java** | Entité Exercice : type (CODING, QUIZ, etc.), description/solution multilingues, difficulté, lien vers une leçon. |
| **QuizQuestion.java** | Question de QCM : question, options, bonne réponse, explication (multilingue). |
| **CodeBlock.java** | Bloc de code (langage, contenu) pour les leçons. |
| **User.java** | Utilisateur (pour auth / progression future). |
| **Role.java** | Rôle (STUDENT, INSTRUCTOR, ADMIN). |
| **UserProgress.java** | Progression utilisateur (pour suivi futur). |

### Repositories (`repository/`)

Couche d’accès aux données (Spring Data JPA).

| Fichier | Rôle |
|---------|------|
| **CourseRepository.java** | CRUD et requêtes pour les cours (ex. par ordre). |
| **LessonRepository.java** | CRUD et requêtes pour les leçons (ex. par cours). |
| **ExerciseRepository.java** | CRUD et requêtes pour les exercices. |
| **UserRepository.java** | Accès utilisateurs (pour auth). |

### Services (`service/`)

Logique métier.

| Fichier | Rôle |
|---------|------|
| **CourseService.java** | Récupération/création/mise à jour des cours. |
| **LessonService.java** | Récupération/création/mise à jour des leçons (et contenu associé). |

### Contrôleurs (`controller/`)

Exposition de l’API REST.

| Fichier | Rôle |
|---------|------|
| **CourseController.java** | `/api/courses` : liste, détail, création, mise à jour. |
| **LessonController.java** | `/api/lessons` : par cours, par id. |
| **ExerciseController.java** | `/api/exercises` : par leçon, par id. |
| **QuizController.java** | `/api/quiz` : questions et réponses pour les QCM. |

### Config (`config/`)

| Fichier | Rôle |
|---------|------|
| **SecurityConfig.java** | Configuration CORS et règles de sécurité (endpoints publics / protégés, JWT préparé). |

### Utilitaires (`util/`)

| Fichier | Rôle |
|---------|------|
| **TextUtils.java** | Utilitaires pour le texte (nettoyage, extraction, etc.). |

### Ressources (`resources/`)

| Fichier | Rôle |
|---------|------|
| **application.yml** | Config Spring : datasource (PostgreSQL), JPA, SQL init (scripts listés), Actuator/Prometheus, JWT, logging. Définit le port 8080 et les endpoints exposés. |
| **data.sql** | Données initiales : rôles, cours (titres/descriptions FR/EN/AR), contraintes. Chargé au démarrage (mode embedded). |
| **lessons_exercises_data.sql** | Données des leçons et exercices (contenu pédagogique). |
| **complete_course_content.sql** | Complément de contenu pour les cours. |
| **generate_full_content.sql** | Contenu généré pour remplir les cours. |
| **all_courses_complete_content.sql** | Contenu complet de tous les cours. |
| **courses_6_to_11_content.sql** | Contenu des cours 6 à 11. |
| **missing_content_completion.sql** | Complément pour le contenu manquant. |

*Raison des plusieurs SQL* : découpage du contenu pédagogique (cours, leçons, exercices) pour faciliter la maintenance et l’évolution.

---

## 4. Frontend (Angular)

**Rôle** : Interface utilisateur SPA : liste des cours, détail d’un cours, lecture des leçons, exercices, QCM, éditeur de code. i18n FR/EN/AR et RTL.

### Racine frontend

| Fichier | Rôle |
|---------|------|
| **package.json** | Dépendances npm et scripts (build, start, test, i18n). |
| **angular.json** | Config du projet Angular : build (outputPath, assets, styles, i18n), serve, test. |
| **tsconfig.json** / **tsconfig.app.json** | Config TypeScript (compilateur, chemins, options). |
| **Dockerfile** | Build multi-stage : Node pour `npm run build`, puis Nginx pour servir les fichiers statiques + génération d’un certificat SSL auto-signé. Expose 80 et 443. |
| **nginx.conf** | Config Nginx : redirection HTTP → HTTPS, serveur HTTPS (certificats, TLS), proxy `/api` vers le backend. |

### Point d’entrée et shell

| Fichier | Rôle |
|---------|------|
| **src/index.html** | Page HTML racine (élément `<app-root>`). |
| **src/main.ts** | Bootstrap de l’application Angular. |
| **src/styles.scss** | Styles globaux (SCSS). |
| **src/app/app.component.ts** | Composant racine (shell : header, router-outlet, footer). |
| **src/app/app.module.ts** | Module principal : déclaration des composants, imports (HttpClient, routing, i18n), providers. |
| **src/app/app.routes.ts** | Routes : `''` → Home, `courses` → liste, `courses/:id` → détail, `lessons/:id` → leçon, `exercises/:id` → exercice, `**` → redirect. |

### Composants (`components/`)

| Composant | Rôle |
|-----------|------|
| **home** | Page d’accueil (présentation, lien vers les cours). |
| **course-list** | Liste des cours (appel API, affichage par niveau/ordre). |
| **course-detail** | Détail d’un cours et liste des leçons. |
| **lesson-view** | Affichage d’une leçon (contenu, points clés, code, exemples). |
| **exercise-view** | Affichage d’un exercice et QCM. |
| **code-editor** | Éditeur de code intégré pour les exercices de codage. |
| **header** | En-tête (logo, navigation, sélecteur de langue). |
| **footer** | Pied de page. |
| **language-selector** | Changement de langue (FR/EN/AR) et gestion du sens RTL. |

### Services (`services/`)

| Fichier | Rôle |
|---------|------|
| **course.service.ts** | Appels HTTP vers `/api/courses` (liste, détail). |
| **lesson.service.ts** | Appels HTTP vers `/api/lessons` (par cours, par id). |
| **language.service.ts** | Gestion de la langue courante et du sens d’affichage (RTL/LTR). |

Les URLs d’API sont relatives (`/api`), donc le même domaine que le front (Nginx proxy en prod).

---

## 5. Infrastructure et déploiement

### Terraform (`terraform/`)

**Rôle** : Infrastructure AWS en code (VPC, sous-réseaux, EC2, RDS, ALB, EKS éventuel, etc.).

| Fichier | Rôle |
|---------|------|
| **main.tf** | Backend S3, provider AWS, VPC, sous-réseaux public/privé, NAT, route tables, RDS PostgreSQL, security groups, EC2 (user_data avec Docker + docker-compose), ALB + target group + listeners HTTP/HTTPS (avec certificat ACM optionnel), et éventuellement EKS. |
| **variables.tf** | Variables : `aws_region`, `db_password`, `environment`, `acm_certificate_arn` (pour HTTPS). |
| **outputs.tf** | Sorties : `app_ec2_public_ip`, `app_alb_dns_name`, `app_alb_zone_id`, `rds_endpoint`, etc. |
| **LICENSE.txt** | Licence du dépôt Terraform (souvent MIT). |

### Kubernetes (`k8s/`)

**Rôle** : Manifests pour déployer l’app sur un cluster (EKS ou autre).

| Fichier | Rôle |
|---------|------|
| **namespace.yaml** | Namespace `institut` pour isoler les ressources. |
| **backend-deployment.yaml** | Deployment + Service du backend (image, port 8080, env, health). |
| **frontend-deployment.yaml** | Deployment + Service du frontend (Nginx, port 80). |
| **postgres-deployment.yaml** | Deployment + Service PostgreSQL (ou utilisation d’un DB externe). |
| **prometheus-deployment.yaml** | Deployment Prometheus. |
| **prometheus-configmap.yaml** | Config Prometheus (scrape backend, etc.). |
| **secrets.yaml** | Secrets (mots de passe DB, etc.) pour K8s. |
| **pvc.yaml** | PersistentVolumeClaim pour les données (PostgreSQL, Prometheus). |

### ArgoCD (`argocd/`)

**Rôle** : GitOps — déploiement continu à partir du dépôt Git.

| Fichier | Rôle |
|---------|------|
| **applications.yaml** | Applications ArgoCD : backend, frontend, postgres, prometheus ; chacune pointe vers un manifest dans `k8s/` et le namespace `institut`, avec sync auto. |

### Monitoring (`monitoring/`)

| Fichier | Rôle |
|---------|------|
| **prometheus.yml** | Config Prometheus : scrape du backend (`/actuator/prometheus`), et optionnellement des pods Kubernetes annotés. |

---

## 6. CI/CD et scripts

### GitHub Actions (`.github/workflows/`)

| Fichier | Rôle |
|---------|------|
| **ci-cd.yml** | Pipeline : sur push/PR (main, develop) — build Maven du backend, tests, build Docker backend ; build Angular du frontend, build Docker frontend ; push des images vers un registre (ex. GHCR). Déclenche les builds et valide que le code compile et passe les tests. |

### Scripts (`scripts/`)

| Fichier | Rôle |
|---------|------|
| **init-project.sh** | Initialisation du projet (permissions, env, dépendances). |
| **setup-k8s.sh** | Configuration de l’accès au cluster K8s (kubeconfig, namespace). |

---

## 7. Documentation (`docs/`)

| Fichier | Rôle |
|---------|------|
| **GETTING_STARTED.md** | Guide de démarrage : prérequis, lancement backend/frontend, structure des données. |
| **DEPLOYMENT.md** | Déploiement AWS (Terraform, K8s, variables), HTTPS avec ALB + certificat ACM, CI/CD, monitoring. |
| **GITOPS.md** | Utilisation d’ArgoCD pour déployer à partir du dépôt. |
| **COURSE_CONTENT.md** | Description du contenu des cours. |
| **CONTENT_STATUS.md** / **CONTENT_COMPLETION_STATUS.md** | État d’avancement du contenu pédagogique. |
| **CONTENT_GENERATION_GUIDE.md** | Comment générer ou compléter le contenu. |
| **FINAL_CONTENT_SUMMARY.md** | Résumé final du contenu. |
| **PROJET_A_Z.md** | Ce document : explication du projet de A à Z et raison d’être des fichiers. |

---

## 8. Parcours d’une requête (résumé)

1. **Utilisateur** ouvre le frontend (Nginx) en HTTPS.
2. **Nginx** sert les fichiers Angular et redirige `/api/*` vers le **backend** (Spring Boot).
3. Le **backend** interroge **PostgreSQL** (cours, leçons, exercices, QCM) et renvoie du JSON.
4. Le **frontend** affiche les données et gère la langue (FR/EN/AR) et le RTL.
5. En production AWS : **ALB** (HTTPS avec ACM) → **EC2** (Docker Compose) ou **EKS** (pods backend/frontend/DB/Prometheus).
6. **Terraform** crée la VPC, l’EC2, l’ALB, la base RDS, etc. **GitHub Actions** build et pousse les images. **ArgoCD** (optionnel) déploie les manifests K8s depuis le dépôt.

---

## 9. Résumé par « pourquoi ce fichier existe »

- **Backend** : exposer une API REST fiable pour le contenu pédagogique et préparer auth/progression.
- **Frontend** : offrir une interface claire, multilingue et RTL pour apprendre.
- **PostgreSQL + scripts SQL** : stocker cours/leçons/exercices/QCM de façon structurée et évolutive.
- **Docker / docker-compose** : même environnement en local et sur l’EC2, déploiement simple.
- **Terraform** : reproduire l’infra AWS (VPC, EC2, ALB, RDS, HTTPS) de façon reproductible.
- **K8s + ArgoCD** : option de déploiement orchestré et GitOps.
- **Prometheus** : métriques et santé du backend pour le monitoring.
- **CI/CD** : qualité du code et images à jour à chaque push.
- **Documentation** : permettre à quelqu’un d’autre (ou à toi plus tard) de comprendre, démarrer et déployer le projet de A à Z.
