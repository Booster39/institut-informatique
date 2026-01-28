# Guide de Démarrage

## Installation Locale

### Prérequis
- Java 17+
- Node.js 18+
- PostgreSQL 15+
- Docker & Docker Compose (optionnel)

### Backend

```bash
cd backend
./mvnw clean install
./mvnw spring-boot:run
```

Le backend sera accessible sur http://localhost:8080

### Frontend

```bash
cd frontend
npm install
ng serve
```

Le frontend sera accessible sur http://localhost:4200

### Avec Docker Compose

```bash
docker-compose up -d
```

## Structure des Données

### Cours (Course)
- Titre multilingue (FR, EN, AR)
- Description multilingue
- Niveau (BEGINNER, INTERMEDIATE, ADVANCED)
- Ordre d'affichage

### Leçons (Lesson)
- Titre et contenu multilingue
- Points clés (format liste)
- Analogies
- Exemples
- Blocs de code
- Durée estimée

### Exercices (Exercise)
- Types: CODING, QUIZ, PROJECT, THEORETICAL
- Description et solution multilingue
- Questions QCM associées
- Difficulté (1-5)

### Questions QCM (QuizQuestion)
- Question multilingue
- Options de réponse multilingues
- Index de la bonne réponse
- Explication multilingue

## Ajout de Contenu

### Via l'API REST

```bash
# Créer un cours
curl -X POST http://localhost:8080/api/courses \
  -H "Content-Type: application/json" \
  -d '{
    "titleFr": "Introduction à Java",
    "titleEn": "Introduction to Java",
    "titleAr": "مقدمة إلى Java",
    "descriptionFr": "Apprenez les bases de Java",
    "level": "BEGINNER",
    "orderIndex": 1
  }'
```

### Via la Base de Données

Connectez-vous à PostgreSQL et insérez directement les données.

## Langues

La plateforme supporte 3 langues:
- **Français (fr)**: Langue par défaut
- **Anglais (en)**
- **Arabe (ar)**: Support RTL (Right-to-Left)

Le changement de langue se fait via le sélecteur dans le header.
