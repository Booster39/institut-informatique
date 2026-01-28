# Guide du Contenu Pédagogique

## 📚 Structure des Cours

Chaque cours contient :
- **Leçons** : Contenu théorique avec explications, analogies et exemples
- **Exercices** : Pratique guidée (CODING, QUIZ, PROJECT, THEORETICAL)
- **QCM** : Questions à choix multiples avec corrigés
- **Blocs de code** : Exemples de code éditable et exécutable

## 🎯 Pédagogie Appliquée

### 1. Analogies
Chaque concept est expliqué avec des analogies concrètes :
- Variables = boîtes avec étiquettes
- HTTP = langue de communication
- Composants Angular = pièces LEGO
- Base de données = bibliothèque organisée

### 2. Points Clés
Les concepts importants sont listés numériquement pour faciliter la mémorisation :
```
1. Premier point important
2. Deuxième point important
3. Troisième point important
```

### 3. Exemples Pratiques
Chaque leçon contient des exemples de code commentés et expliqués.

### 4. Exercices Progressifs
- **Niveau 1-2** : Débutant
- **Niveau 3** : Intermédiaire
- **Niveau 4-5** : Avancé

## 📝 Format des Données

### Leçons
- `content_*` : Explication principale du concept
- `key_points_*` : Liste numérotée des points importants (séparés par `\n`)
- `analogies_*` : Analogies pour faciliter la compréhension
- `examples_*` : Exemples de code ou cas d'usage

### Exercices
- `type` : CODING, QUIZ, PROJECT, THEORETICAL
- `difficulty` : 1 (facile) à 5 (très difficile)
- `solution_*` : Solution complète avec explications

### QCM
- `correct_answer_index` : Index de la bonne réponse (0-based)
- `explanation_*` : Explication de la réponse correcte

## 🔧 Ajouter du Contenu

### Via SQL
Modifiez `backend/src/main/resources/lessons_exercises_data.sql` et ajoutez :

```sql
INSERT INTO lessons (course_id, title_fr, title_en, title_ar, ...)
VALUES (...);

INSERT INTO exercises (course_id, lesson_id, ...)
VALUES (...);
```

### Via l'API REST
```bash
# Créer une leçon
POST /api/lessons
{
  "courseId": 1,
  "titleFr": "Titre en français",
  "titleEn": "Title in English",
  "titleAr": "العنوان بالعربية",
  ...
}
```

## 📊 Contenu Actuel

### Cours 1: Fondamentaux du développement
- ✅ Leçon 1.1: Introduction à la logique de programmation
- ✅ Leçon 1.2: Variables et types de données
- ✅ Exercices et QCM associés

### Cours 2: Introduction au Développement Web
- ✅ Leçon 2.1: Comment fonctionne le web
- ✅ Exercices et QCM associés

### Cours 3: Java et Spring Boot
- ✅ Leçon 3.1: Premiers pas avec Java
- ✅ Bloc de code éditable
- ✅ Exercice de codage

### Cours 4: Angular et TypeScript
- ✅ Leçon 4.1: Introduction à TypeScript
- ✅ Leçon 4.2: Composants Angular
- ✅ Blocs de code

### Cours 5: Bases de données avec PostgreSQL
- ✅ Leçon 5.1: Introduction aux bases de données
- ✅ Exercice: Créer une table SQL

## 🚀 Prochaines Étapes

Pour compléter le contenu pédagogique :

1. **Ajouter plus de leçons** pour chaque cours (3-5 leçons par cours)
2. **Créer des exercices variés** : CODING, QCM, PROJECT
3. **Ajouter des blocs de code** pour chaque concept technique
4. **Créer des projets finaux** pour chaque module
5. **Ajouter des QCM** pour chaque leçon (3-5 questions)

## 💡 Bonnes Pratiques

1. **Toujours en 3 langues** : FR, EN, AR
2. **Analogies concrètes** : Utiliser des exemples de la vie quotidienne
3. **Progression logique** : Du simple au complexe
4. **Exercices pratiques** : Chaque concept doit avoir un exercice
5. **Corrigés détaillés** : Expliquer le "pourquoi", pas juste le "comment"
