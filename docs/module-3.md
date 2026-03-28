# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 3 (30 cours) - Base de données avancées : SQLAlchemy, migrations, optimisation

### Résumé
Ce module approfondit les compétences en gestion de bases de données en introduisant SQLAlchemy, un ORM puissant pour Python, les migrations de base de données avec Alembic, et les techniques d'optimisation des requêtes et des performances. Nous partirons de l'application "Tâches" du module précédent et la refactoriserons pour utiliser SQLAlchemy au lieu de requêtes SQL brutes. Nous apprendrons à gérer les changements de schéma de base de données de manière sûre avec les migrations, et nous explorerons diverses stratégies d'optimisation pour améliorer les performances des applications. Ce module vous donnera les outils nécessaires pour construire des applications web robustes et évolutives avec une gestion de base de données professionnelle.

### Rappel du projet fil rouge (on conserve "Tâches")
Tu vas repartir de la base du Module 2 (avec authentification) et moderniser la couche base de données :
1. Remplacer les requêtes SQL brutes par SQLAlchemy ORM
2. Ajouter un système de migrations pour gérer les changements de schéma
3. Optimiser les requêtes pour éviter les problèmes de performance (N+1 queries, etc.)
4. Ajouter des fonctionnalités avancées comme la pagination, les filtres complexes, et les statistiques
5. Préparer l'application pour une montée en charge avec une base de données plus robuste (PostgreSQL)

### Hypothèses
- **Python 3.11+** : Pour bénéficier des dernières fonctionnalités de SQLAlchemy
- **Flask** : Framework web déjà maîtrisé des modules précédents
- **SQLAlchemy 2.x** : ORM moderne et performant pour Python
- **Alembic** : Outil de migration de base de données intégré à SQLAlchemy
- **Base de données** : SQLite pour le développement, PostgreSQL pour la production
- **Environnements virtuels** : Gestion des dépendances avec venv et requirements.txt

### Rythme
- **4 cours par semaine** : Rythme soutenu pour maîtriser les concepts avancés
- **30 cours pour ce module** : Environ 7 semaines et demie d'apprentissage intensif
- **Chaque cours dure 1 heure** : Théorie approfondie, démonstration pratique, exercices guidés, QCM, et devoir

---

## Planning (30 cours)
| Cours | Thème principal | Objectif du cours |
|---:|---|---|
| 1 | Introduction à SQLAlchemy | Comprendre l'ORM et ses avantages |
| 2 | Installation et configuration | Mettre en place SQLAlchemy dans le projet |
| 3 | Définir les modèles | Créer les classes Task et User avec SQLAlchemy |
| 4 | Sessions et transactions | Gérer les connexions et transactions |
| 5 | Requêtes de base | CRUD avec SQLAlchemy |
| 6 | Relations many-to-one | Lier tâches et utilisateurs |
| 7 | Relations many-to-many | Catégories et tags pour les tâches |
| 8 | Requêtes avancées | Filtres, tris, et jointures |
| 9 | Migration depuis SQLite brut | Refactoriser l'app existante |
| 10 | Introduction aux migrations | Concepts et importance |
| 11 | Installer Alembic | Configuration de l'outil de migration |
| 12 | Première migration | Générer et appliquer une migration initiale |
| 13 | Modifier le schéma | Ajouter des colonnes et tables |
| 14 | Migration de données | Transformer les données existantes |
| 15 | Rollback et versioning | Annuler et gérer les versions |
| 16 | Optimisation des requêtes | Éviter les N+1 queries |
| 17 | Index et contraintes | Améliorer les performances |
| 18 | Pagination | Gérer de gros volumes de données |
| 19 | Cache et lazy loading | Stratégies de chargement |
| 20 | Profiling des requêtes | Analyser et optimiser les performances |
| 21 | Intégration avec Flask | SQLAlchemy dans une app Flask |
| 22 | Gestion des erreurs DB | Transactions et rollback |
| 23 | Tests avec base de données | Tests unitaires et d'intégration |
| 24 | Migration vers PostgreSQL | Passage à une base production-ready |
| 25 | Déploiement et backup | Stratégies pour la production |
| 26 | Monitoring et logging | Surveiller les performances DB |
| 27 | Sécurité des données | Protection contre les injections |
| 28 | Optimisation avancée | Partitionnement et sharding |
| 29 | Revue et refactoring final | Nettoyer et optimiser le code |
| 30 | Soutenance module 3 | Démo et checklist finale |

---

## Cours 1 - Introduction à SQLAlchemy
**Objectifs**
- Comprendre ce qu'est un ORM et pourquoi l'utiliser
- Découvrir les avantages de SQLAlchemy par rapport aux requêtes SQL brutes
- Préparer l'environnement pour l'adoption de SQLAlchemy

**Leçon (30 min - détaillée)**
SQLAlchemy est un ORM (Object-Relational Mapping) puissant pour Python qui permet de manipuler des bases de données relationnelles comme si elles étaient des objets Python. Au lieu d'écrire des requêtes SQL complexes, nous définissons des classes Python qui représentent nos tables, et SQLAlchemy se charge de la traduction vers SQL.

**Pourquoi SQLAlchemy ?**
- **Abstraction** : Écrire du code Python au lieu de SQL
- **Sécurité** : Protection automatique contre les injections SQL
- **Portabilité** : Même code pour SQLite, PostgreSQL, MySQL, etc.
- **Productivité** : Moins de code répétitif, focus sur la logique métier
- **Maintenabilité** : Code plus lisible et évolutif

**Concepts clés**
- **Modèle** : Classe Python représentant une table
- **Session** : Interface pour interagir avec la base de données
- **Query** : Objet pour construire des requêtes
- **Migration** : Gestion des changements de schéma

**Comparaison avec les modules précédents**
Dans les modules 1 et 2, nous utilisions des requêtes SQL brutes avec sqlite3. Maintenant, nous allons remplacer cela par SQLAlchemy pour plus de robustesse et de maintenabilité.

**Démonstration pratique (15 min)**
Installation de SQLAlchemy et création d'un premier modèle simple.

**Exercices guidés (10 min)**
1. Installer SQLAlchemy dans un environnement virtuel
2. Créer une classe Task basique
3. Tester la création d'une session

**QCM d'auto-évaluation (3 min)**
1. Qu'est-ce qu'un ORM ?
2. Quel est l'avantage principal de SQLAlchemy ?
3. Comment s'appelle l'outil de migration de SQLAlchemy ?

**Devoir**
Lire la documentation officielle de SQLAlchemy (section "Overview") et noter 3 avantages par rapport à l'utilisation directe de SQL.

---

## Cours 2 - Installation et configuration
**Objectifs**
- Installer SQLAlchemy et ses dépendances
- Configurer la connexion à la base de données
- Mettre à jour requirements.txt

**Leçon (30 min - détaillée)**
Pour utiliser SQLAlchemy, nous devons d'abord l'installer et le configurer correctement dans notre projet Flask.

**Installation**
```bash
pip install SQLAlchemy
```

**Configuration de base**
```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///tasks.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
```

**Intégration avec Flask**
Nous utiliserons Flask-SQLAlchemy pour une intégration plus facile avec Flask.

**Démonstration pratique (15 min)**
Configuration complète dans le projet "Tâches".

**Exercices guidés (10 min)**
1. Ajouter SQLAlchemy à requirements.txt
2. Créer un fichier config.py pour la base de données
3. Tester la connexion

**QCM d'auto-évaluation (3 min)**
1. Quelle commande installe SQLAlchemy ?
2. Quel est le rôle de create_engine ?
3. Pourquoi utiliser Flask-SQLAlchemy ?

**Devoir**
Modifier le projet "Tâches" pour inclure SQLAlchemy dans requirements.txt et créer un fichier de configuration de base.

---

## Cours 3 - Définir les modèles
**Objectifs**
- Créer des classes modèles avec SQLAlchemy
- Définir les colonnes et leurs types
- Comprendre les déclarations de table

**Leçon (30 min - détaillée)**
Les modèles SQLAlchemy sont des classes Python qui héritent de Base. Chaque attribut représente une colonne de la table.

**Exemple de modèle**
```python
from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Task(Base):
    __tablename__ = "tasks"
    
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, nullable=False)
    description = Column(String)
    completed = Column(Boolean, default=False)
    created_at = Column(DateTime, default=datetime.utcnow)
```

**Types de colonnes**
- Integer, String, Text, Boolean
- DateTime, Float, etc.
- Relations avec ForeignKey

**Démonstration pratique (15 min)**
Créer les modèles Task et User pour notre application.

**Exercices guidés (10 min)**
1. Définir le modèle Task
2. Définir le modèle User
3. Créer les tables avec Base.metadata.create_all()

**QCM d'auto-évaluation (3 min)**
1. Quelle classe hériter pour créer un modèle ?
2. Quel décorateur utiliser pour les colonnes ?
3. Comment créer les tables ?

**Devoir**
Implémenter les modèles Task et User dans le projet avec toutes les colonnes nécessaires.

---

## Cours 4 - Sessions et transactions
**Objectifs**
- Comprendre le concept de session SQLAlchemy
- Gérer les transactions correctement
- Éviter les fuites de connexions

**Leçon (30 min - détaillée)**
La session SQLAlchemy gère la connexion à la base de données et les transactions. Elle maintient un cache d'objets et synchronise les changements avec la base.

**Utilisation de base**
```python
session = SessionLocal()
try:
    task = Task(title="Nouvelle tâche")
    session.add(task)
    session.commit()
except:
    session.rollback()
finally:
    session.close()
```

**Context manager pour Flask**
Nous utiliserons un pattern avec yield pour gérer automatiquement les sessions dans Flask.

**Démonstration pratique (15 min)**
Implémentation d'un gestionnaire de session dans l'app Flask.

**Exercices guidés (10 min)**
1. Créer une fonction get_db()
2. Tester l'ajout d'une tâche
3. Gérer une erreur de transaction

**QCM d'auto-évaluation (3 min)**
1. Quel est le rôle de session.commit() ?
2. Pourquoi utiliser session.close() ?
3. Quand utiliser rollback() ?

**Devoir**
Intégrer la gestion de session dans l'application Flask et tester les opérations CRUD de base.

---

## Cours 5 - Requêtes de base
**Objectifs**
- Maîtriser les opérations CRUD avec SQLAlchemy
- Utiliser Query pour récupérer des données
- Comprendre les méthodes add, delete, update

**Leçon (30 min - détaillée)**
SQLAlchemy fournit une API fluide pour les requêtes. Au lieu d'écrire du SQL, nous utilisons des méthodes Python.

**Opérations CRUD**
```python
# Create
task = Task(title="Titre", description="Desc")
session.add(task)
session.commit()

# Read
tasks = session.query(Task).all()
task = session.query(Task).filter(Task.id == 1).first()

# Update
task.title = "Nouveau titre"
session.commit()

# Delete
session.delete(task)
session.commit()
```

**Démonstration pratique (15 min)**
Refactoriser les routes CRUD de l'app pour utiliser SQLAlchemy.

**Exercices guidés (10 min)**
1. Créer une nouvelle tâche
2. Récupérer toutes les tâches
3. Mettre à jour une tâche existante
4. Supprimer une tâche

**QCM d'auto-évaluation (3 min)**
1. Quelle méthode pour récupérer tous les objets ?
2. Comment filtrer les résultats ?
3. Quelle méthode pour sauvegarder les changements ?

**Devoir**
Remplacer toutes les requêtes SQL brutes par des opérations SQLAlchemy dans les routes de l'application.

---

## Cours 6 - Relations many-to-one
**Objectifs**
- Définir des relations entre modèles
- Utiliser ForeignKey et relationship
- Comprendre les jointures implicites

**Leçon (30 min - détaillée)**
Les relations permettent de lier des tables entre elles. Une tâche appartient à un utilisateur (many-to-one).

**Définition de relation**
```python
class Task(Base):
    # ... autres colonnes
    user_id = Column(Integer, ForeignKey("users.id"))
    user = relationship("User", back_populates="tasks")

class User(Base):
    # ... autres colonnes
    tasks = relationship("Task", back_populates="user")
```

**Utilisation**
```python
user = session.query(User).first()
tasks = user.tasks  # Accès direct aux tâches de l'utilisateur
```

**Démonstration pratique (15 min)**
Ajouter la relation user-task dans les modèles.

**Exercices guidés (10 min)**
1. Définir la ForeignKey
2. Ajouter la relationship
3. Tester l'accès aux tâches d'un utilisateur

**QCM d'auto-évaluation (3 min)**
1. Quel type pour une ForeignKey ?
2. Quel paramètre pour back_populates ?
3. Comment accéder aux objets liés ?

**Devoir**
Modifier les modèles pour inclure la relation entre User et Task, et mettre à jour les routes en conséquence.

---

## Cours 7 - Relations many-to-many
**Objectifs**
- Implémenter des relations many-to-many
- Utiliser des tables d'association
- Gérer les tags/catégories pour les tâches

**Leçon (30 min - détaillée)**
Pour les relations many-to-many, nous avons besoin d'une table intermédiaire.

**Modèle avec tags**
```python
task_tags = Table('task_tags', Base.metadata,
    Column('task_id', Integer, ForeignKey('tasks.id')),
    Column('tag_id', Integer, ForeignKey('tags.id'))
)

class Task(Base):
    # ... autres colonnes
    tags = relationship("Tag", secondary=task_tags, back_populates="tasks")

class Tag(Base):
    # ... colonnes
    tasks = relationship("Task", secondary=task_tags, back_populates="tags")
```

**Démonstration pratique (15 min)**
Ajouter un système de tags aux tâches.

**Exercices guidés (10 min)**
1. Créer le modèle Tag
2. Définir la table d'association
3. Ajouter des tags à une tâche

**QCM d'auto-évaluation (3 min)**
1. Pourquoi une table d'association ?
2. Quel paramètre pour secondary ?
3. Comment ajouter un tag à une tâche ?

**Devoir**
Implémenter un système de tags pour les tâches avec une relation many-to-many.

---

## Cours 8 - Requêtes avancées
**Objectifs**
- Maîtriser les filtres et tris complexes
- Utiliser les jointures explicites
- Optimiser les requêtes

**Leçon (30 min - détaillée)**
SQLAlchemy offre de puissantes capacités de requête.

**Filtres avancés**
```python
# Filtres multiples
tasks = session.query(Task).filter(
    Task.completed == False,
    Task.created_at > datetime.now() - timedelta(days=7)
).all()

# Tris
tasks = session.query(Task).order_by(Task.created_at.desc()).all()

# Jointures
tasks = session.query(Task).join(User).filter(User.name == "John").all()
```

**Démonstration pratique (15 min)**
Implémenter des filtres avancés dans l'API.

**Exercices guidés (10 min)**
1. Filtrer par statut et date
2. Trier par date de création
3. Joindre avec les utilisateurs

**QCM d'auto-évaluation (3 min)**
1. Comment combiner des filtres ?
2. Quelle méthode pour trier ?
3. Quand utiliser join() ?

**Devoir**
Ajouter des endpoints API avec filtres et tris avancés.

---

## Cours 9 - Migration depuis SQLite brut
**Objectifs**
- Refactoriser l'application existante
- Remplacer sqlite3 par SQLAlchemy
- Tester la compatibilité

**Leçon (30 min - détaillée)**
Migration progressive de l'application du module 2 vers SQLAlchemy.

**Étapes de migration**
1. Garder l'ancienne implémentation en parallèle
2. Implémenter la nouvelle version avec SQLAlchemy
3. Migrer les données
4. Tester exhaustivement
5. Supprimer l'ancien code

**Démonstration pratique (15 min)**
Refactoriser db.py pour utiliser SQLAlchemy.

**Exercices guidés (10 min)**
1. Créer une nouvelle fonction db avec SQLAlchemy
2. Tester les opérations CRUD
3. Comparer les performances

**QCM d'auto-évaluation (3 min)**
1. Quelle approche pour la migration ?
2. Comment tester la compatibilité ?
3. Quand supprimer l'ancien code ?

**Devoir**
Migrer complètement l'application vers SQLAlchemy tout en conservant les fonctionnalités d'authentification.

---

## Cours 10 - Introduction aux migrations
**Objectifs**
- Comprendre l'importance des migrations
- Découvrir Alembic
- Préparer l'environnement de migration

**Leçon (30 min - détaillée)**
Les migrations permettent de versionner les changements de schéma de base de données.

**Pourquoi des migrations ?**
- **Versioning** : Historique des changements
- **Collaboration** : Synchronisation entre développeurs
- **Déploiement** : Mise à jour automatique en production
- **Rollback** : Annulation de changements

**Concepts clés**
- **Revision** : Version du schéma
- **Upgrade/Downgrade** : Appliquer/annuler des changements
- **Alembic** : Outil standard pour SQLAlchemy

**Démonstration pratique (15 min)**
Installer et initialiser Alembic.

**Exercices guidés (10 min)**
1. Installer Alembic
2. Initialiser le répertoire de migrations
3. Examiner la structure créée

**QCM d'auto-évaluation (3 min)**
1. Quel outil pour les migrations SQLAlchemy ?
2. Pourquoi versionner le schéma ?
3. Quelle commande initialise Alembic ?

**Devoir**
Installer Alembic dans le projet et créer la structure de base pour les migrations.

---

## Cours 11 - Installer Alembic
**Objectifs**
- Configurer Alembic correctement
- Comprendre le fichier env.py
- Préparer les modèles pour la migration

**Leçon (30 min - détaillée)**
Configuration d'Alembic pour notre projet Flask.

**Fichier alembic.ini**
```ini
[alembic]
script_location = alembic
sqlalchemy.url = sqlite:///tasks.db
```

**Fichier env.py**
Import des modèles et configuration de la base.

**Démonstration pratique (15 min)**
Configurer Alembic pour détecter nos modèles.

**Exercices guidés (10 min)**
1. Modifier alembic.ini
2. Configurer env.py
3. Tester la détection des modèles

**QCM d'auto-évaluation (3 min)**
1. Quel fichier configure Alembic ?
2. Où importer les modèles ?
3. Comment spécifier l'URL de la base ?

**Devoir**
Configurer complètement Alembic pour le projet avec tous les modèles importés.

---

## Cours 12 - Première migration
**Objectifs**
- Générer une migration initiale
- Comprendre le contenu d'une migration
- Appliquer la migration

**Leçon (30 min - détaillée)**
Création de la première migration qui crée toutes les tables.

**Génération**
```bash
alembic revision --autogenerate -m "Initial migration"
```

**Contenu d'une migration**
```python
def upgrade():
    op.create_table('users', ...)
    op.create_table('tasks', ...)

def downgrade():
    op.drop_table('tasks')
    op.drop_table('users')
```

**Application**
```bash
alembic upgrade head
```

**Démonstration pratique (15 min)**
Générer et appliquer la migration initiale.

**Exercices guidés (10 min)**
1. Générer la migration
2. Examiner le fichier généré
3. Appliquer la migration

**QCM d'auto-évaluation (3 min)**
1. Quelle commande génère une migration ?
2. Que contient upgrade() ?
3. Comment appliquer une migration ?

**Devoir**
Créer et appliquer la migration initiale pour toutes les tables du projet.

---

## Cours 13 - Modifier le schéma
**Objectifs**
- Ajouter des colonnes et tables
- Générer des migrations automatiques
- Tester les changements

**Leçon (30 min - détaillée)**
Modification du schéma et génération de nouvelles migrations.

**Ajouter une colonne**
Modifier le modèle, puis :
```bash
alembic revision --autogenerate -m "Add priority to tasks"
alembic upgrade head
```

**Ajouter une table**
Créer un nouveau modèle, générer la migration.

**Démonstration pratique (15 min)**
Ajouter une colonne "priority" aux tâches.

**Exercices guidés (10 min)**
1. Modifier un modèle
2. Générer la migration
3. Appliquer et tester

**QCM d'auto-évaluation (3 min)**
1. Quand générer une migration ?
2. Comment ajouter une colonne ?
3. Pourquoi tester après migration ?

**Devoir**
Ajouter une nouvelle fonctionnalité (par exemple, catégories de tâches) avec migration appropriée.

---

## Cours 14 - Migration de données
**Objectifs**
- Transformer des données existantes
- Écrire des migrations avec données
- Gérer les changements complexes

**Leçon (30 min - détaillée)**
Parfois, il faut transformer les données lors d'une migration.

**Exemple de migration de données**
```python
def upgrade():
    # Ajouter la colonne
    op.add_column('tasks', sa.Column('priority', sa.Integer(), default=1))
    
    # Migrer les données
    connection = op.get_bind()
    connection.execute(
        sa.text("UPDATE tasks SET priority = 2 WHERE title LIKE '%urgent%'")
    )

def downgrade():
    op.drop_column('tasks', 'priority')
```

**Démonstration pratique (15 min)**
Migrer des données lors d'un changement de schéma.

**Exercices guidés (10 min)**
1. Préparer une migration de données
2. Tester sur des données d'exemple
3. Appliquer et vérifier

**QCM d'auto-évaluation (3 min)**
1. Quand migrer des données ?
2. Comment accéder à la connexion ?
3. Pourquoi tester les migrations ?

**Devoir**
Créer une migration qui transforme des données existantes (par exemple, normaliser des noms).

---

## Cours 15 - Rollback et versioning
**Objectifs**
- Annuler des migrations
- Gérer les versions
- Comprendre l'historique

**Leçon (30 min - détaillée)**
Alembic permet de revenir en arrière.

**Rollback**
```bash
alembic downgrade -1  # Une version en arrière
alembic downgrade base  # Tout supprimer
```

**Historique**
```bash
alembic history
alembic current
```

**Démonstration pratique (15 min)**
Tester le rollback d'une migration.

**Exercices guidés (10 min)**
1. Voir l'historique
2. Faire un rollback
3. Remonter à une version spécifique

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour rollback ?
2. Comment voir l'historique ?
3. Pourquoi faire des rollbacks ?

**Devoir**
Pratiquer les rollbacks en ajoutant puis supprimant une fonctionnalité avec migrations.

---

## Cours 16 - Optimisation des requêtes
**Objectifs**
- Éviter les N+1 queries
- Utiliser eager loading
- Optimiser les jointures

**Leçon (30 min - détaillée)**
Les N+1 queries sont un problème courant de performance.

**Problème N+1**
```python
# Mauvais : une requête par tâche
for task in tasks:
    print(task.user.name)  # Requête supplémentaire !
```

**Solution : eager loading**
```python
tasks = session.query(Task).options(joinedload(Task.user)).all()
```

**Démonstration pratique (15 min)**
Identifier et corriger des N+1 queries.

**Exercices guidés (10 min)**
1. Identifier un problème N+1
2. Appliquer joinedload
3. Mesurer l'amélioration

**QCM d'auto-évaluation (3 min)**
1. Qu'est-ce qu'une N+1 query ?
2. Quelle méthode pour eager loading ?
3. Comment mesurer les performances ?

**Devoir**
Optimiser toutes les requêtes de l'application pour éviter les N+1 queries.

---

## Cours 17 - Index et contraintes
**Objectifs**
- Ajouter des index pour la performance
- Définir des contraintes d'intégrité
- Comprendre leur impact

**Leçon (30 min - détaillée)**
Les index accélèrent les requêtes mais ralentissent les insertions.

**Ajouter un index**
```python
class Task(Base):
    # ...
    __table_args__ = (
        Index('idx_task_user_id', 'user_id'),
        Index('idx_task_completed', 'completed'),
    )
```

**Contraintes**
```python
title = Column(String(100), nullable=False, unique=True)
```

**Démonstration pratique (15 min)**
Ajouter des index stratégiques.

**Exercices guidés (10 min)**
1. Identifier les colonnes à indexer
2. Ajouter les index
3. Tester les performances

**QCM d'auto-évaluation (3 min)**
1. Quand ajouter un index ?
2. Quel impact sur les insertions ?
3. Pourquoi des contraintes ?

**Devoir**
Ajouter des index et contraintes appropriés à toutes les tables.

---

## Cours 18 - Pagination
**Objectifs**
- Implémenter la pagination
- Gérer de gros volumes de données
- Améliorer l'UX et les performances

**Leçon (30 min - détaillée)**
La pagination limite le nombre de résultats retournés.

**Pagination simple**
```python
def get_tasks(page=1, per_page=10):
    return session.query(Task)\
        .offset((page-1) * per_page)\
        .limit(per_page)\
        .all()
```

**Avec SQLAlchemy**
Utiliser paginate() de Flask-SQLAlchemy.

**Démonstration pratique (15 min)**
Ajouter la pagination à l'API des tâches.

**Exercices guidés (10 min)**
1. Implémenter la pagination
2. Ajouter des liens prev/next
3. Tester avec beaucoup de données

**QCM d'auto-évaluation (3 min)**
1. Pourquoi la pagination ?
2. Quelle méthode pour offset/limit ?
3. Comment calculer le nombre total ?

**Devoir**
Implémenter la pagination complète dans l'application avec interface utilisateur.

---

## Cours 19 - Cache et lazy loading
**Objectifs**
- Comprendre lazy vs eager loading
- Implémenter du cache simple
- Optimiser le chargement des données

**Leçon (30 min - détaillée)**
SQLAlchemy charge les relations de manière lazy par défaut.

**Lazy loading**
```python
task = session.query(Task).first()
user = task.user  # Requête au moment de l'accès
```

**Eager loading**
```python
task = session.query(Task).options(joinedload(Task.user)).first()
user = task.user  # Déjà chargé
```

**Cache simple**
Utiliser Flask-Caching pour mettre en cache les requêtes fréquentes.

**Démonstration pratique (15 min)**
Implémenter différentes stratégies de chargement.

**Exercices guidés (10 min)**
1. Tester lazy loading
2. Implémenter eager loading
3. Ajouter du cache simple

**QCM d'auto-évaluation (3 min)**
1. Quelle est la stratégie par défaut ?
2. Quand utiliser eager loading ?
3. Pourquoi du cache ?

**Devoir**
Optimiser le chargement des données dans l'application avec les bonnes stratégies.

---

## Cours 20 - Profiling des requêtes
**Objectifs**
- Analyser les performances des requêtes
- Utiliser les outils de profiling
- Identifier les goulots d'étranglement

**Leçon (30 min - détaillée)**
Le profiling permet de mesurer le temps d'exécution des requêtes.

**Outils de profiling**
- SQLAlchemy echo=True
- Flask-SQLAlchemy query recording
- Extensions comme Flask-DebugToolbar

**Exemple**
```python
from sqlalchemy import event

@event.listens_for(engine, "before_cursor_execute")
def before_cursor_execute(conn, cursor, statement, parameters, context, executemany):
    print(f"Executing: {statement}")
```

**Démonstration pratique (15 min)**
Profiler les requêtes de l'application.

**Exercices guidés (10 min)**
1. Activer le logging SQL
2. Mesurer les temps d'exécution
3. Identifier les requêtes lentes

**QCM d'auto-évaluation (3 min)**
1. Quel paramètre pour echo ?
2. Comment mesurer le temps ?
3. Pourquoi profiler ?

**Devoir**
Profiler toutes les requêtes de l'application et optimiser les plus lentes.

---

## Cours 21 - Intégration avec Flask
**Objectifs**
- Utiliser Flask-SQLAlchemy
- Gérer les sessions dans Flask
- Intégrer avec les blueprints

**Leçon (30 min - détaillée)**
Flask-SQLAlchemy simplifie l'intégration.

**Configuration**
```python
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///tasks.db'
db = SQLAlchemy(app)
```

**Utilisation**
```python
class Task(db.Model):
    # ...

@app.route('/tasks')
def get_tasks():
    return Task.query.all()
```

**Démonstration pratique (15 min)**
Refactoriser l'app pour utiliser Flask-SQLAlchemy.

**Exercices guidés (10 min)**
1. Installer Flask-SQLAlchemy
2. Configurer l'extension
3. Migrer les modèles

**QCM d'auto-évaluation (3 min)**
1. Quelle classe hériter avec Flask-SQLAlchemy ?
2. Comment configurer l'URI ?
3. Quel objet pour les requêtes ?

**Devoir**
Migrer complètement l'application vers Flask-SQLAlchemy.

---

## Cours 22 - Gestion des erreurs DB
**Objectifs**
- Gérer les erreurs de base de données
- Implémenter des transactions robustes
- Améliorer la résilience

**Leçon (30 min - détaillée)**
Les erreurs de DB peuvent survenir : contraintes violées, connexions perdues, etc.

**Gestion d'erreurs**
```python
try:
    db.session.add(task)
    db.session.commit()
except IntegrityError:
    db.session.rollback()
    flash("Erreur d'intégrité")
except SQLAlchemyError as e:
    db.session.rollback()
    flash(f"Erreur base de données: {e}")
```

**Démonstration pratique (15 min)**
Ajouter une gestion d'erreurs complète.

**Exercices guidés (10 min)**
1. Tester une violation de contrainte
2. Gérer une erreur de connexion
3. Implémenter des messages d'erreur utilisateur

**QCM d'auto-évaluation (3 min)**
1. Quelle exception pour les contraintes ?
2. Quand faire rollback ?
3. Pourquoi des messages utilisateur ?

**Devoir**
Implémenter une gestion d'erreurs robuste dans toutes les routes.

---

## Cours 23 - Tests avec base de données
**Objectifs**
- Écrire des tests unitaires pour les modèles
- Tester les opérations CRUD
- Utiliser une base de test

**Leçon (30 min - détaillée)**
Les tests sont cruciaux pour la qualité du code.

**Configuration de test**
```python
import pytest
from app import create_app, db

@pytest.fixture
def app():
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app
        db.drop_all()
```

**Test d'exemple**
```python
def test_create_task(app):
    task = Task(title="Test task")
    db.session.add(task)
    db.session.commit()
    assert task.id is not None
```

**Démonstration pratique (15 min)**
Écrire des tests pour les modèles.

**Exercices guidés (10 min)**
1. Configurer pytest
2. Écrire un test CRUD
3. Tester les relations

**QCM d'auto-évaluation (3 min)**
1. Quel fixture pour l'app ?
2. Comment créer les tables de test ?
3. Pourquoi tester les modèles ?

**Devoir**
Écrire une suite de tests complète pour tous les modèles et opérations DB.

---

## Cours 24 - Migration vers PostgreSQL
**Objectifs**
- Comprendre les différences PostgreSQL/SQLite
- Migrer la base de données
- Adapter le code pour PostgreSQL

**Leçon (30 min - détaillée)**
PostgreSQL est plus robuste que SQLite pour la production.

**Différences clés**
- Types de données plus stricts
- Transactions plus fiables
- Meilleures performances concurrentes
- JSONB, arrays, etc.

**Migration**
1. Installer PostgreSQL
2. Changer l'URI de connexion
3. Adapter les types si nécessaire
4. Migrer les données

**Démonstration pratique (15 min)**
Configurer PostgreSQL et migrer l'application.

**Exercices guidés (10 min)**
1. Installer PostgreSQL localement
2. Changer la configuration
3. Tester la migration

**QCM d'auto-évaluation (3 min)**
1. Quelle différence majeure avec SQLite ?
2. Comment changer l'URI ?
3. Pourquoi PostgreSQL en production ?

**Devoir**
Migrer l'application vers PostgreSQL et tester toutes les fonctionnalités.

---

## Cours 25 - Déploiement et backup
**Objectifs**
- Préparer l'application pour le déploiement
- Implémenter des stratégies de backup
- Gérer les migrations en production

**Leçon (30 min - détaillée)**
Le déploiement nécessite des considérations spéciales pour la base de données.

**Migrations en production**
- Tester les migrations sur une copie de prod
- Préparer un rollback plan
- Monitorer l'application pendant la migration

**Backup**
- Sauvegardes automatiques
- Stratégie de rétention
- Test de restauration

**Démonstration pratique (15 min)**
Configurer des backups automatiques.

**Exercices guidés (10 min)**
1. Créer un script de backup
2. Tester une restauration
3. Simuler une migration en prod

**QCM d'auto-évaluation (3 min)**
1. Pourquoi tester les migrations ?
2. Quelle fréquence pour les backups ?
3. Comment gérer les rollbacks en prod ?

**Devoir**
Implémenter une stratégie complète de backup et migration pour la production.

---

## Cours 26 - Monitoring et logging
**Objectifs**
- Monitorer les performances de la base
- Logger les requêtes lentes
- Détecter les problèmes tôt

**Leçon (30 min - détaillée)**
Le monitoring permet de maintenir de bonnes performances.

**Outils**
- Slow query log
- Connection pooling monitoring
- Alertes sur les métriques

**Logging avancé**
```python
import logging
logging.basicConfig()
logging.getLogger('sqlalchemy.engine').setLevel(logging.INFO)
```

**Démonstration pratique (15 min)**
Configurer le monitoring de la base.

**Exercices guidés (10 min)**
1. Activer les logs détaillés
2. Identifier les requêtes lentes
3. Configurer des alertes

**QCM d'auto-évaluation (3 min)**
1. Quel niveau de log pour SQL ?
2. Pourquoi monitorer les connexions ?
3. Comment détecter les problèmes ?

**Devoir**
Implémenter un système de monitoring complet pour l'application.

---

## Cours 27 - Sécurité des données
**Objectifs**
- Protéger contre les injections SQL
- Chiffrer les données sensibles
- Implémenter l'audit des accès

**Leçon (30 min - détaillée)**
La sécurité des données est critique.

**SQLAlchemy et sécurité**
SQLAlchemy prévient automatiquement les injections SQL :
```python
# Sûr : paramètres bindés automatiquement
session.query(User).filter(User.name == user_input).first()
```

**Chiffrement**
Utiliser des extensions pour chiffrer les colonnes sensibles.

**Audit**
Logger tous les accès aux données sensibles.

**Démonstration pratique (15 min)**
Sécuriser l'application contre les attaques courantes.

**Exercices guidés (10 min)**
1. Tester une tentative d'injection
2. Chiffrer un champ sensible
3. Implémenter l'audit

**QCM d'auto-évaluation (3 min)**
1. Comment SQLAlchemy prévient les injections ?
2. Quand chiffrer les données ?
3. Pourquoi l'audit ?

**Devoir**
Implémenter toutes les mesures de sécurité nécessaires pour une application de production.

---

## Cours 28 - Optimisation avancée
**Objectifs**
- Explorer le partitionnement
- Comprendre le sharding
- Optimiser pour la haute disponibilité

**Leçon (30 min - détaillée)**
Pour les applications à très grande échelle.

**Partitionnement**
Diviser les tables en partitions plus petites.

**Sharding**
Distribuer les données sur plusieurs serveurs.

**Réplication**
Synchronisation des données pour la haute disponibilité.

**Démonstration pratique (15 min)**
Implémenter une stratégie de partitionnement simple.

**Exercices guidés (10 min)**
1. Partitionner une table
2. Configurer la réplication
3. Tester la haute disponibilité

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre partitionnement et sharding ?
2. Pourquoi la réplication ?
3. Quand utiliser ces techniques ?

**Devoir**
Concevoir une architecture optimisée pour une application à haute charge.

---

## Cours 29 - Revue et refactoring final
**Objectifs**
- Nettoyer le code
- Optimiser les performances
- Préparer pour la production

**Leçon (30 min - détaillée)**
Revue finale avant la soutenance.

**Checklist de qualité**
- Code bien structuré
- Tests passant
- Performances optimisées
- Sécurité assurée
- Documentation complète

**Refactoring**
- Supprimer le code mort
- Renommer les variables ambiguës
- Optimiser les algorithmes

**Démonstration pratique (15 min)**
Refactoriser le code final.

**Exercices guidés (10 min)**
1. Auditer le code
2. Optimiser les requêtes restantes
3. Nettoyer les imports

**QCM d'auto-évaluation (3 min)**
1. Qu'est-ce que le code mort ?
2. Pourquoi refactorer ?
3. Comment mesurer la qualité ?

**Devoir**
Effectuer un refactoring complet de l'application.

---

## Cours 30 - Soutenance module 3
**Objectifs**
- Présenter l'application finalisée
- Démontrer les compétences acquises
- Répondre aux questions du jury

**Leçon (30 min - détaillée)**
Préparation de la soutenance.

**Contenu de la soutenance**
1. Présentation de l'application
2. Démonstration des fonctionnalités
3. Explication de l'architecture DB
4. Discussion des optimisations
5. Questions/réponses

**Checklist finale**
- [ ] Application fonctionnelle
- [ ] Base de données optimisée
- [ ] Migrations opérationnelles
- [ ] Tests passant
- [ ] Documentation complète
- [ ] Sécurité assurée

**Démonstration pratique (15 min)**
Répétition de la soutenance.

**Exercices guidés (10 min)**
1. Préparer le support de présentation
2. Répéter la démo
3. Anticiper les questions

**QCM d'auto-évaluation (3 min)**
1. Combien de temps pour la démo ?
2. Quels points clés couvrir ?
3. Comment gérer les questions difficiles ?

**Devoir**
Préparer complètement la soutenance du module 3.