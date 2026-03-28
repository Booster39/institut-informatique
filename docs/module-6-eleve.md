# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 6 (30 cours) - Déploiement et production : Docker, cloud, CI/CD

### Résumé
Ce module vous plonge dans l'univers du déploiement professionnel et de la mise en production d'applications. Vous apprendrez à maîtriser Docker pour la conteneurisation, les plateformes cloud pour l'hébergement scalable, et les pipelines CI/CD pour l'automatisation complète du développement. En transformant votre application "Tâches" en une solution production-ready, vous découvrirez les concepts de monitoring, logging, sécurité en production, scaling automatique, et gestion des environnements multiples. Ce module fait le pont entre le développement et l'exploitation, vous donnant les compétences pour déployer et maintenir des applications robustes dans des environnements cloud professionnels.

### Rappel du projet fil rouge (on conserve "Tâches")
Tu vas repartir de l'application complète du Module 5 (API REST + Interface moderne) et la transformer en solution production :
1. Conteneuriser l'application avec Docker (backend + frontend + base de données)
2. Déployer sur une plateforme cloud (AWS, Azure, ou GCP)
3. Mettre en place un pipeline CI/CD complet
4. Configurer le monitoring et les alertes
5. Implémenter la sécurité et les backups
6. Optimiser pour la haute disponibilité et le scaling

### Hypothèses
- **Docker** : Maîtrise des concepts de base de conteneurisation
- **Git/GitHub** : Gestion de version et collaboration
- **Python 3.11+** : Environnements virtuels et dépendances
- **Cloud Provider** : Choix entre AWS, Azure, GCP, ou Railway/Render
- **Linux/WSL** : Connaissances de base des commandes système
- **APIs REST** : Application avec endpoints à déployer

### Rythme
- **4 cours par semaine** : Rythme soutenu pour maîtriser les concepts DevOps
- **30 cours pour ce module** : Environ 7 semaines et demie de mise en production
- **Chaque cours dure 1 heure** : Théorie sur les architectures de production, démonstration pratique de déploiements, exercices de configuration d'infrastructure, QCM sur les bonnes pratiques, et devoir de déploiement d'application

---

## Planning (30 cours)
| Cours | Thème principal | Objectif du cours |
|---:|---|---|
| 1 | Introduction au DevOps | Concepts et culture DevOps |
| 2 | Docker - Premiers pas | Installation et premiers conteneurs |
| 3 | Dockerfile et images | Création d'images personnalisées |
| 4 | Docker Compose | Orchestration multi-conteneurs |
| 5 | Volumes et réseaux Docker | Persistance et communication |
| 6 | Optimisation Docker | Images légères et sécurité |
| 7 | Introduction au cloud | Concepts et providers cloud |
| 8 | AWS - Premiers pas | Configuration et services de base |
| 9 | Déploiement sur EC2 | Serveurs virtuels et configuration |
| 10 | RDS et bases de données cloud | Gestion des données dans le cloud |
| 11 | S3 et stockage objet | Stockage de fichiers scalable |
| 12 | Azure - Services principaux | Container Apps et App Service |
| 13 | Google Cloud Run | Déploiement serverless |
| 14 | Comparaison des clouds | Choix du provider adapté |
| 15 | Introduction à CI/CD | Concepts d'intégration continue |
| 16 | GitHub Actions | Pipelines automatisés |
| 17 | Tests automatisés | Intégration des tests dans CI |
| 18 | Déploiement automatisé | CD avec GitHub Actions |
| 19 | Environnements multiples | Dev/Staging/Prod |
| 20 | Secrets et sécurité CI/CD | Gestion sécurisée des credentials |
| 21 | Monitoring et logging | Observabilité des applications |
| 22 | ELK Stack | Centralisation des logs |
| 23 | Métriques et alertes | Prometheus et Grafana |
| 24 | Haute disponibilité | Load balancing et failover |
| 25 | Scaling automatique | Auto-scaling et optimisation |
| 26 | Backup et récupération | Stratégies de sauvegarde |
| 27 | Sécurité en production | Hardening et conformité |
| 28 | Performance et optimisation | Cache et CDN |
| 29 | Revue et optimisation finale | Nettoyage et préparation prod |
| 30 | Soutenance module 6 | Démo de l'infrastructure complète |

---

## Cours 1 - Introduction au DevOps
**Objectifs**
- Comprendre la culture et les pratiques DevOps
- Différencier DevOps d'autres méthodologies
- Identifier les bénéfices pour les équipes

**Leçon (30 min - détaillée)**
DevOps représente l'union du développement (Dev) et des opérations (Ops), créant une culture de collaboration et d'automatisation.

**Culture DevOps**
- **Collaboration** : Équipes Dev et Ops travaillent ensemble
- **Automatisation** : Tout ce qui peut être automatisé l'est
- **Continuous Improvement** : Amélioration continue des processus
- **Responsabilité partagée** : Toute l'équipe est responsable de la qualité

**Pratiques DevOps essentielles**
- **CI/CD** : Intégration et déploiement continus
- **Infrastructure as Code** : Gestion automatique de l'infrastructure
- **Monitoring** : Observabilité continue des applications
- **Sécurité intégrée** : DevSecOps

**Bénéfices DevOps**
- **Déploiement plus rapide** : Livraison continue des fonctionnalités
- **Fiabilité accrue** : Moins d'erreurs grâce à l'automatisation
- **Collaboration améliorée** : Communication entre équipes
- **Innovation accélérée** : Focus sur la valeur métier

**Outils DevOps courants**
- **Conteneurisation** : Docker, Kubernetes
- **CI/CD** : GitHub Actions, Jenkins, GitLab CI
- **Cloud** : AWS, Azure, GCP
- **Monitoring** : Prometheus, Grafana, ELK Stack
- **IaC** : Terraform, CloudFormation

**Démonstration pratique (15 min)**
Exploration d'un pipeline DevOps simple avec GitHub Actions.

**Exercices guidés (10 min)**
1. Identifier les pratiques DevOps dans un projet existant
2. Analyser les bénéfices potentiels pour une équipe
3. Comparer DevOps avec d'autres méthodologies

**QCM d'auto-évaluation (3 min)**
1. Que signifie DevOps ?
2. Quelle pratique est centrale dans DevOps ?
3. Quel bénéfice principal apporte DevOps ?

**Devoir**
Analyser un projet open source et identifier les pratiques DevOps utilisées.

---

## Cours 2 - Docker - Premiers pas
**Objectifs**
- Installer Docker et comprendre son architecture
- Exécuter ses premiers conteneurs
- Maîtriser les commandes de base

**Leçon (30 min - détaillée)**
Docker est la technologie de conteneurisation qui révolutionne le déploiement d'applications.

**Qu'est-ce qu'un conteneur ?**
Un conteneur est une unité légère et portable qui contient tout le nécessaire pour exécuter une application : code, runtime, outils système, bibliothèques.

**Architecture Docker**
- **Docker Engine** : Moteur d'exécution des conteneurs
- **Images** : Modèles immutables des conteneurs
- **Conteneurs** : Instances exécutables des images
- **Docker Hub** : Registre public d'images

**Installation et vérification**
```bash
# Installation sur Ubuntu/Debian
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Vérification
docker --version
docker run hello-world
```

**Commandes essentielles**
```bash
# Lister les conteneurs
docker ps -a

# Télécharger une image
docker pull ubuntu:latest

# Exécuter un conteneur
docker run -it ubuntu:latest /bin/bash

# Arrêter un conteneur
docker stop <container_id>

# Supprimer un conteneur
docker rm <container_id>
```

**Démonstration pratique (15 min)**
Installation de Docker et exécution des premiers conteneurs.

**Exercices guidés (10 min)**
1. Installer Docker sur votre système
2. Exécuter un conteneur Ubuntu interactif
3. Explorer le système de fichiers du conteneur

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour lister les conteneurs ?
2. Quelle différence entre image et conteneur ?
3. Comment exécuter un conteneur en arrière-plan ?

**Devoir**
Installer Docker et exécuter 3 conteneurs différents (nginx, redis, postgres).

---

## Cours 3 - Dockerfile et images
**Objectifs**
- Écrire des Dockerfiles efficaces
- Comprendre les bonnes pratiques de création d'images
- Optimiser la taille et la sécurité des images

**Leçon (30 min - détaillée)**
Un Dockerfile est un script qui décrit comment construire une image Docker.

**Structure d'un Dockerfile**
```dockerfile
# Image de base
FROM python:3.11-slim

# Auteur
LABEL maintainer="votre-email@example.com"

# Répertoire de travail
WORKDIR /app

# Copie des fichiers de dépendances
COPY requirements.txt .

# Installation des dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copie du code source
COPY . .

# Exposition du port
EXPOSE 5000

# Commande de démarrage
CMD ["python", "app.py"]
```

**Instructions Dockerfile importantes**
- **FROM** : Image de base
- **RUN** : Exécution de commandes lors du build
- **COPY/ADD** : Copie de fichiers
- **WORKDIR** : Répertoire de travail
- **EXPOSE** : Ports exposés
- **CMD/ENTRYPOINT** : Commande d'exécution

**Bonnes pratiques**
```dockerfile
# Utiliser des images officielles et légères
FROM python:3.11-slim

# Installer uniquement les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copier d'abord les dépendances pour optimiser le cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Ne pas exécuter en root
RUN useradd --create-home --shell /bin/bash app
USER app

# Utiliser .dockerignore
# .dockerignore
# __pycache__
# .git
# .env
# *.log
```

**Construction et gestion d'images**
```bash
# Construire une image
docker build -t mon-app:latest .

# Lister les images
docker images

# Taguer une image
docker tag mon-app:latest mon-app:v1.0

# Pousser sur Docker Hub
docker login
docker push mon-app:v1.0
```

**Démonstration pratique (15 min)**
Écriture et construction d'un Dockerfile pour une application Python.

**Exercices guidés (10 min)**
1. Créer un Dockerfile basique pour une app Flask
2. Optimiser le Dockerfile avec les bonnes pratiques
3. Construire et pousser l'image sur Docker Hub

**QCM d'auto-évaluation (3 min)**
1. Quelle instruction pour l'image de base ?
2. Pourquoi copier requirements.txt en premier ?
3. Quelle commande pour construire une image ?

**Devoir**
Créer un Dockerfile optimisé pour l'application "Tâches" avec sécurité et performance.

---

## Cours 4 - Docker Compose
**Objectifs**
- Orchestrer des applications multi-conteneurs
- Configurer les réseaux et volumes
- Déployer des stacks complètes

**Leçon (30 min - détaillée)**
Docker Compose permet de définir et gérer des applications multi-conteneurs.

**Fichier docker-compose.yml**
```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "5000:5000"
    environment:
      - FLASK_ENV=development
    depends_on:
      - db
    volumes:
      - .:/app
      - /app/__pycache__

  db:
    image: postgres:15
    environment:
      POSTGRES_DB: tasks
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  postgres_data:
```

**Services et dépendances**
- **Services** : Définition de chaque conteneur
- **Depends_on** : Ordre de démarrage des services
- **Environment** : Variables d'environnement
- **Volumes** : Persistance des données
- **Networks** : Isolation réseau

**Commandes Docker Compose**
```bash
# Démarrer tous les services
docker-compose up -d

# Suivre les logs
docker-compose logs -f

# Arrêter les services
docker-compose down

# Reconstruire et redémarrer
docker-compose up --build

# Exécuter des commandes dans un service
docker-compose exec web bash
```

**Configuration avancée**
```yaml
version: '3.8'

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile.prod
    env_file:
      - .env.prod
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:5000/health"]
      interval: 30s
      timeout: 10s
      retries: 3

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/ssl/certs
    depends_on:
      - web

networks:
  default:
    driver: bridge
```

**Démonstration pratique (15 min)**
Création d'un docker-compose.yml pour l'application "Tâches" complète.

**Exercices guidés (10 min)**
1. Définir les services pour backend, frontend et base de données
2. Configurer les volumes et réseaux
3. Tester le déploiement multi-conteneurs

**QCM d'auto-évaluation (3 min)**
1. Quelle version de Compose utiliser ?
2. Comment définir un volume nommé ?
3. Quelle commande pour démarrer en arrière-plan ?

**Devoir**
Créer un docker-compose.yml complet pour l'application "Tâches" avec tous les services nécessaires.

---

## Cours 5 - Volumes et réseaux Docker
**Objectifs**
- Comprendre la persistance des données
- Configurer les réseaux de conteneurs
- Sécuriser les communications inter-conteneurs

**Leçon (30 min - détaillée)**
Volumes et réseaux permettent aux conteneurs de communiquer et persister leurs données.

**Types de volumes**
```bash
# Volume nommé (recommandé)
docker volume create mon_volume
docker run -v mon_volume:/data ubuntu

# Bind mount (développement)
docker run -v /host/path:/container/path ubuntu

# Volume anonyme
docker run -v /data ubuntu
```

**Gestion des volumes dans Compose**
```yaml
volumes:
  # Volume nommé
  postgres_data:
    driver: local
  
  # Bind mount pour le développement
  app_code:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: ./app

services:
  web:
    volumes:
      - app_code:/app
      - /app/__pycache__  # Volume anonyme pour exclure le cache
  
  db:
    volumes:
      - postgres_data:/var/lib/postgresql/data
```

**Réseaux Docker**
```bash
# Créer un réseau
docker network create mon_reseau

# Connecter un conteneur
docker run --network mon_reseau --name web nginx
docker run --network mon_reseau --name db postgres

# Inspecter un réseau
docker network inspect mon_reseau
```

**Réseaux dans Compose**
```yaml
networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
    internal: true  # Réseau isolé

services:
  web:
    networks:
      - frontend
      - backend
  
  db:
    networks:
      - backend
  
  nginx:
    networks:
      - frontend
```

**Sécurité réseau**
```yaml
# Réseau avec chiffrement (Docker Enterprise)
networks:
  secure_net:
    driver: overlay
    options:
      encrypted: "true"

# Firewall avec iptables
services:
  web:
    cap_add:
      - NET_ADMIN
    command: >
      sh -c "
      iptables -A INPUT -p tcp --dport 80 -j ACCEPT &&
      iptables -A INPUT -j DROP &&
      nginx -g 'daemon off;'
      "
```

**Démonstration pratique (15 min)**
Configuration des volumes et réseaux pour une application multi-conteneurs.

**Exercices guidés (10 min)**
1. Créer des volumes pour persister les données
2. Configurer un réseau isolé pour la base de données
3. Tester la communication inter-conteneurs

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre volume nommé et bind mount ?
2. Comment isoler un réseau ?
3. Quelle commande pour inspecter un réseau ?

**Devoir**
Configurer volumes et réseaux sécurisés pour l'application "Tâches" en production.

---

## Cours 6 - Optimisation Docker
**Objectifs**
- Créer des images légères et sécurisées
- Optimiser les performances des conteneurs
- Mettre en place des bonnes pratiques de sécurité

**Leçon (30 min - détaillée)**
L'optimisation Docker est cruciale pour les performances et la sécurité en production.

**Images multi-stage pour réduire la taille**
```dockerfile
# Build stage
FROM python:3.11-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Production stage
FROM python:3.11-slim

# Installer uniquement les dépendances runtime
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Créer un utilisateur non-root
RUN useradd --create-home --shell /bin/bash app

WORKDIR /app

# Copier les dépendances installées
COPY --from=builder /root/.local /home/app/.local
ENV PATH=/home/app/.local/bin:$PATH

# Copier le code source
COPY . .

# Changer les permissions
RUN chown -R app:app /app
USER app

EXPOSE 5000
CMD ["python", "app.py"]
```

**Optimisations de build**
```dockerfile
# Utiliser des images Alpine pour la légèreté
FROM python:3.11-alpine

# Installer les dépendances système en une couche
RUN apk add --no-cache \
    postgresql-dev \
    gcc \
    musl-dev \
    && pip install --no-cache-dir psycopg2-binary \
    && apk del gcc musl-dev

# .dockerignore optimisé
__pycache__
*.pyc
*.pyo
.git
.env
*.log
.coverage
.pytest_cache
node_modules
```

**Sécurité des conteneurs**
```dockerfile
# Scanner les vulnérabilités
FROM aquasec/trivy:latest AS scanner
COPY --from=builder /app /app
RUN trivy filesystem --exit-code 1 --no-progress /app

# Image finale sécurisée
FROM python:3.11-slim

# Pas de root
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Permissions minimales
RUN mkdir /app && chown appuser:appuser /app
WORKDIR /app
USER appuser

# Ne pas exposer de secrets
# ENV SECRET_KEY=...  # JAMAIS en dur
```

**Optimisations de performance**
```yaml
services:
  web:
    build:
      context: .
      target: production  # Utiliser le stage de prod
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
    
    # Health checks
    healthcheck:
      test: ["CMD", "python", "-c", "import requests; requests.get('http://localhost:5000/health')"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

**Démonstration pratique (15 min)**
Optimisation d'un Dockerfile existant pour réduire la taille et améliorer la sécurité.

**Exercices guidés (10 min)**
1. Implémenter le multi-stage build
2. Réduire la taille de l'image de 50%
3. Ajouter des vérifications de sécurité

**QCM d'auto-évaluation (3 min)**
1. Quel est l'avantage du multi-stage build ?
2. Pourquoi éviter root dans les conteneurs ?
3. Quelle instruction pour les health checks ?

**Devoir**
Optimiser complètement le Dockerfile de l'application "Tâches" pour la production.

---

## Cours 7 - Introduction au cloud
**Objectifs**
- Comprendre les concepts du cloud computing
- Différencier les modèles de service (IaaS, PaaS, SaaS)
- Choisir le bon provider selon les besoins

**Leçon (30 min - détaillée)**
Le cloud computing offre des ressources informatiques à la demande via internet.

**Modèles de service cloud**
- **IaaS (Infrastructure as Code)** : Serveurs virtuels, stockage, réseaux
  - Exemples : EC2 (AWS), VMs (Azure), Compute Engine (GCP)
  - Contrôle total, responsabilité maximale

- **PaaS (Platform as Code)** : Plateformes de développement et déploiement
  - Exemples : Elastic Beanstalk (AWS), App Service (Azure), App Engine (GCP)
  - Moins de gestion infrastructure, focus sur le code

- **SaaS (Software as Code)** : Applications complètes
  - Exemples : Gmail, Office 365, Salesforce
  - Pas de gestion technique

**Avantages du cloud**
- **Scalabilité** : Ressources à la demande
- **Économique** : Pay-as-you-go
- **Fiabilité** : Haute disponibilité
- **Sécurité** : Centres de données sécurisés
- **Innovation** : Accès aux dernières technologies

**Providers cloud principaux**
- **AWS (Amazon Web Services)** : Leader du marché, services complets
- **Azure (Microsoft)** : Bonne intégration entreprise, hybride
- **GCP (Google Cloud Platform)** : Innovation IA/ML, conteneurs
- **Services alternatifs** : Railway, Render, Vercel (plus simples)

**Stratégies de déploiement**
- **Lift and Shift** : Migration directe d'applications existantes
- **Cloud-native** : Applications conçues pour le cloud
- **Hybrid** : Combinaison cloud et on-premise

**Démonstration pratique (15 min)**
Création d'un compte cloud gratuit et exploration de la console.

**Exercices guidés (10 min)**
1. Comparer les offres gratuites des providers
2. Identifier le modèle de service adapté à différents cas d'usage
3. Analyser les coûts estimés pour une petite application

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre IaaS et PaaS ?
2. Quel avantage principal du cloud ?
3. Quel provider pour l'innovation IA ?

**Devoir**
Analyser les besoins de l'application "Tâches" et recommander un provider cloud adapté.

---

## Cours 8 - AWS - Premiers pas
**Objectifs**
- Créer un compte AWS et configurer l'accès
- Comprendre l'interface de gestion AWS
- Maîtriser les concepts de base (régions, zones de disponibilité)

**Leçon (30 min - détaillée)**
AWS offre plus de 200 services cloud pour tous les besoins informatiques.

**Création de compte AWS**
1. S'inscrire sur aws.amazon.com
2. Vérifier l'identité (carte bancaire requise mais pas débitée)
3. Activer l'offre gratuite (12 mois pour la plupart des services)
4. Configurer MFA (recommandé)

**Configuration de l'accès**
```bash
# Installer AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configurer les credentials
aws configure
# AWS Access Key ID: [votre-key]
# AWS Secret Access Key: [votre-secret]
# Default region name: eu-west-3
# Default output format: json
```

**Concepts fondamentaux AWS**
- **Régions** : Zones géographiques (eu-west-1, us-east-1, etc.)
- **Availability Zones** : Centres de données dans une région
- **VPC (Virtual Private Cloud)** : Réseau virtuel isolé
- **Security Groups** : Firewall virtuel
- **IAM (Identity and Access Management)** : Gestion des utilisateurs et permissions

**Console AWS**
- **EC2 Dashboard** : Gestion des instances
- **S3** : Stockage objet
- **RDS** : Bases de données managées
- **CloudWatch** : Monitoring et logs
- **CloudFormation** : Infrastructure as Code

**Sécurité de base**
```bash
# Créer un utilisateur IAM avec permissions limitées
aws iam create-user --user-name dev-user
aws iam attach-user-policy --user-name dev-user --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# Générer des clés d'accès
aws iam create-access-key --user-name dev-user
```

**Démonstration pratique (15 min)**
Configuration d'un compte AWS et exploration de la console.

**Exercices guidés (10 min)**
1. Créer un compte AWS et activer l'offre gratuite
2. Installer et configurer AWS CLI
3. Explorer les services disponibles dans la console

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour configurer AWS CLI ?
2. Quelle différence entre région et availability zone ?
3. Quel service pour la gestion des utilisateurs ?

**Devoir**
Configurer un compte AWS sécurisé avec IAM et explorer les services de base.

---

## Cours 9 - Déploiement sur EC2
**Objectifs**
- Lancer et configurer des instances EC2
- Déployer une application sur un serveur virtuel
- Configurer la sécurité et les accès

**Leçon (30 min - détaillée)**
EC2 (Elastic Compute Cloud) fournit des serveurs virtuels redimensionnables dans le cloud.

**Lancement d'une instance EC2**
```bash
# Créer un key pair pour SSH
aws ec2 create-key-pair --key-name my-key-pair --query 'KeyMaterial' --output text > my-key-pair.pem
chmod 400 my-key-pair.pem

# Lancer une instance
aws ec2 run-instances \
  --image-id ami-0c55b159cbfafe1d0c \
  --count 1 \
  --instance-type t2.micro \
  --key-name my-key-pair \
  --security-group-ids sg-12345678 \
  --subnet-id subnet-12345678
```

**Configuration de l'instance**
```bash
# Se connecter en SSH
ssh -i my-key-pair.pem ec2-user@ec2-XX-XX-XX-XX.eu-west-3.compute.amazonaws.com

# Mettre à jour le système
sudo yum update -y

# Installer Docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
```

**Security Groups**
```bash
# Créer un security group
aws ec2 create-security-group \
  --group-name web-app-sg \
  --description "Security group for web application"

# Ajouter des règles
aws ec2 authorize-security-group-ingress \
  --group-id sg-12345678 \
  --protocol tcp \
  --port 22 \
  --cidr 0.0.0.0/0  # À restreindre en production

aws ec2 authorize-security-group-ingress \
  --group-id sg-12345678 \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0
```

**Déploiement de l'application**
```bash
# Cloner le repository
git clone https://github.com/votre-repo/tasks-app.git
cd tasks-app

# Construire et démarrer avec Docker Compose
docker-compose up -d --build

# Vérifier que l'application fonctionne
curl http://localhost:5000
```

**Démonstration pratique (15 min)**
Lancement d'une instance EC2 et déploiement d'une application conteneurisée.

**Exercices guidés (10 min)**
1. Lancer une instance EC2 avec Docker préinstallé
2. Configurer les security groups appropriés
3. Déployer l'application "Tâches" sur l'instance

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour lancer une instance EC2 ?
2. Quel type d'instance pour les tests ?
3. Comment restreindre l'accès SSH ?

**Devoir**
Déployer complètement l'application "Tâches" sur une instance EC2 avec sécurité appropriée.

---

## Cours 10 - RDS et bases de données cloud
**Objectifs**
- Configurer une base de données managée RDS
- Migrer des données vers le cloud
- Optimiser les performances et la sécurité

**Leçon (30 min - détaillée)**
RDS (Relational Database Service) offre des bases de données relationnelles entièrement managées.

**Création d'une instance RDS**
```bash
# Créer une base PostgreSQL
aws rds create-db-instance \
  --db-instance-identifier tasks-db \
  --db-instance-class db.t3.micro \
  --engine postgres \
  --master-username admin \
  --master-user-password mypassword123 \
  --allocated-storage 20 \
  --vpc-security-group-ids sg-12345678 \
  --db-subnet-group-name my-subnet-group
```

**Configuration du réseau**
```bash
# Créer un subnet group
aws rds create-db-subnet-group \
  --db-subnet-group-name my-subnet-group \
  --db-subnet-group-description "Subnet group for tasks DB" \
  --subnet-ids subnet-12345678 subnet-87654321
```

**Connexion à RDS**
```python
# Configuration dans l'application
import os

DATABASE_URL = os.getenv('DATABASE_URL', 
    'postgresql://admin:mypassword123@tasks-db.xxxx.eu-west-3.rds.amazonaws.com:5432/tasks')

# SQLAlchemy configuration
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
```

**Migration des données**
```bash
# Dump de la base locale
pg_dump -h localhost -U user tasks > backup.sql

# Restaurer sur RDS
psql -h tasks-db.xxxx.eu-west-3.rds.amazonaws.com -U admin -d tasks < backup.sql
```

**Optimisations RDS**
```bash
# Configurer les backups automatiques
aws rds modify-db-instance \
  --db-instance-identifier tasks-db \
  --backup-retention-period 7 \
  --preferred-backup-window "03:00-04:00"

# Activer Multi-AZ pour la haute disponibilité
aws rds modify-db-instance \
  --db-instance-identifier tasks-db \
  --multi-az \
  --apply-immediately
```

**Monitoring RDS**
```bash
# Métriques CloudWatch
aws cloudwatch get-metric-statistics \
  --namespace AWS/RDS \
  --metric-name DatabaseConnections \
  --start-time 2024-01-01T00:00:00Z \
  --end-time 2024-01-01T01:00:00Z \
  --period 3600 \
  --statistics Maximum
```

**Démonstration pratique (15 min)**
Création d'une instance RDS et migration des données de l'application.

**Exercices guidés (10 min)**
1. Créer une instance RDS PostgreSQL
2. Configurer les security groups pour l'accès
3. Migrer les données depuis la base locale

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour créer une instance RDS ?
2. Quelle classe d'instance pour le développement ?
3. Comment activer les backups automatiques ?

**Devoir**
Configurer RDS pour l'application "Tâches" avec haute disponibilité et monitoring.

---

## Cours 11 - S3 et stockage objet
**Objectifs**
- Maîtriser le stockage objet avec S3
- Gérer les fichiers statiques dans le cloud
- Configurer les permissions et la sécurité

**Leçon (30 min - détaillée)**
S3 (Simple Storage Service) offre un stockage objet scalable et durable.

**Création d'un bucket S3**
```bash
# Créer un bucket
aws s3 mb s3://my-tasks-app-bucket

# Lister les buckets
aws s3 ls

# Configurer le versioning
aws s3api put-bucket-versioning \
  --bucket my-tasks-app-bucket \
  --versioning-configuration Status=Enabled
```

**Upload et gestion de fichiers**
```bash
# Upload d'un fichier
aws s3 cp image.jpg s3://my-tasks-app-bucket/images/

# Upload récursif d'un dossier
aws s3 cp ./static s3://my-tasks-app-bucket/static --recursive

# Téléchargement
aws s3 cp s3://my-tasks-app-bucket/backup.sql ./backup.sql

# Synchronisation
aws s3 sync ./static s3://my-tasks-app-bucket/static
```

**Politiques et permissions**
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-tasks-app-bucket/static/*"
        }
    ]
}
```

```bash
# Appliquer la politique
aws s3api put-bucket-policy --bucket my-tasks-app-bucket --policy file://policy.json

# Configurer CORS pour les applications web
aws s3api put-bucket-cors --bucket my-tasks-app-bucket --cors-configuration file://cors.json
```

**Intégration avec l'application**
```python
import boto3
from botocore.client import Config

# Configuration S3
s3 = boto3.client(
    's3',
    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
    config=Config(signature_version='s3v4'),
    region_name='eu-west-3'
)

def upload_file_to_s3(file, bucket_name, key):
    """Upload un fichier vers S3"""
    try:
        s3.upload_fileobj(file, bucket_name, key)
        # Générer une URL signée
        url = s3.generate_presigned_url(
            'get_object',
            Params={'Bucket': bucket_name, 'Key': key},
            ExpiresIn=3600  # 1 heure
        )
        return url
    except Exception as e:
        print(f"Erreur upload S3: {e}")
        return None

# Dans l'application Flask
@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No file selected'}), 400
    
    # Upload vers S3
    key = f"uploads/{file.filename}"
    url = upload_file_to_s3(file, 'my-tasks-app-bucket', key)
    
    if url:
        return jsonify({'url': url})
    else:
        return jsonify({'error': 'Upload failed'}), 500
```

**Optimisations S3**
```bash
# Configurer le stockage intelligent
aws s3api put-bucket-intelligent-tiering-configuration \
  --bucket my-tasks-app-bucket \
  --id EntireBucket \
  --intelligent-tiering-configuration file://intelligent-tiering.json

# Activer le chiffrement par défaut
aws s3api put-bucket-encryption \
  --bucket my-tasks-app-bucket \
  --server-side-encryption-configuration file://encryption.json
```

**Démonstration pratique (15 min)**
Configuration d'un bucket S3 et intégration avec l'application.

**Exercices guidés (10 min)**
1. Créer un bucket S3 avec versioning
2. Configurer les permissions publiques pour les assets statiques
3. Intégrer l'upload de fichiers dans l'application

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour créer un bucket ?
2. Comment rendre un fichier public ?
3. Quelle méthode pour générer une URL signée ?

**Devoir**
Configurer S3 pour stocker les fichiers statiques et uploads de l'application "Tâches".

---

## Cours 12 - Azure - Services principaux
**Objectifs**
- Découvrir les services Azure pour le déploiement
- Maîtriser Container Apps et App Service
- Comparer avec les équivalents AWS

**Leçon (30 min - détaillée)**
Azure offre une suite complète de services cloud avec une forte intégration Microsoft.

**Azure Container Apps**
```bash
# Installer Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Se connecter
az login

# Créer un groupe de ressources
az group create --name tasks-rg --location francecentral

# Créer un environnement Container Apps
az containerapp env create \
  --name tasks-env \
  --resource-group tasks-rg \
  --location francecentral
```

**Déploiement avec Container Apps**
```bash
# Déployer l'application
az containerapp create \
  --name tasks-app \
  --resource-group tasks-rg \
  --environment tasks-env \
  --image your-registry/tasks-app:latest \
  --target-port 5000 \
  --ingress external \
  --query properties.configuration.ingress.fqdn
```

**Azure App Service**
```bash
# Créer un plan App Service
az appservice plan create \
  --name tasks-plan \
  --resource-group tasks-rg \
  --sku B1 \
  --is-linux

# Créer une web app
az webapp create \
  --resource-group tasks-rg \
  --plan tasks-plan \
  --name tasks-webapp \
  --runtime "PYTHON:3.11"
```

**Base de données Azure**
```bash
# Créer une base PostgreSQL
az postgres server create \
  --resource-group tasks-rg \
  --name tasks-postgres \
  --location francecentral \
  --admin-user adminuser \
  --admin-password mypassword123 \
  --sku-name B_Gen5_1 \
  --version 15
```

**Stockage Azure**
```bash
# Créer un compte de stockage
az storage account create \
  --name taskstorage \
  --resource-group tasks-rg \
  --location francecentral \
  --sku Standard_LRS

# Créer un conteneur blob
az storage container create \
  --name uploads \
  --account-name taskstorage \
  --public-access blob
```

**Démonstration pratique (15 min)**
Déploiement d'une application sur Azure Container Apps.

**Exercices guidés (10 min)**
1. Créer les ressources Azure de base
2. Déployer l'application avec Container Apps
3. Configurer la base de données Azure

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour créer un groupe de ressources ?
2. Quelle différence entre Container Apps et App Service ?
3. Comment créer un conteneur blob ?

**Devoir**
Déployer l'application "Tâches" sur Azure avec tous les services nécessaires.

---

## Cours 13 - Google Cloud Run
**Objectifs**
- Maîtriser le déploiement serverless avec Cloud Run
- Configurer les services GCP de base
- Optimiser les coûts et performances

**Leçon (30 min - détaillée)**
Cloud Run offre un déploiement serverless basé sur des conteneurs.

**Configuration GCP**
```bash
# Installer gcloud CLI
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Se connecter
gcloud auth login
gcloud config set project your-project-id
```

**Déploiement sur Cloud Run**
```bash
# Builder et pousser l'image
gcloud builds submit --tag gcr.io/your-project/tasks-app

# Déployer sur Cloud Run
gcloud run deploy tasks-app \
  --image gcr.io/your-project/tasks-app \
  --platform managed \
  --region europe-west1 \
  --allow-unauthenticated \
  --port 5000 \
  --memory 1Gi \
  --cpu 1 \
  --max-instances 10
```

**Base de données Cloud SQL**
```bash
# Créer une instance PostgreSQL
gcloud sql instances create tasks-db \
  --database-version POSTGRES_15 \
  --tier db-f1-micro \
  --region europe-west1

# Créer une base de données
gcloud sql databases create tasks --instance tasks-db
```

**Cloud Storage**
```bash
# Créer un bucket
gsutil mb -p your-project gs://tasks-app-bucket

# Configurer l'accès public pour les assets
gsutil iam ch allUsers:objectViewer gs://tasks-app-bucket/static
```

**Optimisations Cloud Run**
```bash
# Configurer l'auto-scaling
gcloud run services update tasks-app \
  --min-instances 0 \
  --max-instances 100 \
  --concurrency 80 \
  --timeout 900

# Configurer les variables d'environnement
gcloud run services update tasks-app \
  --set-env-vars DATABASE_URL=your-db-url \
  --set-env-vars SECRET_KEY=your-secret
```

**Démonstration pratique (15 min)**
Déploiement d'une application conteneurisée sur Cloud Run.

**Exercices guidés (10 min)**
1. Configurer un projet GCP
2. Builder et pousser une image sur GCR
3. Déployer l'application sur Cloud Run

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour déployer sur Cloud Run ?
2. Comment configurer l'auto-scaling ?
3. Quelle région pour l'Europe ?

**Devoir**
Déployer l'application "Tâches" sur Google Cloud Run avec base de données et stockage.

---

## Cours 14 - Comparaison des clouds
**Objectifs**
- Comparer objectivement AWS, Azure et GCP
- Choisir le provider adapté selon les besoins
- Optimiser les coûts et performances

**Leçon (30 min - détaillée)**
Chaque provider cloud a ses forces et faiblesses selon les cas d'usage.

**Comparaison des services**

| Service | AWS | Azure | GCP |
|---------|-----|-------|-----|
| Compute | EC2 | VMs | Compute Engine |
| Serverless | Lambda | Functions | Cloud Functions |
| Containers | ECS/EKS | AKS | GKE |
| Database | RDS | Database | Cloud SQL |
| Storage | S3 | Blob Storage | Cloud Storage |
| CDN | CloudFront | CDN | Cloud CDN |

**Avantages par provider**
- **AWS** : Leader du marché, services complets, communauté importante
- **Azure** : Bonne intégration entreprise, hybrid cloud, outils Microsoft
- **GCP** : Innovation IA/ML, conteneurs, Big Data, tarifs compétitifs

**Coûts comparés**
- **AWS** : Pay-as-you-go détaillé, nombreuses options
- **Azure** : Tarifs hybrides avantageux, réservations
- **GCP** : Souvent moins cher, crédits gratuits généreux

**Critères de choix**
- **Besoin métier** : Quel service principal ?
- **Écosystème existant** : Intégration avec outils actuels
- **Compétences équipe** : Formation nécessaire
- **Coût total** : Calcul TCO sur 3 ans
- **Réglementation** : Conformité RGPD, données en Europe

**Migration entre clouds**
```bash
# Outils de migration AWS
# AWS Server Migration Service
# AWS Database Migration Service

# Outils Azure
# Azure Migrate
# Azure Database Migration Service

# Outils GCP
# Migrate for Compute Engine
# Database Migration Service
```

**Multi-cloud et hybrid**
- **Multi-cloud** : Utiliser plusieurs providers pour éviter le lock-in
- **Hybrid** : Combiner cloud et on-premise
- **Outils** : Terraform pour l'infrastructure multi-cloud

**Démonstration pratique (15 min)**
Analyse comparative des coûts et services pour un cas d'usage spécifique.

**Exercices guidés (10 min)**
1. Comparer les offres gratuites des 3 providers
2. Calculer les coûts estimés pour l'application "Tâches"
3. Recommander un provider selon différents critères

**QCM d'auto-évaluation (3 min)**
1. Quel provider pour l'innovation IA ?
2. Quelle stratégie pour éviter le lock-in ?
3. Quel critère pour le choix du provider ?

**Devoir**
Réaliser une analyse comparative complète et recommander un provider pour l'application "Tâches".

---

## Cours 15 - Introduction à CI/CD
**Objectifs**
- Comprendre les concepts de CI/CD
- Différencier CI, CD et déploiement
- Identifier les bénéfices pour le développement

**Leçon (30 min - détaillée)**
CI/CD automatise l'intégration et le déploiement du code pour accélérer le développement.

**Concepts fondamentaux**
- **CI (Continuous Integration)** : Intégration automatique des changements
- **CD (Continuous Delivery)** : Livraison automatique des releases
- **CD (Continuous Deployment)** : Déploiement automatique en production

**Pipeline CI/CD typique**
1. **Commit** : Développeur pousse le code
2. **Build** : Construction de l'application
3. **Test** : Exécution des tests automatisés
4. **Security Scan** : Analyse de sécurité
5. **Deploy Staging** : Déploiement en environnement de test
6. **Approval** : Validation manuelle si nécessaire
7. **Deploy Production** : Déploiement en production

**Bénéfices CI/CD**
- **Déploiement plus fréquent** : Livraisons régulières
- **Détection précoce des bugs** : Tests automatisés
- **Réduction des erreurs** : Automatisation des tâches répétitives
- **Feedback rapide** : Retours immédiats aux développeurs
- **Amélioration qualité** : Standards et contrôles automatisés

**Outils CI/CD populaires**
- **GitHub Actions** : Intégré à GitHub, facile à utiliser
- **GitLab CI** : Solution complète avec registry
- **Jenkins** : Très flexible, nombreux plugins
- **CircleCI** : Rapide, bonne intégration cloud
- **Azure DevOps** : Intégré à l'écosystème Microsoft

**Démonstration pratique (15 min)**
Configuration d'un pipeline CI/CD simple avec GitHub Actions.

**Exercices guidés (10 min)**
1. Identifier les étapes d'un pipeline CI/CD
2. Analyser les bénéfices pour une équipe
3. Comparer différents outils CI/CD

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre CI et CD ?
2. Quel bénéfice principal du CI/CD ?
3. Quel outil pour une intégration GitHub ?

**Devoir**
Analyser le processus de déploiement actuel et identifier les améliorations possibles avec CI/CD.

---

## Cours 16 - GitHub Actions
**Objectifs**
- Maîtriser la syntaxe des workflows GitHub Actions
- Créer des pipelines automatisés
- Intégrer les tests et déploiements

**Leçon (30 min - détaillée)**
GitHub Actions offre une plateforme CI/CD intégrée à GitHub.

**Structure d'un workflow**
```yaml
# .github/workflows/ci.yml
name: CI Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    
    - name: Run tests
      run: pytest tests/ -v --cov=app
    
    - name: Upload coverage
      uses: codecov/codecov-action@v3
```

**Actions et étapes**
```yaml
steps:
  - name: Checkout code
    uses: actions/checkout@v3
  
  - name: Login to Docker Hub
    uses: docker/login-action@v2
    with:
      username: ${{ secrets.DOCKER_USERNAME }}
      password: ${{ secrets.DOCKER_PASSWORD }}
  
  - name: Build and push Docker image
    uses: docker/build-push-action@v4
    with:
      context: .
      push: true
      tags: myapp:latest, myapp:${{ github.sha }}
  
  - name: Deploy to production
    if: github.ref == 'refs/heads/main'
    run: |
      echo "Deploying to production..."
      # Commandes de déploiement
```

**Secrets et variables**
```yaml
# Configuration des secrets dans GitHub
# Settings > Secrets and variables > Actions

env:
  DATABASE_URL: ${{ secrets.DATABASE_URL }}
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

steps:
  - name: Configure AWS credentials
    uses: aws-actions/configure-aws-credentials@v2
    with:
      aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      aws-region: eu-west-3
```

**Matrice de builds**
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [3.9, 3.10, 3.11]
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v4
      with:
        python-version: ${{ matrix.python-version }}
    
    - name: Install dependencies
      run: pip install -r requirements.txt
    
    - name: Run tests
      run: pytest tests/
```

**Démonstration pratique (15 min)**
Création d'un workflow GitHub Actions complet pour l'application.

**Exercices guidés (10 min)**
1. Créer un workflow de base avec tests
2. Ajouter le build et push Docker
3. Configurer le déploiement automatique

**QCM d'auto-évaluation (3 min)**
1. Où placer les workflows GitHub Actions ?
2. Quelle action pour builder des images Docker ?
3. Comment utiliser les secrets ?

**Devoir**
Créer un pipeline CI/CD complet pour l'application "Tâches" avec GitHub Actions.

---

## Cours 17 - Tests automatisés
**Objectifs**
- Intégrer les tests dans le pipeline CI/CD
- Maîtriser les tests unitaires, d'intégration et E2E
- Optimiser la couverture de code

**Leçon (30 min - détaillée)**
Les tests automatisés garantissent la qualité du code à chaque déploiement.

**Tests unitaires**
```python
# tests/test_app.py
import pytest
from app import create_app, db
from app.models import Task

@pytest.fixture
def app():
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()

@pytest.fixture
def client(app):
    return app.test_client()

def test_create_task(client):
    response = client.post('/api/tasks', 
                          json={'title': 'Test task', 'description': 'Test'})
    assert response.status_code == 201
    
    data = response.get_json()
    assert data['title'] == 'Test task'
    assert 'id' in data

def test_get_tasks(client):
    # Créer une tâche
    client.post('/api/tasks', json={'title': 'Test task'})
    
    # Récupérer les tâches
    response = client.get('/api/tasks')
    assert response.status_code == 200
    
    data = response.get_json()
    assert len(data) == 1
    assert data[0]['title'] == 'Test task'
```

**Tests d'intégration**
```python
# tests/test_integration.py
import pytest
import requests
from app import create_app

@pytest.fixture
def app_with_db():
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()

def test_full_task_workflow(app_with_db):
    with app_with_db.test_client() as client:
        # Créer une tâche
        response = client.post('/api/tasks', 
                              json={'title': 'Integration test'})
        assert response.status_code == 201
        task_id = response.get_json()['id']
        
        # Modifier la tâche
        response = client.put(f'/api/tasks/{task_id}', 
                             json={'title': 'Updated task', 'completed': True})
        assert response.status_code == 200
        
        # Vérifier la modification
        response = client.get(f'/api/tasks/{task_id}')
        assert response.status_code == 200
        data = response.get_json()
        assert data['title'] == 'Updated task'
        assert data['completed'] == True
        
        # Supprimer la tâche
        response = client.delete(f'/api/tasks/{task_id}')
        assert response.status_code == 204

def test_authentication_flow(app_with_db):
    with app_with_db.test_client() as client:
        # Inscription
        response = client.post('/api/auth/register', 
                              json={'username': 'testuser', 'password': 'testpass'})
        assert response.status_code == 201
        
        # Connexion
        response = client.post('/api/auth/login', 
                              json={'username': 'testuser', 'password': 'testpass'})
        assert response.status_code == 200
        token = response.get_json()['token']
        
        # Accès protégé
        response = client.get('/api/tasks', 
                             headers={'Authorization': f'Bearer {token}'})
        assert response.status_code == 200
```

**Tests E2E avec Selenium**
```python
# tests/test_e2e.py
import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

@pytest.fixture
def driver():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()

def test_user_journey(driver):
    driver.get("http://localhost:5000")
    
    # Attendre que la page charge
    WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "task-input"))
    )
    
    # Créer une tâche
    task_input = driver.find_element(By.ID, "task-input")
    task_input.send_keys("Tâche E2E")
    
    submit_button = driver.find_element(By.ID, "submit-task")
    submit_button.click()
    
    # Vérifier que la tâche apparaît
    WebDriverWait(driver, 10).until(
        EC.text_to_be_present_in_element((By.CLASS_NAME, "task-list"), "Tâche E2E")
    )
    
    assert "Tâche E2E" in driver.page_source
```

**Couverture de code**
```yaml
# Dans GitHub Actions
- name: Run tests with coverage
  run: |
    pip install pytest-cov
    pytest tests/ --cov=app --cov-report=xml

- name: Upload coverage to Codecov
  uses: codecov/codecov-action@v3
  with:
    file: ./coverage.xml
```

**Démonstration pratique (15 min)**
Écriture et exécution de tests automatisés pour l'application.

**Exercices guidés (10 min)**
1. Créer des tests unitaires pour les modèles
2. Écrire des tests d'intégration pour l'API
3. Configurer la couverture de code

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre test unitaire et d'intégration ?
2. Quel outil pour les tests E2E ?
3. Comment mesurer la couverture de code ?

**Devoir**
Implémenter une suite complète de tests automatisés pour l'application "Tâches".

---

## Cours 18 - Déploiement automatisé
**Objectifs**
- Automatiser le déploiement vers différents environnements
- Gérer les migrations de base de données
- Implémenter le rollback en cas d'erreur

**Leçon (30 min - détaillée)**
Le déploiement automatisé garantit des releases fiables et reproductibles.

**Stratégies de déploiement**
- **Blue-Green** : Deux environnements identiques, basculement instantané
- **Canary** : Déploiement progressif sur un sous-ensemble d'utilisateurs
- **Rolling Update** : Mise à jour progressive des instances

**Script de déploiement**
```bash
#!/bin/bash
# deploy.sh

set -e  # Arrêter en cas d'erreur

echo "🚀 Début du déploiement"

# Variables
APP_NAME="tasks-app"
ENVIRONMENT=$1
DOCKER_IMAGE="myregistry/$APP_NAME:latest"

# Validation
if [ "$ENVIRONMENT" != "staging" ] && [ "$ENVIRONMENT" != "production" ]; then
    echo "❌ Environnement invalide. Utiliser 'staging' ou 'production'"
    exit 1
fi

# Backup de la base de données
echo "💾 Création du backup..."
docker exec tasks-db pg_dump -U admin tasks > backup_$(date +%Y%m%d_%H%M%S).sql

# Build de l'image
echo "🏗️  Build de l'image Docker..."
docker build -t $DOCKER_IMAGE .

# Push de l'image
echo "📤 Push de l'image..."
docker push $DOCKER_IMAGE

# Migration de la base de données
echo "🗄️  Exécution des migrations..."
docker run --rm --network tasks-network \
  -e DATABASE_URL=$DATABASE_URL \
  $DOCKER_IMAGE flask db upgrade

# Déploiement
echo "🚀 Déploiement de l'application..."
if [ "$ENVIRONMENT" = "production" ]; then
    # Blue-green deployment
    docker tag $DOCKER_IMAGE tasks-app:blue
    docker-compose up -d app-blue
    
    # Health check
    sleep 30
    if curl -f http://localhost:5000/health; then
        echo "✅ Application healthy, switching traffic..."
        # Switch load balancer
        docker-compose up -d app-green
        docker-compose stop app-blue
    else
        echo "❌ Health check failed, rolling back..."
        docker-compose stop app-blue
        exit 1
    fi
else
    # Simple deployment pour staging
    docker-compose up -d --scale app=2
fi

# Nettoyage
echo "🧹 Nettoyage des anciennes images..."
docker image prune -f

echo "✅ Déploiement terminé avec succès!"
```

**Migrations automatisées**
```python
# migrations.py
import os
from flask_migrate import Migrate
from app import create_app, db

def run_migrations():
    """Exécute les migrations de base de données"""
    app = create_app(os.getenv('FLASK_ENV', 'production'))
    
    with app.app_context():
        # Vérifier si des migrations sont nécessaires
        from flask_migrate import upgrade
        try:
            upgrade()
            print("✅ Migrations exécutées avec succès")
        except Exception as e:
            print(f"❌ Erreur lors des migrations: {e}")
            raise

if __name__ == "__main__":
    run_migrations()
```

**Rollback automatique**
```bash
#!/bin/bash
# rollback.sh

echo "🔄 Rollback en cours..."

# Identifier la version précédente
PREVIOUS_IMAGE=$(docker images myapp --format "{{.Repository}}:{{.Tag}}" | sed -n '2p')

if [ -z "$PREVIOUS_IMAGE" ]; then
    echo "❌ Aucune version précédente trouvée"
    exit 1
fi

echo "📦 Rollback vers $PREVIOUS_IMAGE"

# Rollback de la base de données
echo "🗄️  Rollback des migrations..."
docker run --rm --network tasks-network \
  -e DATABASE_URL=$DATABASE_URL \
  $PREVIOUS_IMAGE flask db downgrade

# Redéployer l'ancienne version
docker-compose pull
docker-compose up -d

# Vérifier la santé
sleep 30
if curl -f http://localhost:5000/health; then
    echo "✅ Rollback réussi"
else
    echo "❌ Rollback échoué"
    exit 1
fi
```

**Déploiement avec GitHub Actions**
```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v2
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: eu-west-3
    
    - name: Run tests
      run: |
        pip install -r requirements.txt
        pytest tests/ -v
    
    - name: Build and push Docker image
      run: |
        aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin ${{ secrets.ECR_REGISTRY }}
        docker build -t tasks-app .
        docker tag tasks-app:latest ${{ secrets.ECR_REGISTRY }}/tasks-app:latest
        docker push ${{ secrets.ECR_REGISTRY }}/tasks-app:latest
    
    - name: Deploy to ECS
      run: |
        aws ecs update-service --cluster tasks-cluster --service tasks-service --force-new-deployment
```

**Démonstration pratique (15 min)**
Configuration d'un déploiement automatisé avec rollback.

**Exercices guidés (10 min)**
1. Créer un script de déploiement automatisé
2. Implémenter les migrations de base de données
3. Configurer le rollback automatique

**QCM d'auto-évaluation (3 min)**
1. Quelle stratégie pour un déploiement sans downtime ?
2. Comment gérer les migrations en CI/CD ?
3. Quand utiliser le rollback ?

**Devoir**
Mettre en place un système de déploiement automatisé complet avec rollback pour l'application "Tâches".

---

## Cours 19 - Environnements multiples
**Objectifs**
- Gérer plusieurs environnements (dev, staging, prod)
- Configurer les variables d'environnement
- Automatiser la promotion entre environnements

**Leçon (30 min - détaillée)**
Les environnements multiples permettent de tester les changements avant la production.

**Structure des environnements**
```
├── environments/
│   ├── development/
│   │   ├── docker-compose.yml
│   │   ├── .env
│   │   └── config.py
│   ├── staging/
│   │   ├── docker-compose.yml
│   │   ├── .env
│   │   └── config.py
│   └── production/
│       ├── docker-compose.yml
│       ├── .env
│       └── config.py
```

**Configuration par environnement**
```python
# config.py
import os

class Config:
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret')
    DEBUG = False
    TESTING = False
    DATABASE_URL = os.getenv('DATABASE_URL')

class DevelopmentConfig(Config):
    DEBUG = True
    DATABASE_URL = os.getenv('DATABASE_URL', 'postgresql://localhost/tasks_dev')

class StagingConfig(Config):
    DEBUG = False
    DATABASE_URL = os.getenv('DATABASE_URL')

class ProductionConfig(Config):
    DEBUG = False
    DATABASE_URL = os.getenv('DATABASE_URL')

# Sélection de la configuration
config = {
    'development': DevelopmentConfig,
    'staging': StagingConfig,
    'production': ProductionConfig
}

def get_config(env='development'):
    return config.get(env, DevelopmentConfig)
```

**Variables d'environnement**
```bash
# .env.development
FLASK_ENV=development
SECRET_KEY=dev-secret-key
DATABASE_URL=postgresql://user:pass@localhost:5432/tasks_dev
DEBUG=True

# .env.staging
FLASK_ENV=staging
SECRET_KEY=staging-secret-key
DATABASE_URL=postgresql://user:pass@staging-db:5432/tasks
DEBUG=False

# .env.production
FLASK_ENV=production
SECRET_KEY=prod-secret-key
DATABASE_URL=postgresql://user:pass@prod-db:5432/tasks
DEBUG=False
```

**Promotion automatique**
```yaml
# .github/workflows/promote.yml
name: Promote to Production

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Environment to promote to'
        required: true
        default: 'staging'
        type: choice
        options:
        - staging
        - production

jobs:
  promote:
    runs-on: ubuntu-latest
    
    environment: ${{ github.event.inputs.environment }}
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Configure environment
      run: |
        cp environments/${{ github.event.inputs.environment }}/.env .env
        cp environments/${{ github.event.inputs.environment }}/docker-compose.yml .
    
    - name: Deploy
      run: |
        docker-compose pull
        docker-compose up -d
        docker-compose run --rm app python manage.py migrate
```

**Secrets management**
```yaml
# GitHub Secrets par environnement
# Development: DEV_DATABASE_URL, DEV_SECRET_KEY
# Staging: STAGING_DATABASE_URL, STAGING_SECRET_KEY  
# Production: PROD_DATABASE_URL, PROD_SECRET_KEY

jobs:
  deploy:
    environment: production
    steps:
    - name: Deploy to production
      run: |
        export DATABASE_URL=${{ secrets.PROD_DATABASE_URL }}
        export SECRET_KEY=${{ secrets.PROD_SECRET_KEY }}
        docker-compose up -d
```

**Tests par environnement**
```yaml
jobs:
  test:
    strategy:
      matrix:
        environment: [development, staging]
    
    steps:
    - name: Run environment-specific tests
      run: |
        cp environments/${{ matrix.environment }}/.env .env
        pytest tests/ -v -k "not slow"
```

**Démonstration pratique (15 min)**
Configuration d'environnements multiples avec promotion automatique.

**Exercices guidés (10 min)**
1. Créer les configurations pour dev, staging et prod
2. Configurer les variables d'environnement
3. Mettre en place la promotion automatique

**QCM d'auto-évaluation (3 min)**
1. Combien d'environnements minimum ?
2. Où stocker les secrets de production ?
3. Comment promouvoir vers la production ?

**Devoir**
Configurer des environnements multiples complets pour l'application "Tâches" avec promotion automatique.

---

## Cours 20 - Secrets et sécurité CI/CD
**Objectifs**
- Gérer sécurisement les secrets dans CI/CD
- Implémenter les bonnes pratiques de sécurité
- Auditer et surveiller les accès

**Leçon (30 min - détaillée)**
La gestion des secrets est cruciale pour la sécurité des déploiements automatisés.

**Gestion des secrets dans GitHub Actions**
```yaml
# .github/workflows/secure-deploy.yml
name: Secure Deployment

on:
  push:
    branches: [ main ]

jobs:
  security-scan:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Run Trivy vulnerability scanner
      uses: aquasecurity/trivy-action@master
      with:
        scan-type: 'fs'
        scan-ref: '.'
        format: 'sarif'
        output: 'trivy-results.sarif'
    
    - name: Upload Trivy scan results
      uses: github/codeql-action/upload-sarif@v2
      if: always()
      with:
        sarif_file: 'trivy-results.sarif'

  deploy:
    needs: security-scan
    runs-on: ubuntu-latest
    environment: production
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v2
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: eu-west-3
    
    - name: Assume role for deployment
      uses: aws-actions/configure-aws-credentials@v2
      with:
        role-to-assume: arn:aws:iam::123456789012:role/DeploymentRole
        aws-region: eu-west-3
```

**Rotation automatique des secrets**
```bash
#!/bin/bash
# rotate-secrets.sh

echo "🔄 Rotation des secrets..."

# Générer de nouveaux secrets
NEW_DB_PASSWORD=$(openssl rand -base64 32)
NEW_SECRET_KEY=$(openssl rand -base64 32)
NEW_JWT_SECRET=$(openssl rand -base64 32)

# Mettre à jour AWS Secrets Manager
aws secretsmanager update-secret \
  --secret-id tasks-db-password \
  --secret-string "$NEW_DB_PASSWORD"

aws secretsmanager update-secret \
  --secret-id tasks-secret-key \
  --secret-string "$NEW_SECRET_KEY"

# Mettre à jour les variables d'environnement
aws lambda update-function-configuration \
  --function-name tasks-app \
  --environment "Variables={DB_PASSWORD=$NEW_DB_PASSWORD,SECRET_KEY=$NEW_SECRET_KEY,JWT_SECRET=$NEW_JWT_SECRET}"

# Redémarrer les services
aws ecs update-service --cluster tasks-cluster --service tasks-service --force-new-deployment

echo "✅ Secrets rotés avec succès"
```

**Audit et monitoring**
```yaml
# Audit des accès
- name: Audit secret access
  run: |
    # Vérifier les accès récents aux secrets
    aws secretsmanager describe-secret --secret-id tasks-db-password
    
    # Logger l'utilisation
    echo "Secret accessed by $(whoami) at $(date)" >> secret-audit.log

# Monitoring des déploiements
- name: Send deployment notification
  if: always()
  run: |
    STATUS=$([[ ${{ job.status }} == 'success' ]] && echo 'success' || echo 'failure')
    
    curl -X POST ${{ secrets.SLACK_WEBHOOK }} \
      -H 'Content-type: application/json' \
      -d "{\"text\":\"Deployment ${{ github.run_id }} $STATUS\"}"
```

**Chiffrement des secrets**
```python
# encryption.py
from cryptography.fernet import Fernet
import os

def generate_key():
    """Génère une clé de chiffrement"""
    return Fernet.generate_key()

def encrypt_secret(secret, key):
    """Chiffre un secret"""
    f = Fernet(key)
    return f.encrypt(secret.encode()).decode()

def decrypt_secret(encrypted_secret, key):
    """Déchiffre un secret"""
    f = Fernet(key)
    return f.decrypt(encrypted_secret.encode()).decode()

# Utilisation
MASTER_KEY = os.getenv('MASTER_ENCRYPTION_KEY')
encrypted_db_url = encrypt_secret("postgresql://user:pass@db:5432/tasks", MASTER_KEY)
decrypted_db_url = decrypt_secret(encrypted_db_url, MASTER_KEY)
```

**Politiques de sécurité**
```yaml
# Branch protection rules
# Settings > Branches > Branch protection rules
# - Require pull request reviews
# - Require status checks to pass
# - Require branches to be up to date
# - Include administrators

# Security scanning
- name: CodeQL Analysis
  uses: github/codeql-action/init@v2
  with:
    languages: python

- name: Perform CodeQL Analysis
  uses: github/codeql-action/analyze@v2
```

**Démonstration pratique (15 min)**
Configuration sécurisée des secrets dans un pipeline CI/CD.

**Exercices guidés (10 min)**
1. Configurer les secrets dans GitHub Actions
2. Implémenter la rotation automatique des secrets
3. Ajouter l'audit et le monitoring

**QCM d'auto-évaluation (3 min)**
1. Où stocker les secrets dans GitHub ?
2. Pourquoi faire tourner les secrets ?
3. Quelle action pour scanner la sécurité ?

**Devoir**
Mettre en place une gestion sécurisée des secrets pour l'application "Tâches" en production.

---

## Cours 21 - Monitoring et logging
**Objectifs**
- Implémenter un système de monitoring complet
- Centraliser et analyser les logs
- Configurer les alertes et notifications

**Leçon (30 min - détaillée)**
Le monitoring permet de détecter et résoudre les problèmes avant qu'ils n'impactent les utilisateurs.

**Métriques applicatives**
```python
# metrics.py
from flask import g, request
import time
import logging
from prometheus_client import Counter, Histogram, Gauge

# Métriques Prometheus
REQUEST_COUNT = Counter('http_requests_total', 'Total HTTP requests', ['method', 'endpoint', 'status'])
REQUEST_LATENCY = Histogram('http_request_duration_seconds', 'HTTP request latency', ['method', 'endpoint'])
ACTIVE_CONNECTIONS = Gauge('active_connections', 'Number of active connections')

@app.before_request
def before_request():
    g.start_time = time.time()
    ACTIVE_CONNECTIONS.inc()

@app.after_request
def after_request(response):
    if hasattr(g, 'start_time'):
        latency = time.time() - g.start_time
        REQUEST_LATENCY.labels(
            method=request.method,
            endpoint=request.endpoint
        ).observe(latency)
    
    REQUEST_COUNT.labels(
        method=request.method,
        endpoint=request.endpoint,
        status=response.status_code
    ).inc()
    
    ACTIVE_CONNECTIONS.dec()
    return response

# Métriques métier
TASKS_CREATED = Counter('tasks_created_total', 'Total tasks created')
TASK_COMPLETED = Counter('tasks_completed_total', 'Total tasks completed')

def record_task_created():
    TASKS_CREATED.inc()

def record_task_completed():
    TASK_COMPLETED.inc()
```

**Logging structuré**
```python
# logging_config.py
import logging
import json
from datetime import datetime

class StructuredFormatter(logging.Formatter):
    def format(self, record):
        log_entry = {
            'timestamp': datetime.utcnow().isoformat(),
            'level': record.levelname,
            'logger': record.name,
            'message': record.getMessage(),
            'module': record.module,
            'function': record.funcName,
            'line': record.lineno
        }
        
        # Ajouter les extra fields
        if hasattr(record, 'user_id'):
            log_entry['user_id'] = record.user_id
        if hasattr(record, 'request_id'):
            log_entry['request_id'] = record.request_id
            
        return json.dumps(log_entry)

# Configuration
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(),  # Console
        logging.FileHandler('app.log'),  # Fichier
    ]
)

# Logger pour les erreurs critiques
error_logger = logging.getLogger('error')
error_handler = logging.FileHandler('errors.log')
error_handler.setLevel(logging.ERROR)
error_logger.addHandler(error_handler)

# Utilisation
logger = logging.getLogger(__name__)

@app.route('/api/tasks', methods=['POST'])
def create_task():
    try:
        # Log avec contexte
        logger.info("Creating new task", extra={
            'user_id': get_current_user_id(),
            'request_id': request.headers.get('X-Request-ID')
        })
        
        # Création de la tâche...
        record_task_created()
        
        return jsonify({'message': 'Task created'}), 201
        
    except Exception as e:
        error_logger.error(f"Failed to create task: {e}", exc_info=True)
        return jsonify({'error': 'Internal server error'}), 500
```

**ELK Stack pour la centralisation**
```yaml
# docker-compose.monitoring.yml
version: '3.8'

services:
  elasticsearch:
    image: elasticsearch:8.7.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
    ports:
      - "9200:9200"
    volumes:
      - elasticsearch_data:/usr/share/elasticsearch/data

  logstash:
    image: logstash:8.7.0
    volumes:
      - ./logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    depends_on:
      - elasticsearch

  kibana:
    image: kibana:8.7.0
    ports:
      - "5601:5601"
    depends_on:
      - elasticsearch

volumes:
  elasticsearch_data:
```

**Configuration Logstash**
```conf
# logstash.conf
input {
  file {
    path => "/var/log/app/*.log"
    start_position => "beginning"
  }
}

filter {
  json {
    source => "message"
  }
  
  date {
    match => ["timestamp", "ISO8601"]
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "app-logs-%{+YYYY.MM.dd}"
  }
}
```

**Démonstration pratique (15 min)**
Configuration du monitoring et logging pour l'application.

**Exercices guidés (10 min)**
1. Ajouter les métriques Prometheus
2. Configurer le logging structuré
3. Mettre en place ELK Stack

**QCM d'auto-évaluation (3 min)**
1. Quelle métrique pour compter les requêtes ?
2. Pourquoi utiliser le logging structuré ?
3. Que fait Logstash ?

**Devoir**
Implémenter un système complet de monitoring et logging pour l'application "Tâches".

---

## Cours 22 - ELK Stack
**Objectifs**
- Maîtriser Elasticsearch pour l'indexation
- Configurer Logstash pour la transformation
- Utiliser Kibana pour la visualisation

**Leçon (30 min - détaillée)**
ELK Stack permet la centralisation, l'analyse et la visualisation des logs.

**Configuration Elasticsearch**
```yaml
# elasticsearch.yml
cluster.name: tasks-cluster
node.name: node-1
path.data: /usr/share/elasticsearch/data
path.logs: /usr/share/elasticsearch/logs

network.host: 0.0.0.0
http.port: 9200

discovery.type: single-node

xpack.security.enabled: false
xpack.monitoring.enabled: false
```

**Index et mappings**
```bash
# Créer un index avec mapping
curl -X PUT "localhost:9200/tasks-logs" \
  -H 'Content-Type: application/json' \
  -d '{
    "mappings": {
      "properties": {
        "timestamp": {
          "type": "date"
        },
        "level": {
          "type": "keyword"
        },
        "message": {
          "type": "text",
          "analyzer": "standard"
        },
        "user_id": {
          "type": "keyword"
        },
        "request_id": {
          "type": "keyword"
        },
        "response_time": {
          "type": "float"
        }
      }
    }
  }'
```

**Configuration Logstash avancée**
```conf
# logstash.conf
input {
  file {
    path => "/var/log/app/*.log"
    start_position => "beginning"
    sincedb_path => "/usr/share/logstash/data/sincedb"
  }
  
  # Input HTTP pour les métriques
  http {
    port => 8080
    codec => json
  }
}

filter {
  # Parser les logs JSON
  json {
    source => "message"
  }
  
  # Extraire les champs
  mutate {
    remove_field => ["@version", "host", "path"]
  }
  
  # Géolocalisation des IPs
  geoip {
    source => "client_ip"
    target => "geoip"
  }
  
  # Anonymisation des données sensibles
  mutate {
    gsub => ["user_email", "@.*", "@***"]
  }
  
  # Calcul de métriques
  if [response_time] {
    ruby {
      code => "
        response_time = event.get('response_time')
        if response_time > 5.0
          event.set('slow_request', true)
        else
          event.set('slow_request', false)
        end
      "
    }
  }
}

output {
  # Logs principaux vers Elasticsearch
  if [type] == "app_log" {
    elasticsearch {
      hosts => ["elasticsearch:9200"]
      index => "app-logs-%{+YYYY.MM.dd}"
      document_id => "%{request_id}"
    }
  }
  
  # Métriques vers Elasticsearch
  if [type] == "metric" {
    elasticsearch {
      hosts => ["elasticsearch:9200"]
      index => "app-metrics-%{+YYYY.MM.dd}"
    }
  }
  
  # Alertes lentes vers Slack
  if [slow_request] == true {
    slack {
      url => "https://hooks.slack.com/services/..."
      channel => "#alerts"
      message => "Slow request detected: %{message}"
    }
  }
}
```

**Dashboards Kibana**
```bash
# Créer un index pattern
curl -X POST "localhost:5601/api/saved_objects/index-pattern" \
  -H 'kbn-xsrf: true' \
  -H 'Content-Type: application/json' \
  -d '{
    "attributes": {
      "title": "app-logs-*",
      "timeFieldName": "timestamp"
    }
  }'

# Créer une visualisation
curl -X POST "localhost:5601/api/saved_objects/visualization" \
  -H 'kbn-xsrf: true' \
  -H 'Content-Type: application/json' \
  -d '{
    "attributes": {
      "title": "Error Rate Over Time",
      "visState": "{\"type\":\"line\",\"params\":{\"type\":\"line\"}}",
      "uiStateJSON": "{}",
      "description": "",
      "version": 1,
      "kibanaSavedObjectMeta": {
        "searchSourceJSON": "{\"index\":\"app-logs-*\",\"query\":{\"query\":\"level:ERROR\",\"language\":\"lucene\"}}"
      }
    }
  }'
```

**Alertes et monitoring**
```json
// Règle d'alerte Kibana
{
  "name": "High Error Rate",
  "alertTypeId": ".index-threshold",
  "params": {
    "index": ["app-logs-*"],
    "timeField": "timestamp",
    "aggType": "count",
    "aggField": "level",
    "groupBy": "all",
    "timeWindowSize": 5,
    "timeWindowUnit": "m",
    "thresholdComparator": ">",
    "threshold": [10]
  },
  "actions": [
    {
      "actionTypeId": ".slack",
      "params": {
        "message": "High error rate detected: {{alertValue}} errors in 5 minutes"
      }
    }
  ]
}
```

**Démonstration pratique (15 min)**
Configuration complète d'ELK Stack pour l'application.

**Exercices guidés (10 min)**
1. Configurer Elasticsearch avec mapping
2. Créer des pipelines Logstash
3. Construire des dashboards Kibana

**QCM d'auto-évaluation (3 min)**
1. Quel composant pour l'indexation ?
2. Que fait Logstash ?
3. À quoi sert Kibana ?

**Devoir**
Mettre en place ELK Stack complet pour centraliser et analyser les logs de l'application "Tâches".

---

## Cours 23 - Métriques et alertes
**Objectifs**
- Configurer Prometheus pour la collecte de métriques
- Créer des tableaux de bord Grafana
- Mettre en place des alertes automatiques

**Leçon (30 min - détaillée)**
Prometheus et Grafana forment la stack de monitoring moderne.

**Configuration Prometheus**
```yaml
# prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

rule_files:
  - "alert_rules.yml"

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          - alertmanager:9093

scrape_configs:
  - job_name: 'tasks-app'
    static_configs:
      - targets: ['app:5000']
    metrics_path: '/metrics'
    
  - job_name: 'postgres'
    static_configs:
      - targets: ['db:5432']
    scrape_interval: 30s
    
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']
```

**Métriques personnalisées**
```python
# custom_metrics.py
from prometheus_client import Counter, Histogram, Gauge, Info
import psutil
from flask import request

# Métriques métier
TASKS_ACTIVE = Gauge('tasks_active', 'Number of active tasks')
TASKS_COMPLETED = Counter('tasks_completed_total', 'Total completed tasks')
TASKS_CREATED = Counter('tasks_created_total', 'Total created tasks')

# Métriques performance
DB_CONNECTIONS = Gauge('db_connections_active', 'Active database connections')
MEMORY_USAGE = Gauge('memory_usage_bytes', 'Memory usage in bytes')
CPU_USAGE = Gauge('cpu_usage_percent', 'CPU usage percentage')

# Métriques sécurité
FAILED_LOGINS = Counter('failed_logins_total', 'Total failed login attempts')
BLOCKED_IPS = Gauge('blocked_ips', 'Number of blocked IP addresses')

def update_system_metrics():
    """Met à jour les métriques système"""
    MEMORY_USAGE.set(psutil.virtual_memory().used)
    CPU_USAGE.set(psutil.cpu_percent())

@app.route('/metrics')
def metrics():
    update_system_metrics()
    return Response(prometheus_client.generate_latest(), 
                   mimetype='text/plain; charset=utf-8')

# Middleware pour mesurer les requêtes
@app.before_request
def before_request_metrics():
    request.start_time = time.time()

@app.after_request
def after_request_metrics(response):
    if hasattr(request, 'start_time'):
        duration = time.time() - request.start_time
        REQUEST_DURATION.labels(
            method=request.method,
            endpoint=request.endpoint or 'unknown',
            status=response.status_code
        ).observe(duration)
    return response
```

**Règles d'alertes**
```yaml
# alert_rules.yml
groups:
  - name: tasks_app_alerts
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m]) > 0.05
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate detected"
          description: "Error rate is {{ $value }}% over the last 5 minutes"
          
      - alert: HighMemoryUsage
        expr: memory_usage_bytes / memory_total_bytes > 0.9
        for: 10m
        labels:
          severity: warning
        annotations:
          summary: "High memory usage"
          description: "Memory usage is above 90%"
          
      - alert: SlowResponseTime
        expr: histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 5
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "Slow response times"
          description: "95th percentile response time > 5s"
```

**Configuration Grafana**
```yaml
# provisioning/datasources/prometheus.yml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://prometheus:9090
    isDefault: true
```

**Dashboard Grafana**
```json
{
  "dashboard": {
    "title": "Tasks App Monitoring",
    "tags": ["tasks", "monitoring"],
    "timezone": "browser",
    "panels": [
      {
        "title": "HTTP Requests Rate",
        "type": "graph",
        "targets": [
          {
            "expr": "rate(http_requests_total[5m])",
            "legendFormat": "{{method}} {{endpoint}}"
          }
        ]
      },
      {
        "title": "Response Time",
        "type": "graph",
        "targets": [
          {
            "expr": "histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))",
            "legendFormat": "95th percentile"
          }
        ]
      },
      {
        "title": "Active Tasks",
        "type": "stat",
        "targets": [
          {
            "expr": "tasks_active",
            "legendFormat": "Active Tasks"
          }
        ]
      }
    ]
  }
}
```

**Alertmanager pour les notifications**
```yaml
# alertmanager.yml
global:
  smtp_smarthost: 'smtp.gmail.com:587'
  smtp_from: 'alerts@tasksapp.com'

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 1h
  receiver: 'email'
  
receivers:
  - name: 'email'
    email_configs:
      - to: 'admin@tasksapp.com'
        subject: '{{ .GroupLabels.alertname }}'
        body: '{{ .CommonAnnotations.description }}'
        
  - name: 'slack'
    slack_configs:
      - api_url: 'https://hooks.slack.com/services/.../.../...'
        channel: '#alerts'
        title: '{{ .GroupLabels.alertname }}'
        text: '{{ .CommonAnnotations.description }}'
```

**Démonstration pratique (15 min)**
Configuration de Prometheus et Grafana pour l'application.

**Exercices guidés (10 min)**
1. Configurer Prometheus pour scraper les métriques
2. Créer des règles d'alertes
3. Construire un dashboard Grafana

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour les métriques Flask ?
2. Que mesure histogram_quantile ?
3. À quoi sert Alertmanager ?

**Devoir**
Mettre en place un système complet de métriques et alertes avec Prometheus et Grafana.

---

## Cours 24 - Haute disponibilité
**Objectifs**
- Implémenter la redondance et la tolérance aux pannes
- Configurer le load balancing
- Mettre en place la réplication de base de données

**Leçon (30 min - détaillée)**
La haute disponibilité garantit que l'application reste accessible même en cas de panne.

**Architecture haute disponibilité**
```
Internet
    ↓
Load Balancer (HAProxy/Nginx)
    ↓
┌─────────────┬─────────────┐
│   App 1     │   App 2     │
│ (Container) │ (Container) │
└─────────────┴─────────────┘
         ↓
┌───────────────────────────┐
│   Database Cluster        │
│ (Primary + Replicas)      │
└───────────────────────────┘
```

**Load balancing avec Nginx**
```nginx
# nginx.conf
upstream tasks_app {
    server app1:5000;
    server app2:5000;
    server app3:5000;
}

server {
    listen 80;
    server_name tasks.example.com;
    
    location / {
        proxy_pass http://tasks_app;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_For;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # Health checks
        health_check;
    }
    
    # Static files
    location /static/ {
        alias /var/www/static/;
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

**Health checks avancés**
```python
# health.py
from flask import Blueprint, jsonify
import psutil
import requests

health_bp = Blueprint('health', __name__)

@health_bp.route('/health')
def health_check():
    """Health check complet"""
    checks = {
        'status': 'healthy',
        'checks': {}
    }
    
    # Vérification de la base de données
    try:
        # Test de connexion DB
        db.session.execute(text('SELECT 1'))
        checks['checks']['database'] = 'healthy'
    except Exception as e:
        checks['checks']['database'] = f'unhealthy: {str(e)}'
        checks['status'] = 'unhealthy'
    
    # Vérification des services externes
    try:
        response = requests.get('https://api.github.com', timeout=5)
        checks['checks']['external_api'] = 'healthy' if response.status_code == 200 else 'unhealthy'
    except:
        checks['checks']['external_api'] = 'unhealthy'
    
    # Métriques système
    memory_percent = psutil.virtual_memory().percent
    checks['checks']['memory'] = 'healthy' if memory_percent < 90 else f'warning: {memory_percent}%'
    
    cpu_percent = psutil.cpu_percent()
    checks['checks']['cpu'] = 'healthy' if cpu_percent < 80 else f'warning: {cpu_percent}%'
    
    # Vérification des dépendances
    checks['checks']['dependencies'] = check_dependencies()
    
    status_code = 200 if checks['status'] == 'healthy' else 503
    return jsonify(checks), status_code

def check_dependencies():
    """Vérifie les dépendances critiques"""
    dependencies = []
    
    # Vérifier Redis si utilisé
    try:
        redis.ping()
        dependencies.append({'redis': 'healthy'})
    except:
        dependencies.append({'redis': 'unhealthy'})
    
    return dependencies
```

**Réplication PostgreSQL**
```yaml
# docker-compose.ha.yml
version: '3.8'

services:
  pg-primary:
    image: postgres:15
    environment:
      POSTGRES_DB: tasks
      POSTGRES_USER: repl
      POSTGRES_PASSWORD: repl_password
    volumes:
      - ./pg-primary.conf:/etc/postgresql/postgresql.conf
      - pg_primary_data:/var/lib/postgresql/data
    command: postgres -c config_file=/etc/postgresql/postgresql.conf

  pg-replica1:
    image: postgres:15
    environment:
      POSTGRES_DB: tasks
      POSTGRES_USER: repl
      POSTGRES_PASSWORD: repl_password
    volumes:
      - ./pg-replica.conf:/etc/postgresql/postgresql.conf
      - pg_replica1_data:/var/lib/postgresql/data
    command: postgres -c config_file=/etc/postgresql/postgresql.conf
    depends_on:
      - pg-primary

  pg-replica2:
    image: postgres:15
    environment:
      POSTGRES_DB: tasks
      POSTGRES_USER: repl
      POSTGRES_PASSWORD: repl_password
    volumes:
      - ./pg-replica.conf:/etc/postgresql/postgresql.conf
      - pg_replica2_data:/var/lib/postgresql/data
    command: postgres -c config_file=/etc/postgresql/postgresql.conf
    depends_on:
      - pg-primary
```

**Configuration de réplication**
```conf
# pg-primary.conf
wal_level = replica
max_wal_senders = 3
wal_keep_size = 64

# pg-replica.conf
primary_conninfo = 'host=pg-primary port=5432 user=repl password=repl_password'
hot_standby = on
```

**Auto-scaling avec Docker Swarm**
```bash
# Créer un swarm
docker swarm init

# Déployer le stack
docker stack deploy -c docker-compose.yml tasks

# Auto-scaling basé sur la CPU
docker service update --replicas 5 tasks_app

# Auto-scaling avec metrics
docker service update \
  --replicas-max-per-node 3 \
  --replicas 2 \
  tasks_app
```

**Démonstration pratique (15 min)**
Configuration d'une architecture haute disponibilité.

**Exercices guidés (10 min)**
1. Configurer un load balancer
2. Mettre en place des health checks
3. Configurer la réplication de base de données

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour le load balancing ?
2. Pourquoi la réplication de DB ?
3. Comment vérifier la santé des services ?

**Devoir**
Implémenter une architecture haute disponibilité complète pour l'application "Tâches".

---

## Cours 25 - Scaling automatique
**Objectifs**
- Configurer l'auto-scaling basé sur les métriques
- Optimiser les performances sous charge
- Gérer les coûts du scaling

**Leçon (30 min - détaillée)**
L'auto-scaling ajuste automatiquement les ressources selon la demande.

**Auto-scaling AWS**
```bash
# Créer un launch template
aws ec2 create-launch-template \
  --launch-template-name tasks-lt \
  --launch-template-data '{
    "ImageId": "ami-12345678",
    "InstanceType": "t3.medium",
    "KeyName": "my-key",
    "SecurityGroupIds": ["sg-12345678"]
  }'

# Créer un auto scaling group
aws autoscaling create-auto-scaling-group \
  --auto-scaling-group-name tasks-asg \
  --launch-template "LaunchTemplateName=tasks-lt,Version=1" \
  --min-size 2 \
  --max-size 10 \
  --desired-capacity 3 \
  --availability-zones "eu-west-3a,eu-west-3b,eu-west-3c" \
  --target-group-arns "arn:aws:elasticloadbalancing:eu-west-3:123456789012:targetgroup/tasks-tg/1234567890123456"

# Politiques de scaling
aws autoscaling put-scaling-policy \
  --auto-scaling-group-name tasks-asg \
  --policy-name cpu-scale-out \
  --scaling-adjustment 2 \
  --adjustment-type ChangeInCapacity \
  --cooldown 300

# Alarmes CloudWatch
aws cloudwatch put-metric-alarm \
  --alarm-name high-cpu \
  --alarm-description "Scale out when CPU > 70%" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 70 \
  --comparison-operator GreaterThanThreshold \
  --dimensions "Name=AutoScalingGroupName,Value=tasks-asg" \
  --evaluation-periods 2 \
  --alarm-actions "arn:aws:autoscaling:eu-west-3:123456789012:scalingPolicy:12345678:scalingPolicyName/cpu-scale-out"
```

**Scaling Kubernetes**
```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tasks-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: tasks
  template:
    metadata:
      labels:
        app: tasks
    spec:
      containers:
      - name: tasks
        image: tasks-app:latest
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        ports:
        - containerPort: 5000

---
# hpa.yaml (Horizontal Pod Autoscaler)
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: tasks-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: tasks-app
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

**Scaling Azure**
```bash
# Profil de scaling
az monitor autoscale create \
  --resource /subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/tasks-rg/providers/Microsoft.ContainerInstance/containerGroups/tasks-cg \
  --name tasks-autoscale \
  --min-count 2 \
  --max-count 10 \
  --count 3

# Règles de scaling
az monitor autoscale rule create \
  --resource /subscriptions/.../autoscaleSettings/tasks-autoscale \
  --condition "Percentage CPU > 70 avg 10m" \
  --scale out 2 \
  --cooldown 5

az monitor autoscale rule create \
  --resource /subscriptions/.../autoscaleSettings/tasks-autoscale \
  --condition "Percentage CPU < 30 avg 10m" \
  --scale in 1 \
  --cooldown 5
```

**Optimisation des coûts**
```python
# scaling_optimizer.py
import boto3
from datetime import datetime, timedelta

def optimize_scaling():
    """Optimise le scaling basé sur les patterns d'usage"""
    cloudwatch = boto3.client('cloudwatch')
    autoscaling = boto3.client('autoscaling')
    
    # Analyser l'usage passé
    end_time = datetime.utcnow()
    start_time = end_time - timedelta(days=7)
    
    response = cloudwatch.get_metric_statistics(
        Namespace='AWS/EC2',
        MetricName='CPUUtilization',
        Dimensions=[
            {
                'Name': 'AutoScalingGroupName',
                'Value': 'tasks-asg'
            }
        ],
        StartTime=start_time,
        EndTime=end_time,
        Period=3600,
        Statistics=['Average', 'Maximum']
    )
    
    # Calculer les métriques
    avg_cpu = sum(point['Average'] for point in response['Datapoints']) / len(response['Datapoints'])
    max_cpu = max(point['Maximum'] for point in response['Datapoints'])
    
    # Ajuster les seuils de scaling
    if avg_cpu < 30:
        # Réduire la capacité minimale
        autoscaling.update_auto_scaling_group(
            AutoScalingGroupName='tasks-asg',
            MinSize=1
        )
    elif avg_cpu > 70:
        # Augmenter la capacité minimale
        autoscaling.update_auto_scaling_group(
            AutoScalingGroupName='tasks-asg',
            MinSize=3
        )
```

**Scaling prédictif**
```python
# predictive_scaling.py
from sklearn.linear_model import LinearRegression
import pandas as pd
from datetime import datetime, timedelta

def predict_scaling_needs():
    """Prédit les besoins de scaling basé sur l'historique"""
    
    # Récupérer les données historiques
    historical_data = get_cpu_metrics_last_month()
    
    # Features: heure, jour de la semaine, etc.
    df = pd.DataFrame(historical_data)
    df['hour'] = pd.to_datetime(df['timestamp']).dt.hour
    df['day_of_week'] = pd.to_datetime(df['timestamp']).dt.dayofweek
    
    # Entraîner le modèle
    X = df[['hour', 'day_of_week']]
    y = df['cpu_utilization']
    
    model = LinearRegression()
    model.fit(X, y)
    
    # Prédire pour les prochaines heures
    future_hours = pd.date_range(datetime.now(), periods=24, freq='H')
    future_features = pd.DataFrame({
        'hour': future_hours.hour,
        'day_of_week': future_hours.dayofweek
    })
    
    predictions = model.predict(future_features)
    
    # Ajuster le scaling préventif
    max_predicted = max(predictions)
    if max_predicted > 80:
        scale_up_preemptively()
    elif max_predicted < 20:
        scale_down_to_save_costs()
```

**Démonstration pratique (15 min)**
Configuration de l'auto-scaling pour l'application.

**Exercices guidés (10 min)**
1. Configurer l'auto-scaling AWS
2. Créer des politiques de scaling
3. Optimiser les coûts de scaling

**QCM d'auto-évaluation (3 min)**
1. Quelle métrique pour le scaling CPU ?
2. Pourquoi le cooldown dans le scaling ?
3. Quelle différence entre scaling horizontal et vertical ?

**Devoir**
Mettre en place l'auto-scaling intelligent pour l'application "Tâches" en production.

---

## Cours 26 - Backup et récupération
**Objectifs**
- Implémenter des stratégies de sauvegarde robustes
- Automatiser les backups
- Tester les procédures de récupération

**Leçon (30 min - détaillée)**
Les backups garantissent la continuité d'activité en cas de sinistre.

**Stratégies de backup**
```bash
#!/bin/bash
# backup.sh

BACKUP_DIR="/backups"
DATE=$(date +%Y%m%d_%H%M%S)
RETENTION_DAYS=30

# Backup de la base de données
echo "📦 Backup base de données..."
docker exec tasks-db pg_dump -U admin tasks > $BACKUP_DIR/db_$DATE.sql

# Compresser le backup
gzip $BACKUP_DIR/db_$DATE.sql

# Backup des fichiers uploadés
echo "📁 Backup fichiers..."
tar -czf $BACKUP_DIR/uploads_$DATE.tar.gz /app/uploads/

# Backup de la configuration
echo "⚙️  Backup configuration..."
tar -czf $BACKUP_DIR/config_$DATE.tar.gz /app/config/

# Nettoyer les anciens backups
echo "🧹 Nettoyage..."
find $BACKUP_DIR -name "*.gz" -mtime +$RETENTION_DAYS -delete

# Vérifier l'intégrité
echo "✅ Vérification..."
if [ -f "$BACKUP_DIR/db_$DATE.sql.gz" ]; then
    echo "Backup DB réussi"
else
    echo "❌ Échec backup DB"
    exit 1
fi

echo "✅ Backup complet terminé"
```

**Backup PostgreSQL avancé**
```bash
# Backup logique avec pg_dump
pg_dump -h localhost -U admin -d tasks \
  --format=custom \
  --compress=9 \
  --verbose \
  --file=/backups/tasks_backup.dump

# Backup physique (plus rapide pour gros volumes)
pg_basebackup -h localhost -U repl -D /backups/base_backup -Ft -z

# Backup continu avec WAL
# Configuration postgresql.conf
wal_level = replica
archive_mode = on
archive_command = 'cp %p /backups/wal/%f'

# Point-in-time recovery
# Créer un backup de base
pg_basebackup -h localhost -U repl -D /backups/pitr_base -Ft -z

# Restaurer à un point spécifique
# recovery.conf
restore_command = 'cp /backups/wal/%f %p'
recovery_target_time = '2024-01-15 14:30:00'
```

**Backup cloud**
```bash
# Upload vers S3
aws s3 cp /backups/db_$DATE.sql.gz s3://tasks-backups/database/
aws s3 cp /backups/uploads_$DATE.tar.gz s3://tasks-backups/uploads/

# Lifecycle policy pour S3
aws s3api put-bucket-lifecycle-configuration \
  --bucket tasks-backups \
  --lifecycle-configuration '{
    "Rules": [
      {
        "ID": "Delete old backups",
        "Status": "Enabled",
        "Prefix": "",
        "Transitions": [
          {
            "Days": 30,
            "StorageClass": "STANDARD_IA"
          },
          {
            "Days": 90,
            "StorageClass": "GLACIER"
          }
        ],
        "Expiration": {
          "Days": 365
        }
      }
    ]
  }'
```

**Récupération automatique**
```bash
#!/bin/bash
# restore.sh

BACKUP_DATE=$1
BACKUP_TYPE=${2:-full}  # full, db, files

if [ -z "$BACKUP_DATE" ]; then
    echo "❌ Date de backup requise"
    echo "Usage: $0 YYYYMMDD_HHMMSS [full|db|files]"
    exit 1
fi

echo "🔄 Restauration backup $BACKUP_DATE..."

# Arrêter les services
docker-compose down

if [ "$BACKUP_TYPE" = "full" ] || [ "$BACKUP_TYPE" = "db" ]; then
    echo "🗄️  Restauration base de données..."
    
    # Créer une nouvelle base vide
    docker-compose up -d db
    sleep 10
    
    # Restaurer le dump
    gunzip -c /backups/db_$BACKUP_DATE.sql.gz | docker exec -i tasks-db psql -U admin -d tasks
fi

if [ "$BACKUP_TYPE" = "full" ] || [ "$BACKUP_TYPE" = "files" ]; then
    echo "📁 Restauration fichiers..."
    tar -xzf /backups/uploads_$BACKUP_DATE.tar.gz -C /
fi

# Redémarrer les services
docker-compose up -d

# Vérifier la restauration
echo "✅ Vérification..."
curl -f http://localhost:5000/health || echo "❌ Service non disponible"

echo "✅ Restauration terminée"
```

**Tests de récupération**
```python
# disaster_recovery_test.py
import subprocess
import time
import requests

def test_disaster_recovery():
    """Test complet de récupération après sinistre"""
    
    print("🧪 Test de récupération après sinistre")
    
    # 1. Créer des données de test
    print("📝 Création de données de test...")
    # Insérer des données de test
    
    # 2. Simuler une panne
    print("💥 Simulation de panne...")
    subprocess.run(["docker-compose", "down"], check=True)
    
    # Supprimer les volumes pour simuler une perte
    subprocess.run(["docker", "volume", "rm", "tasks_postgres_data"], check=True)
    
    # 3. Restaurer depuis le backup
    print("🔄 Restauration...")
    result = subprocess.run(["./restore.sh", "latest"], capture_output=True, text=True)
    
    if result.returncode != 0:
        print(f"❌ Échec restauration: {result.stderr}")
        return False
    
    # 4. Vérifier la récupération
    print("✅ Vérification...")
    max_attempts = 30
    for attempt in range(max_attempts):
        try:
            response = requests.get("http://localhost:5000/health", timeout=5)
            if response.status_code == 200:
                print(f"✅ Service restauré après {attempt + 1} tentatives")
                return True
        except:
            pass
        
        time.sleep(10)
    
    print("❌ Échec de récupération")
    return False

if __name__ == "__main__":
    success = test_disaster_recovery()
    exit(0 if success else 1)
```

**Plan de continuité**
```yaml
# disaster_recovery_plan.yml
version: '1.0'
last_updated: '2024-01-15'

objectives:
  - RTO (Recovery Time Objective): 4 hours
  - RPO (Recovery Point Objective): 1 hour

backup_strategy:
  database:
    frequency: hourly
    retention: 30 days
    location: S3 + local
  files:
    frequency: daily
    retention: 90 days
    location: S3
  configuration:
    frequency: on_change
    retention: unlimited
    location: Git + S3

recovery_procedures:
  - Stop all services
  - Restore database from latest backup
  - Restore files from backup
  - Update configuration
  - Start services
  - Verify functionality

testing_schedule:
  - Full DR test: quarterly
  - Backup restoration test: monthly
  - Failover test: weekly
```

**Démonstration pratique (15 min)**
Configuration des backups et test de récupération.

**Exercices guidés (10 min)**
1. Créer un script de backup automatisé
2. Configurer les backups cloud
3. Tester une procédure de récupération

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre RTO et RPO ?
2. Pourquoi compresser les backups ?
3. Quelle fréquence pour les tests de DR ?

**Devoir**
Implémenter une stratégie complète de backup et récupération pour l'application "Tâches".

---

## Cours 27 - Sécurité en production
**Objectifs**
- Appliquer le hardening système
- Configurer la conformité et les audits
- Mettre en place la surveillance de sécurité

**Leçon (30 min - détaillée)**
La sécurité en production nécessite une approche multi-couches.

**Hardening du système**
```bash
#!/bin/bash
# harden.sh

echo "🔒 Hardening du système..."

# Désactiver les services inutiles
systemctl disable avahi-daemon
systemctl disable cups

# Configurer SSH
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl reload sshd

# Configurer le firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 80
ufw allow 443
ufw --force enable

# Installer fail2ban
apt-get install -y fail2ban
systemctl enable fail2ban

# Configurer fail2ban pour SSH
cat > /etc/fail2ban/jail.local << EOF
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
EOF

systemctl restart fail2ban

# Mises à jour automatiques de sécurité
apt-get install -y unattended-upgrades
dpkg-reconfigure --priority=low unattended-upgrades

echo "✅ Hardening terminé"
```

**Sécurité des conteneurs**
```dockerfile
# Dockerfile sécurisé
FROM python:3.11-slim

# Créer un utilisateur non-root
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Installer uniquement les dépendances nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Ne pas exécuter en root
USER appuser

# Ne pas exposer de secrets
# ENV SECRET_KEY=... # JAMAIS en dur !

# Utiliser des volumes pour les logs
VOLUME ["/app/logs"]

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD python -c "import requests; requests.get('http://localhost:5000/health')"

CMD ["python", "app.py"]
```

**Configuration SSL/TLS**
```nginx
# nginx.conf avec SSL
server {
    listen 443 ssl http2;
    server_name tasks.example.com;
    
    # Certificats SSL
    ssl_certificate /etc/ssl/certs/tasks.crt;
    ssl_certificate_key /etc/ssl/private/tasks.key;
    
    # Configuration SSL sécurisée
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA256;
    ssl_prefer_server_ciphers off;
    
    # HSTS
    add_header Strict-Transport-Security "max-age=63072000" always;
    
    # Redirection HTTP vers HTTPS
    location / {
        proxy_pass http://tasks_app;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_For;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# Redirection HTTP
server {
    listen 80;
    server_name tasks.example.com;
    return 301 https://$server_name$request_uri;
}
```

**Gestion des secrets**
```python
# secrets_manager.py
import boto3
from azure.keyvault.secrets import SecretClient
from google.cloud import secretmanager

class SecretsManager:
    def __init__(self, provider='aws'):
        self.provider = provider
        if provider == 'aws':
            self.client = boto3.client('secretsmanager')
        elif provider == 'azure':
            # Configuration Azure Key Vault
            pass
        elif provider == 'gcp':
            self.client = secretmanager.SecretManagerServiceClient()
    
    def get_secret(self, secret_name):
        """Récupère un secret de manière sécurisée"""
        if self.provider == 'aws':
            response = self.client.get_secret_value(SecretId=secret_name)
            return response['SecretString']
        # Implémentations pour autres providers...
    
    def rotate_secret(self, secret_name, new_value):
        """Fait tourner un secret"""
        if self.provider == 'aws':
            self.client.update_secret(
                SecretId=secret_name,
                SecretString=new_value
            )

# Utilisation
secrets = SecretsManager('aws')
db_password = secrets.get_secret('prod-db-password')
```

**Audit et conformité**
```python
# audit.py
import logging
import hashlib
from datetime import datetime

class SecurityAuditor:
    def __init__(self):
        self.audit_log = logging.getLogger('security_audit')
        
    def log_security_event(self, event_type, user, action, resource, ip=None):
        """Log un événement de sécurité"""
        event = {
            'timestamp': datetime.utcnow().isoformat(),
            'event_type': event_type,
            'user': user,
            'action': action,
            'resource': resource,
            'ip': ip,
            'user_agent': request.headers.get('User-Agent') if 'request' in globals() else None
        }
        
        # Hash sensible pour l'anonymisation
        if event['user']:
            event['user_hash'] = hashlib.sha256(event['user'].encode()).hexdigest()
            event['user'] = None  # Ne pas stocker en clair
        
        self.audit_log.info(f"SECURITY_EVENT: {event}")
    
    def check_compliance(self):
        """Vérifie la conformité"""
        issues = []
        
        # Vérifier les permissions des fichiers
        import os
        config_files = ['config.py', 'settings.py', '.env']
        for file in config_files:
            if os.path.exists(file):
                perms = oct(os.stat(file).st_mode)[-3:]
                if perms != '600':
                    issues.append(f"Permissions incorrectes pour {file}: {perms}")
        
        # Vérifier les secrets
        with open('app.py', 'r') as f:
            content = f.read()
            if 'password' in content.lower() and 'secrets' not in content:
                issues.append("Potentiel mot de passe en dur détecté")
        
        return issues

# Middleware d'audit
@app.before_request
def audit_request():
    if request.endpoint and 'api' in request.endpoint:
        auditor.log_security_event(
            'API_ACCESS',
            user=get_current_user(),
            action=request.method,
            resource=request.path,
            ip=request.remote_addr
        )
```

**Surveillance des menaces**
```python
# threat_detection.py
import re
from collections import defaultdict
import time

class ThreatDetector:
    def __init__(self):
        self.suspicious_patterns = [
            r'<script',  # XSS attempts
            r'union.*select',  # SQL injection
            r'\.\./',  # Path traversal
            r'eval\(',  # Code injection
        ]
        
        self.ip_attempts = defaultdict(list)
        self.blocked_ips = set()
    
    def analyze_request(self, request):
        """Analyse une requête pour détecter les menaces"""
        threats = []
        
        # Analyse du contenu
        content = f"{request.url} {request.data}"
        for pattern in self.suspicious_patterns:
            if re.search(pattern, content, re.IGNORECASE):
                threats.append(f"Pattern detected: {pattern}")
        
        # Rate limiting par IP
        ip = request.remote_addr
        now = time.time()
        
        # Nettoyer les anciennes tentatives
        self.ip_attempts[ip] = [t for t in self.ip_attempts[ip] if now - t < 3600]
        
        # Ajouter la tentative actuelle
        self.ip_attempts[ip].append(now)
        
        # Bloquer si trop de tentatives
        if len(self.ip_attempts[ip]) > 100:  # 100 requêtes/heure
            self.blocked_ips.add(ip)
            threats.append("Rate limit exceeded")
        
        return threats
    
    def is_blocked(self, ip):
        """Vérifie si une IP est bloquée"""
        return ip in self.blocked_ips

# Intégration dans Flask
threat_detector = ThreatDetector()

@app.before_request
def security_check():
    threats = threat_detector.analyze_request(request)
    
    if threats:
        # Log les menaces
        for threat in threats:
            logging.warning(f"Threat detected: {threat} from {request.remote_addr}")
        
        # Bloquer si nécessaire
        if threat_detector.is_blocked(request.remote_addr):
            abort(429)  # Too Many Requests
    
    # Continuer le traitement normal
```

**Démonstration pratique (15 min)**
Configuration de la sécurité en production.

**Exercices guidés (10 min)**
1. Configurer le hardening système
2. Mettre en place SSL/TLS
3. Implémenter l'audit de sécurité

**QCM d'auto-évaluation (3 min)**
1. Pourquoi désactiver root login ?
2. Quelle directive pour HSTS ?
3. Pourquoi auditer les accès ?

**Devoir**
Sécuriser complètement l'infrastructure de production de l'application "Tâches".

---

## Cours 28 - Performance et optimisation
**Objectifs**
- Optimiser les performances applicatives
- Configurer la mise en cache
- Implémenter un CDN

**Leçon (30 min - détaillée)**
L'optimisation des performances est cruciale pour l'expérience utilisateur.

**Cache applicatif**
```python
# caching.py
from flask_caching import Cache
from functools import wraps
import time

cache = Cache(config={'CACHE_TYPE': 'RedisCache', 'CACHE_REDIS_URL': 'redis://localhost:6379'})

def cached(timeout=300):
    """Décorateur de cache personnalisé"""
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            # Créer une clé de cache unique
            key = f"{func.__name__}:{hash(str(args) + str(kwargs))}"
            
            # Vérifier le cache
            result = cache.get(key)
            if result is not None:
                return result
            
            # Exécuter la fonction
            start_time = time.time()
            result = func(*args, **kwargs)
            execution_time = time.time() - start_time
            
            # Cacher le résultat (avec TTL basé sur le temps d'exécution)
            cache_timeout = min(timeout, max(60, int(execution_time * 10)))
            cache.set(key, result, timeout=cache_timeout)
            
            return result
        return wrapper
    return decorator

# Cache des tâches fréquemment accédées
@cached(timeout=600)  # 10 minutes
def get_user_tasks(user_id, status=None):
    """Récupère les tâches d'un utilisateur avec cache"""
    query = Task.query.filter_by(user_id=user_id)
    if status:
        query = query.filter_by(status=status)
    return query.all()

# Cache des statistiques
@cached(timeout=300)  # 5 minutes
def get_dashboard_stats():
    """Statistiques du dashboard mises en cache"""
    return {
        'total_tasks': Task.query.count(),
        'completed_tasks': Task.query.filter_by(status='completed').count(),
        'active_users': User.query.filter_by(active=True).count()
    }

# Invalidation intelligente du cache
def invalidate_user_cache(user_id):
    """Invalide le cache d'un utilisateur"""
    # Invalider toutes les clés liées à l'utilisateur
    cache.delete_memoized(get_user_tasks, user_id)
    cache.delete_memoized(get_dashboard_stats)
```

**Optimisation base de données**
```python
# db_optimization.py
from sqlalchemy import text, Index
from flask_sqlalchemy import SQLAlchemy

def optimize_database():
    """Optimisations de base de données"""
    
    # Créer des index
    Index('idx_task_user_status', Task.user_id, Task.status)
    Index('idx_task_created', Task.created_at)
    
    # Requêtes optimisées
    @app.route('/api/tasks/summary')
    def get_tasks_summary():
        # Utiliser des vues matérialisées pour les requêtes complexes
        result = db.session.execute(text("""
            SELECT 
                status,
                COUNT(*) as count,
                AVG(EXTRACT(EPOCH FROM (updated_at - created_at))) as avg_duration
            FROM tasks 
            WHERE created_at >= CURRENT_DATE - INTERVAL '30 days'
            GROUP BY status
        """))
        
        return jsonify([dict(row) for row in result])

# Connection pooling
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {
    'pool_size': 10,
    'pool_recycle': 3600,
    'pool_pre_ping': True
}

# Read replicas pour les lectures
class DatabaseRouter:
    def get_bind(self, mapper, instance=None, clause=None, **kwargs):
        """Route les requêtes vers la bonne base"""
        if instance and hasattr(instance, 'read_only'):
            return db.get_engine(app, bind='read_replica')
        return db.get_engine(app, bind='default')

# Configuration des binds
app.config['SQLALCHEMY_BINDS'] = {
    'read_replica': 'postgresql://user:pass@replica:5432/tasks'
}
```

**CDN et optimisation frontend**
```python
# cdn.py
import boto3
from flask import url_for

class CDNManager:
    def __init__(self, cloudfront_distribution_id=None, s3_bucket=None):
        self.cloudfront = boto3.client('cloudfront') if cloudfront_distribution_id else None
        self.distribution_id = cloudfront_distribution_id
        self.s3_bucket = s3_bucket
    
    def upload_to_cdn(self, file_path, key):
        """Upload un fichier vers le CDN"""
        s3 = boto3.client('s3')
        
        # Upload vers S3
        s3.upload_file(file_path, self.s3_bucket, key, 
                     ExtraArgs={'ACL': 'public-read', 'ContentType': 'image/jpeg'})
        
        # Invalider le cache CloudFront
        if self.cloudfront:
            self.cloudfront.create_invalidation(
                DistributionId=self.distribution_id,
                InvalidationBatch={
                    'Paths': {
                        'Quantity': 1,
                        'Items': [f'/{key}']
                    },
                    'CallerReference': str(time.time())
                }
            )
        
        return f"https://cdn.example.com/{key}"
    
    def get_optimized_url(self, original_url, width=None, height=None):
        """Génère une URL optimisée"""
        if width and height:
            return f"{original_url}?w={width}&h={height}&fit=crop"
        return original_url

# Configuration des assets statiques
cdn = CDNManager(
    cloudfront_distribution_id='E1234567890123',
    s3_bucket='tasks-static-assets'
)

@app.context_processor
def inject_cdn_url():
    """Injecte l'URL CDN dans les templates"""
    return dict(cdn_url="https://cdn.example.com")

# Template Jinja2
# <img src="{{ cdn_url }}/images/logo.jpg" alt="Logo">
```

**Optimisation des images**
```python
# image_optimization.py
from PIL import Image
import io
from flask import send_file

@app.route('/optimized-image/<path:image_path>')
def get_optimized_image(image_path):
    """Sert une image optimisée"""
    # Paramètres de requête
    width = int(request.args.get('w', 800))
    height = int(request.args.get('h', 600))
    quality = int(request.args.get('q', 85))
    
    # Charger l'image
    image = Image.open(f'/app/static/images/{image_path}')
    
    # Redimensionner
    image.thumbnail((width, height), Image.Resampling.LANCZOS)
    
    # Optimiser
    output = io.BytesIO()
    if image_path.lower().endswith('.jpg') or image_path.lower().endswith('.jpeg'):
        image.save(output, format='JPEG', quality=quality, optimize=True)
        mimetype = 'image/jpeg'
    else:
        image.save(output, format='PNG', optimize=True)
        mimetype = 'image/png'
    
    output.seek(0)
    return send_file(output, mimetype=mimetype)

# Lazy loading dans les templates
"""
<img src="/placeholder.jpg" 
     data-src="/optimized-image/logo.jpg?w=400&h=300&q=80" 
     loading="lazy" 
     alt="Logo">
"""
```

**Compression et minification**
```python
# compression.py
from flask_compress import Compress
from flask_minify import Minify

# Compression Gzip
compress = Compress()
compress.init_app(app)

# Minification HTML/CSS/JS
minify = Minify()
minify.init_app(app)

# Cache headers optimisés
@app.after_request
def add_cache_headers(response):
    if request.endpoint in ['static', 'get_optimized_image']:
        # Cache statique agressif
        response.headers['Cache-Control'] = 'public, max-age=31536000, immutable'
    elif 'api' in request.endpoint:
        # Cache API modéré
        response.headers['Cache-Control'] = 'public, max-age=300'
    else:
        # Pas de cache pour les pages dynamiques
        response.headers['Cache-Control'] = 'no-cache'
    
    return response
```

**Monitoring des performances**
```python
# performance_monitor.py
import time
from flask import g, request

@app.before_request
def start_timer():
    g.start = time.time()

@app.after_request
def log_performance(response):
    if hasattr(g, 'start'):
        duration = time.time() - g.start
        
        # Log les requêtes lentes
        if duration > 1.0:  # Plus d'1 seconde
            app.logger.warning(f"Slow request: {request.method} {request.path} took {duration:.2f}s")
        
        # Métriques
        REQUEST_LATENCY.observe(duration)
        
        # Headers de performance
        response.headers['X-Response-Time'] = f"{duration:.3f}s"
    
    return response

# Profiling automatique
from werkzeug.middleware.profiler import ProfilerMiddleware

if app.config['DEBUG']:
    app.wsgi_app = ProfilerMiddleware(app.wsgi_app, profile_dir='./profiles')
```

**Démonstration pratique (15 min)**
Optimisation des performances de l'application.

**Exercices guidés (10 min)**
1. Implémenter le cache applicatif
2. Optimiser les requêtes base de données
3. Configurer un CDN

**QCM d'auto-évaluation (3 min)**
1. Quel décorateur pour le cache ?
2. Pourquoi un CDN ?
3. Quelle métrique pour les requêtes lentes ?

**Devoir**
Optimiser complètement les performances de l'application "Tâches" en production.

---

## Cours 29 - Revue et optimisation finale
**Objectifs**
- Effectuer une revue complète de l'infrastructure
- Identifier et corriger les problèmes restants
- Préparer la mise en production finale

**Leçon (30 min - détaillée)**
Une revue finale garantit que tout est prêt pour la production.

**Checklist de production**
```python
# production_checklist.py
import subprocess
import requests
import os
from datetime import datetime

class ProductionChecklist:
    def __init__(self):
        self.checks = {
            'infrastructure': {},
            'security': {},
            'performance': {},
            'monitoring': {},
            'backup': {},
            'documentation': {}
        }
    
    def run_all_checks(self):
        """Exécute toutes les vérifications"""
        print("🔍 Revue de production -", datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        print("=" * 60)
        
        self.check_infrastructure()
        self.check_security()
        self.check_performance()
        self.check_monitoring()
        self.check_backup()
        self.check_documentation()
        
        self.print_summary()
    
    def check_infrastructure(self):
        """Vérifications infrastructure"""
        print("\n🏗️  Infrastructure:")
        
        # Docker
        try:
            result = subprocess.run(['docker', 'ps'], capture_output=True, text=True)
            self.checks['infrastructure']['docker_running'] = result.returncode == 0
            print(f"  ✅ Docker: {'OK' if result.returncode == 0 else 'FAIL'}")
        except:
            self.checks['infrastructure']['docker_running'] = False
            print("  ❌ Docker: FAIL")
        
        # Services
        services = ['web', 'db', 'redis']
        for service in services:
            try:
                result = subprocess.run(['docker-compose', 'ps', service], capture_output=True, text=True)
                running = service in result.stdout and 'Up' in result.stdout
                self.checks['infrastructure'][f'{service}_running'] = running
                print(f"  {'✅' if running else '❌'} {service}: {'OK' if running else 'FAIL'}")
            except:
                self.checks['infrastructure'][f'{service}_running'] = False
                print(f"  ❌ {service}: FAIL")
    
    def check_security(self):
        """Vérifications sécurité"""
        print("\n🔒 Sécurité:")
        
        # Permissions fichiers
        critical_files = ['.env', 'config.py', 'secrets.json']
        for file in critical_files:
            if os.path.exists(file):
                perms = oct(os.stat(file).st_mode)[-3:]
                secure = perms == '600'
                self.checks['security'][f'{file}_perms'] = secure
                print(f"  {'✅' if secure else '❌'} {file} permissions: {perms} {'OK' if secure else 'FAIL'}")
        
        # Secrets
        env_vars = ['SECRET_KEY', 'DATABASE_URL', 'JWT_SECRET']
        for var in env_vars:
            exists = os.getenv(var) is not None
            self.checks['security'][f'{var}_exists'] = exists
            print(f"  {'✅' if exists else '❌'} {var}: {'OK' if exists else 'MISSING'}")
        
        # HTTPS
        try:
            response = requests.get('http://localhost:5000', timeout=5)
            https = response.url.startswith('https://')
            self.checks['security']['https_enabled'] = https
            print(f"  {'✅' if https else '❌'} HTTPS: {'OK' if https else 'FAIL'}")
        except:
            self.checks['security']['https_enabled'] = False
            print("  ❌ HTTPS check: FAIL")
    
    def check_performance(self):
        """Vérifications performance"""
        print("\n⚡ Performance:")
        
        # Temps de réponse
        try:
            start = time.time()
            response = requests.get('http://localhost:5000/health', timeout=10)
            duration = time.time() - start
            fast = duration < 1.0
            self.checks['performance']['response_time'] = fast
            print(f"  {'✅' if fast else '❌'} Response time: {duration:.2f}s {'OK' if fast else 'SLOW'}")
        except:
            self.checks['performance']['response_time'] = False
            print("  ❌ Response time check: FAIL")
        
        # Cache
        try:
            # Vérifier les headers de cache
            response = requests.get('http://localhost:5000/static/style.css')
            cached = 'Cache-Control' in response.headers
            self.checks['performance']['cache_headers'] = cached
            print(f"  {'✅' if cached else '❌'} Cache headers: {'OK' if cached else 'MISSING'}")
        except:
            self.checks['performance']['cache_headers'] = False
            print("  ❌ Cache check: FAIL")
    
    def check_monitoring(self):
        """Vérifications monitoring"""
        print("\n📊 Monitoring:")
        
        # Métriques
        try:
            response = requests.get('http://localhost:5000/metrics', timeout=5)
            metrics = response.status_code == 200
            self.checks['monitoring']['metrics_endpoint'] = metrics
            print(f"  {'✅' if metrics else '❌'} Metrics endpoint: {'OK' if metrics else 'FAIL'}")
        except:
            self.checks['monitoring']['metrics_endpoint'] = False
            print("  ❌ Metrics check: FAIL")
        
        # Logs
        log_files = ['app.log', 'error.log', 'access.log']
        for log_file in log_files:
            exists = os.path.exists(f'logs/{log_file}')
            self.checks['monitoring'][f'{log_file}_exists'] = exists
            print(f"  {'✅' if exists else '❌'} {log_file}: {'OK' if exists else 'MISSING'}")
    
    def check_backup(self):
        """Vérifications backup"""
        print("\n💾 Backup:")
        
        # Backup récent
        backup_dir = '/backups'
        if os.path.exists(backup_dir):
            backups = [f for f in os.listdir(backup_dir) if f.endswith('.gz')]
            recent_backup = len(backups) > 0
            self.checks['backup']['recent_backup'] = recent_backup
            print(f"  {'✅' if recent_backup else '❌'} Recent backup: {'OK' if recent_backup else 'MISSING'}")
        else:
            self.checks['backup']['recent_backup'] = False
            print("  ❌ Backup directory: MISSING")
    
    def check_documentation(self):
        """Vérifications documentation"""
        print("\n📚 Documentation:")
        
        docs = ['README.md', 'DEPLOYMENT.md', 'API.md', 'docker-compose.yml']
        for doc in docs:
            exists = os.path.exists(doc)
            self.checks['documentation'][doc] = exists
            print(f"  {'✅' if exists else '❌'} {doc}: {'OK' if exists else 'MISSING'}")
    
    def print_summary(self):
        """Affiche le résumé"""
        print("\n" + "=" * 60)
        print("📋 RÉSUMÉ DE LA REVUE")
        print("=" * 60)
        
        total_checks = 0
        passed_checks = 0
        
        for category, checks in self.checks.items():
            category_total = len(checks)
            category_passed = sum(checks.values())
            total_checks += category_total
            passed_checks += category_passed
            
            status = "✅" if category_passed == category_total else "⚠️" if category_passed > 0 else "❌"
            print(f"{status} {category.capitalize()}: {category_passed}/{category_total}")
        
        overall_score = (passed_checks / total_checks) * 100 if total_checks > 0 else 0
        
        print("-" * 60)
        print(f"Score global: {overall_score:.1f}% ({passed_checks}/{total_checks})")
        
        if overall_score >= 90:
            print("🎉 Prêt pour la production!")
        elif overall_score >= 75:
            print("⚠️  Presque prêt, quelques ajustements nécessaires")
        else:
            print("❌ Corrections majeures requises avant la production")

# Exécution
if __name__ == "__main__":
    checklist = ProductionChecklist()
    checklist.run_all_checks()
```

**Optimisations finales**
```python
# final_optimizations.py
import os
import subprocess
from production_checklist import ProductionChecklist

def apply_final_optimizations():
    """Applique les dernières optimisations"""
    
    print("🚀 Optimisations finales...")
    
    # Optimiser les images Docker
    print("🏗️  Optimisation Docker...")
    subprocess.run(["docker", "system", "prune", "-f"], check=True)
    subprocess.run(["docker", "image", "prune", "-f"], check=True)
    
    # Précharger les données fréquentes
    print("📦 Préchargement des données...")
    # Cache warmup logic
    
    # Optimiser la configuration
    print("⚙️  Optimisation configuration...")
    if os.getenv('ENVIRONMENT') == 'production':
        # Configurations production
        pass
    
    # Tests de charge finaux
    print("🧪 Tests de charge...")
    # Run load tests
    
    print("✅ Optimisations terminées")

def prepare_deployment_package():
    """Prépare le package de déploiement"""
    
    print("📦 Préparation du package de déploiement...")
    
    # Créer le répertoire de déploiement
    os.makedirs('deployment', exist_ok=True)
    
    # Copier les fichiers nécessaires
    files_to_copy = [
        'docker-compose.yml',
        'docker-compose.prod.yml',
        'Dockerfile',
        'nginx.conf',
        '.env.example',
        'deploy.sh',
        'backup.sh',
        'restore.sh'
    ]
    
    for file in files_to_copy:
        if os.path.exists(file):
            shutil.copy2(file, 'deployment/')
    
    # Créer l'archive
    shutil.make_archive('deployment_package', 'zip', 'deployment')
    
    print("✅ Package de déploiement créé: deployment_package.zip")

# Revue finale
def final_review():
    """Revue finale avant déploiement"""
    
    print("🔍 Revue finale...")
    
    # Exécuter la checklist
    checklist = ProductionChecklist()
    checklist.run_all_checks()
    
    # Demander confirmation
    response = input("\nConfirmer le déploiement en production ? (oui/non): ")
    
    if response.lower() in ['oui', 'yes', 'y']:
        print("🚀 Déploiement approuvé!")
        return True
    else:
        print("⏸️  Déploiement annulé")
        return False

if __name__ == "__main__":
    apply_final_optimizations()
    prepare_deployment_package()
    
    if final_review():
        print("\n🎯 Prêt pour le déploiement en production!")
        print("📋 Checklist: https://github.com/your-repo/checklist")
        print("📞 Support: contact@yourcompany.com")
    else:
        print("\n🔄 Corrections nécessaires avant le déploiement")
```

**Démonstration pratique (15 min)**
Exécution de la revue finale et optimisations.

**Exercices guidés (10 min)**
1. Créer une checklist de production
2. Identifier les problèmes restants
3. Appliquer les optimisations finales

**QCM d'auto-évaluation (3 min)**
1. Pourquoi une revue finale ?
2. Quelle checklist pour la production ?
3. Quand déployer en production ?

**Devoir**
Effectuer une revue complète et optimiser l'application "Tâches" pour la production finale.

---

## Cours 30 - Soutenance module 6
**Objectifs**
- Présenter l'infrastructure complète
- Démontrer le déploiement automatisé
- Répondre aux questions techniques

**Leçon (30 min - détaillée)**
La soutenance valide la maîtrise complète du DevOps et du déploiement.

**Préparation de la démonstration**
```python
# demo_infrastructure.py
import subprocess
import time
import requests
from production_checklist import ProductionChecklist

class InfrastructureDemo:
    def __init__(self):
        self.services = {
            'web': 'http://localhost:5000',
            'api': 'http://localhost:5000/api',
            'monitoring': 'http://localhost:3000',
            'logs': 'http://localhost:5601'
        }
    
    def start_demo_environment(self):
        """Démarre l'environnement de démonstration"""
        print("🚀 Démarrage de l'environnement de démonstration...")
        
        # Démarrer les services
        subprocess.run(["docker-compose", "up", "-d"], check=True)
        
        # Attendre que les services soient prêts
        self.wait_for_services()
        
        print("✅ Environnement de démonstration prêt!")
    
    def wait_for_services(self):
        """Attend que tous les services soient opérationnels"""
        for service_name, url in self.services.items():
            print(f"⏳ Attente de {service_name}...")
            
            max_attempts = 30
            for attempt in range(max_attempts):
                try:
                    if service_name == 'web':
                        response = requests.get(f"{url}/health")
                    else:
                        response = requests.get(url)
                    
                    if response.status_code in [200, 302]:
                        print(f"  ✅ {service_name} prêt")
                        break
                except:
                    pass
                
                time.sleep(2)
            else:
                print(f"  ❌ {service_name} n'est pas disponible")
    
    def demonstrate_features(self):
        """Démontre les fonctionnalités principales"""
        
        demonstrations = [
            {
                'name': 'Application principale',
                'url': self.services['web'],
                'description': 'Interface utilisateur moderne'
            },
            {
                'name': 'API REST',
                'url': f"{self.services['api']}/tasks",
                'description': 'Endpoints REST avec authentification'
            },
            {
                'name': 'Monitoring',
                'url': self.services['monitoring'],
                'description': 'Tableaux de bord Grafana'
            },
            {
                'name': 'Logs centralisés',
                'url': self.services['logs'],
                'description': 'Interface Kibana pour les logs'
            }
        ]
        
        print("\n🎯 Démonstration des fonctionnalités:")
        print("-" * 50)
        
        for demo in demonstrations:
            print(f"📍 {demo['name']}: {demo['url']}")
            print(f"   {demo['description']}")
            
            # Tester la disponibilité
            try:
                response = requests.get(demo['url'], timeout=5)
                status = "✅ Accessible" if response.status_code < 400 else "⚠️  Erreur"
                print(f"   Statut: {status} ({response.status_code})")
            except:
                print("   Statut: ❌ Inaccessible")
            
            print()
    
    def run_performance_test(self):
        """Exécute un test de performance simple"""
        print("🧪 Test de performance...")
        
        import threading
        import queue
        
        results = queue.Queue()
        
        def worker():
            try:
                start_time = time.time()
                response = requests.get(f"{self.services['web']}/health")
                end_time = time.time()
                
                results.put({
                    'status': response.status_code,
                    'time': end_time - start_time
                })
            except Exception as e:
                results.put({'error': str(e)})
        
        # Lancer 10 requêtes simultanées
        threads = []
        for i in range(10):
            t = threading.Thread(target=worker)
            threads.append(t)
            t.start()
        
        # Attendre les résultats
        for t in threads:
            t.join()
        
        # Analyser les résultats
        successful = 0
        total_time = 0
        
        while not results.empty():
            result = results.get()
            if 'status' in result and result['status'] == 200:
                successful += 1
                total_time += result['time']
        
        avg_time = total_time / successful if successful > 0 else 0
        
        print(f"✅ Requêtes réussies: {successful}/10")
        print(f"⏱️  Temps de réponse moyen: {avg_time:.2f}s")
    
    def demonstrate_backup_recovery(self):
        """Démontre le backup et la récupération"""
        print("💾 Démonstration backup/récupération...")
        
        # Simuler un backup
        print("  📦 Création du backup...")
        result = subprocess.run(["./backup.sh"], capture_output=True, text=True)
        if result.returncode == 0:
            print("  ✅ Backup réussi")
        else:
            print("  ❌ Échec du backup")
        
        # Simuler une récupération (sans vraiment le faire en démo)
        print("  🔄 Simulation de récupération...")
        print("  ✅ Récupération réussie (simulée)")
    
    def show_monitoring_dashboard(self):
        """Affiche les métriques de monitoring"""
        print("📊 Métriques actuelles:")
        
        try:
            # Récupérer des métriques Prometheus
            response = requests.get("http://localhost:9090/api/v1/query?query=up")
            if response.status_code == 200:
                data = response.json()
                print(f"  ✅ Services opérationnels: {len(data['data']['result'])}")
            
            # Métriques applicatives
            response = requests.get(f"{self.services['web']}/metrics")
            if response.status_code == 200:
                print("  ✅ Métriques applicatives disponibles")
        except:
            print("  ⚠️  Monitoring non disponible en démo")

def main():
    demo = InfrastructureDemo()
    
    print("🎬 Démonstration de l'Infrastructure - Module 6")
    print("=" * 60)
    
    # Démarrer l'environnement
    demo.start_demo_environment()
    
    # Revue de production
    print("\n🔍 Revue de production:")
    checklist = ProductionChecklist()
    checklist.run_all_checks()
    
    # Démonstration des fonctionnalités
    demo.demonstrate_features()
    
    # Tests de performance
    demo.run_performance_test()
    
    # Backup/Récupération
    demo.demonstrate_backup_recovery()
    
    # Monitoring
    demo.show_monitoring_dashboard()
    
    print("\n🎯 Démonstration terminée!")
    print("📋 L'infrastructure est prête pour la production!")

if __name__ == "__main__":
    main()
```

**FAQ et réponses techniques**
```python
# faq_technical.py
TECHNICAL_FAQ = {
    'architecture': {
        'question': "Quelle architecture avez-vous choisie ?",
        'réponse': """
        Architecture microservices conteneurisée:
        - Frontend: Application Streamlit/Dash en conteneur
        - Backend: API Flask avec SQLAlchemy
        - Base de données: PostgreSQL avec réplication
        - Cache: Redis pour les sessions et données temporaires
        - Monitoring: ELK Stack + Prometheus/Grafana
        - Load balancer: Nginx pour la répartition de charge
        """
    },
    
    'scalabilité': {
        'question': "Comment gérez-vous la scalabilité ?",
        'réponse': """
        Stratégies de scalabilité implémentées:
        - Horizontal: Auto-scaling des conteneurs
        - Vertical: Ressources ajustables par service
        - Base de données: Read replicas pour les lectures
        - Cache: Redis pour réduire la charge DB
        - CDN: CloudFront pour les assets statiques
        """
    },
    
    'sécurité': {
        'question': "Quelles mesures de sécurité ?",
        'réponse': """
        Sécurité multi-couches:
        - Réseau: Security groups, VPC isolé
        - Application: Authentification JWT, validation des entrées
        - Infrastructure: Images scannées, secrets managés
        - Monitoring: Détection d'intrusions, audit logs
        - Conformité: Chiffrement des données, backups sécurisés
        """
    },
    
    'monitoring': {
        'question': "Comment surveillez-vous l'application ?",
        'réponse': """
        Stack de monitoring complète:
        - Métriques: Prometheus avec exporters personnalisés
        - Visualisation: Grafana dashboards
        - Logs: ELK Stack pour centralisation et recherche
        - Alertes: Règles automatiques avec notifications
        - Health checks: Endpoints dédiés pour Kubernetes
        """
    },
    
    'déploiement': {
        'question': "Quelle stratégie de déploiement ?",
        'réponse': """
        Déploiement automatisé avec CI/CD:
        - GitHub Actions pour l'intégration continue
        - Tests automatisés à chaque commit
        - Déploiement bleu-vert pour zéro downtime
        - Rollback automatique en cas d'erreur
        - Environnements séparés (dev/staging/prod)
        """
    },
    
    'performance': {
        'question': "Comment optimisez-vous les performances ?",
        'réponse': """
        Optimisations multi-niveaux:
        - Application: Cache intelligent, requêtes optimisées
        - Base de données: Index, read replicas, connection pooling
        - Infrastructure: CDN, compression, load balancing
        - Frontend: Minification, lazy loading, service worker
        - Monitoring: Identification des goulots d'étranglement
        """
    },
    
    'backup': {
        'question': "Quelle stratégie de sauvegarde ?",
        'réponse': """
        Backup complet et automatisé:
        - Base de données: Sauvegarde quotidienne avec WAL
        - Fichiers: Synchronisation vers S3
        - Configuration: Versionnée dans Git
        - Test: Récupération testée mensuellement
        - Rétention: 30 jours pour DB, 90 jours pour fichiers
        """
    },
    
    'coûts': {
        'question': "Comment contrôlez-vous les coûts ?",
        'réponse': """
        Optimisation des coûts:
        - Auto-scaling pour ajuster les ressources
        - Choix d'instances appropriées (reserved/s pot)
        - Monitoring des coûts par service
        - Cleanup automatique des ressources inutiles
        - Budgets et alertes de dépassement
        """
    }
}

def get_technical_answer(question_key):
    """Récupère la réponse à une question technique"""
    return TECHNICAL_FAQ.get(question_key, {"réponse": "Question non trouvée"})
```

**Démonstration pratique (15 min)**
Préparation et exécution de la soutenance complète.

**Exercices guidés (10 min)**
1. Préparer le script de démonstration
2. Anticiper les questions techniques
3. Pratiquer la présentation

**QCM d'auto-évaluation (3 min)**
1. Quel est l'objectif de la soutenance ?
2. Combien de temps pour la démo ?
3. Que faut-il préparer à l'avance ?

**Devoir**
Préparer et réaliser la soutenance complète du Module 6 avec démonstration de l'infrastructure de production.

---

**Félicitations !** 🎉

Vous venez de terminer le **Module 6** sur le **déploiement et production : Docker, cloud, CI/CD**.

**Ce que vous maîtrisez maintenant :**
- ✅ Conteneurisation avec Docker et Docker Compose
- ✅ Déploiement cloud (AWS, Azure, GCP)
- ✅ Pipelines CI/CD avec GitHub Actions
- ✅ Monitoring et logging avec ELK Stack
- ✅ Métriques et alertes avec Prometheus/Grafana
- ✅ Haute disponibilité et scaling automatique
- ✅ Sécurité et backup en production
- ✅ Performance et optimisation

**Prochaines étapes :**
L'application "Tâches" est maintenant **complètement production-ready** avec une infrastructure robuste, scalable et sécurisée. Vous pouvez déployer n'importe quelle application en suivant ces principes !

**Ressources recommandées :**
- [Documentation Docker](https://docs.docker.com)
- [AWS Documentation](https://docs.aws.amazon.com)
- [GitHub Actions](https://docs.github.com/actions)
- [Prometheus Docs](https://prometheus.io/docs)
- [ELK Stack](https://www.elastic.co/guide/index.html)

Continuez à déployer et à maintenir vos applications avec ces meilleures pratiques ! 🚀
```</content>
</xai:function_callname>create_file