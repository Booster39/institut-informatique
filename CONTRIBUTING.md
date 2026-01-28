# Guide de Contribution

## 🎯 Objectif du Projet

Créer une plateforme d'apprentissage complète pour devenir développeur full stack en 1 an, avec support multilingue (Français, Anglais, Arabe).

## 🏗️ Architecture

- **Backend**: Spring Boot (Java 17)
- **Frontend**: Angular 17
- **Base de données**: PostgreSQL
- **Infrastructure**: AWS (EKS, RDS)
- **CI/CD**: GitHub Actions
- **GitOps**: ArgoCD
- **Monitoring**: Prometheus

## 📋 Standards de Code

### Backend (Java)
- Utiliser Lombok pour réduire le boilerplate
- Suivre les conventions Spring Boot
- Documenter les APIs avec des commentaires clairs
- Tests unitaires pour les services

### Frontend (Angular)
- Utiliser TypeScript strict
- Composants réutilisables
- Services pour la logique métier
- Support multilingue pour tous les textes

## 🌍 Multilingue

**IMPORTANT**: Tous les contenus doivent être ajoutés en 3 langues:
- Français (fr)
- Anglais (en)
- Arabe (ar)

### Format des données

```json
{
  "titleFr": "Titre en français",
  "titleEn": "Title in English",
  "titleAr": "العنوان بالعربية",
  "contentFr": "Contenu...",
  "contentEn": "Content...",
  "contentAr": "المحتوى..."
}
```

## 📝 Ajout de Contenu

### Créer un nouveau cours

1. Via l'API REST:
```bash
POST /api/courses
```

2. Via la base de données:
```sql
INSERT INTO courses (title_fr, title_en, title_ar, ...) VALUES (...);
```

### Créer une leçon

Une leçon doit contenir:
- Titre multilingue
- Contenu multilingue
- Points clés (format liste, séparés par `\n`)
- Analogies
- Exemples
- Blocs de code (optionnel)

### Créer un exercice

Types d'exercices:
- `CODING`: Exercice de programmation
- `QUIZ`: Question à choix multiples
- `PROJECT`: Projet complet
- `THEORETICAL`: Exercice théorique

## 🧪 Tests

### Backend
```bash
cd backend
mvn test
```

### Frontend
```bash
cd frontend
npm test
```

## 🚀 Déploiement

1. Les changements sur `main` déclenchent automatiquement le CI/CD
2. Les images Docker sont construites et poussées
3. ArgoCD synchronise automatiquement les déploiements

## 📚 Structure des Cours

Chaque cours doit suivre cette structure:

1. **Introduction** - Vue d'ensemble
2. **Leçons théoriques** - Concepts et explications
3. **Exemples pratiques** - Code et démonstrations
4. **Exercices** - Pratique guidée
5. **QCM** - Évaluation des connaissances
6. **Projet final** - Application complète

## 🎓 Pédagogie

La plateforme privilégie:
- ✅ Explications claires et progressives
- ✅ Analogies pour faciliter la compréhension
- ✅ Exemples concrets et pratiques
- ✅ Exercices avec corrigés
- ✅ Progression par étapes

## 🔍 Vérifications avant commit

- [ ] Code compile sans erreurs
- [ ] Tests passent
- [ ] Contenu multilingue complet
- [ ] Documentation à jour
- [ ] Pas de secrets dans le code

## 📖 Ressources

- [Documentation Spring Boot](https://spring.io/projects/spring-boot)
- [Documentation Angular](https://angular.io/docs)
- [Documentation Kubernetes](https://kubernetes.io/docs)
- [Documentation Terraform](https://www.terraform.io/docs)
