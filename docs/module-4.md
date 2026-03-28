# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 4 (30 cours) - API REST et services web : JSON, authentification API, documentation (version enseignant)

### Résumé
Ce module enseignant reprend le contenu du module élève avec les réponses et explications détaillées pour la correction.

Ce module vous immerge dans le monde des APIs REST et des services web modernes. Vous apprendrez à concevoir, développer et documenter des APIs robustes qui permettent à différentes applications de communiquer entre elles. En partant des principes fondamentaux du protocole HTTP et du format JSON, nous explorerons l'architecture REST, l'authentification sécurisée avec JWT, la validation des données, la gestion des erreurs, et les bonnes pratiques de documentation avec OpenAPI/Swagger. Ce module transforme votre application "Tâches" en une API complète et professionnelle, prête à être consommée par des clients web, mobiles ou tiers. Vous maîtriserez également les concepts de versioning d'API, de rate limiting, de caching, et de tests automatisés pour les endpoints.

### Rappel du projet fil rouge (on conserve "Tâches")
Tu vas repartir de la base du Module 3 (avec SQLAlchemy et migrations) et transformer l'application en une API REST complète :
1. Créer des endpoints REST pour toutes les opérations CRUD sur les tâches
2. Implémenter l'authentification API avec JWT (JSON Web Tokens)
3. Ajouter la validation des données d'entrée avec Pydantic ou Marshmallow
4. Documenter l'API avec OpenAPI/Swagger
5. Ajouter des fonctionnalités avancées comme la pagination, le filtrage, et le tri
6. Séparer complètement le backend API du frontend (architecture API-first)

### Hypothèses
- **Python 3.11+** : Pour bénéficier des dernières fonctionnalités async si nécessaire
- **Flask** : Framework déjà maîtrisé, avec Flask-RESTful ou Flask-Smorest pour les APIs
- **SQLAlchemy** : ORM maîtrisé du module précédent
- **JWT** : Bibliothèque PyJWT pour l'authentification
- **OpenAPI/Swagger** : Outils comme Flask-Smorest ou FastAPI pour la documentation
- **Postman/Insomnia** : Outils de test d'API
- **Pydantic** : Pour la validation des données (alternative à Marshmallow)

### Rythme
- **4 cours par semaine** : Rythme soutenu pour maîtriser les concepts d'API
- **30 cours pour ce module** : Environ 7 semaines et demie d'apprentissage intensif
- **Chaque cours dure 1 heure** : Théorie sur les principes REST, démonstration pratique d'implémentation, exercices de création d'endpoints, QCM sur les bonnes pratiques, et devoir de développement d'API

---

## Planning (30 cours)
| Cours | Thème principal | Objectif du cours |
|---:|---|---|
| 1 | Introduction aux APIs REST | Comprendre les principes REST et HTTP |
| 2 | Format JSON et sérialisation | Maîtriser JSON pour les échanges de données |
| 3 | Création d'endpoints de base | Premiers endpoints CRUD avec Flask |
| 4 | Structure d'une API REST | Organisation et conventions REST |
| 5 | Gestion des erreurs HTTP | Codes de statut et messages d'erreur appropriés |
| 6 | Validation des données d'entrée | Pydantic pour valider les requêtes |
| 7 | Authentification de base | Sessions et cookies pour l'authentification web |
| 8 | Introduction à JWT | Concepts des JSON Web Tokens |
| 9 | Implémentation JWT | Authentification API avec tokens |
| 10 | Autorisation et rôles | Contrôle d'accès basé sur les rôles |
| 11 | Endpoints sécurisés | Protection des routes API |
| 12 | Pagination et filtrage | Gestion des gros volumes de données |
| 13 | Tri et recherche | Fonctionnalités avancées de requête |
| 14 | Versioning d'API | Gestion des évolutions d'API |
| 15 | Rate limiting | Protection contre les abus |
| 16 | Caching des réponses | Amélioration des performances |
| 17 | Logging et monitoring | Suivi des appels API |
| 18 | Tests d'API | Tests unitaires et d'intégration |
| 19 | Documentation OpenAPI | Génération automatique de docs |
| 20 | Swagger UI | Interface interactive pour tester l'API |
| 21 | Gestion des CORS | Cross-Origin Resource Sharing |
| 22 | Upload de fichiers | Gestion des fichiers via API |
| 23 | Webhooks et callbacks | Notifications asynchrones |
| 24 | APIs asynchrones | Concepts d'APIs non-bloquantes |
| 25 | Sécurité avancée | Protection contre les attaques courantes |
| 26 | Déploiement d'API | Configuration pour la production |
| 27 | Consommation d'APIs externes | Intégration avec des services tiers |
| 28 | Microservices concepts | Architecture distribuée |
| 29 | Revue et optimisation finale | Nettoyage et performance |
| 30 | Soutenance module 4 | Démo de l'API complète |

---

## Cours 1 - Introduction aux APIs REST
**Objectifs**
- Comprendre ce qu'est une API REST
- Maîtriser les principes du protocole HTTP
- Différencier API REST d'autres types d'APIs

**Leçon (30 min - détaillée)**
Une API REST (Representational State Transfer) est une interface de programmation qui permet à des applications de communiquer via le protocole HTTP en suivant des principes architecturaux spécifiques.

**Principes REST**
- **Stateless** : Chaque requête contient toutes les informations nécessaires
- **Client-Server** : Séparation claire entre client et serveur
- **Cacheable** : Les réponses peuvent être mises en cache
- **Uniform Interface** : Interface uniforme avec des conventions standard
- **Layered System** : Architecture en couches

**Méthodes HTTP**
- **GET** : Récupérer des ressources
- **POST** : Créer de nouvelles ressources
- **PUT** : Mettre à jour des ressources existantes
- **DELETE** : Supprimer des ressources
- **PATCH** : Modifications partielles

**Démonstration pratique (15 min)**
Explorer une API REST publique avec curl ou Postman.

**Exercices guidés (10 min)**
1. Tester différents endpoints d'une API publique
2. Analyser les headers HTTP
3. Comprendre les codes de statut

**QCM d'auto-évaluation (3 min)**
1. Quelle méthode HTTP pour créer une ressource ?
2. Qu'est-ce que le principe stateless ?
3. Quelle différence entre PUT et PATCH ?

**Réponses et explications**
1. POST : crée une ressource. PUT remplace une ressource existante (idempotent), PATCH modifie partiellement.
2. Stateless signifie que le serveur ne conserve pas l’état entre les requêtes, chaque requête doit contenir toutes les informations nécessaires.
3. PUT réécrit complètement la ressource (données complètes), PATCH applique des modifications partielles.

**Devoir**
Analyser l'API GitHub et documenter 5 endpoints différents avec leurs méthodes HTTP.

---

## Cours 2 - Format JSON et sérialisation
**Objectifs**
- Maîtriser la syntaxe JSON
- Comprendre la sérialisation/désérialisation
- Gérer les types de données complexes

**Leçon (30 min - détaillée)**
JSON (JavaScript Object Notation) est le format standard pour l'échange de données dans les APIs REST.

**Structure JSON**
```json
{
  "task": {
    "id": 1,
    "title": "Apprendre Python",
    "completed": false,
    "created_at": "2024-01-15T10:00:00Z",
    "tags": ["python", "apprentissage"]
  }
}
```

**Types de données**
- Chaînes, nombres, booléens
- Objets et tableaux
- null pour les valeurs absentes

**Sérialisation en Python**
```python
import json

# Sérialisation
data = {"name": "Alice", "age": 30}
json_str = json.dumps(data)

# Désérialisation
parsed = json.loads(json_str)
```

**Démonstration pratique (15 min)**
Convertir des objets Python en JSON et vice versa.

**Exercices guidés (10 min)**
1. Créer un objet JSON complexe
2. Sérialiser une liste de tâches
3. Gérer les dates et objets personnalisés

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour sérialiser en JSON ?
2. Comment représenter un tableau en JSON ?
3. Quelle différence entre json.dumps et json.loads ?

**Devoir**
Créer un script Python qui convertit les données de tâches en JSON et les sauvegarde dans un fichier.

---

## Cours 3 - Création d'endpoints de base
**Objectifs**
- Créer les premiers endpoints REST avec Flask
- Implémenter les opérations CRUD de base
- Retourner des réponses JSON appropriées

**Leçon (30 min - détaillée)**
Transformation de l'application Flask existante en API REST.

**Structure d'un endpoint**
```python
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/api/tasks', methods=['GET'])
def get_tasks():
    tasks = Task.query.all()
    return jsonify([task.to_dict() for task in tasks])

@app.route('/api/tasks', methods=['POST'])
def create_task():
    data = request.get_json()
    task = Task(title=data['title'], description=data.get('description'))
    db.session.add(task)
    db.session.commit()
    return jsonify(task.to_dict()), 201
```

**Méthode to_dict()**
```python
class Task(db.Model):
    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'completed': self.completed,
            'created_at': self.created_at.isoformat()
        }
```

**Démonstration pratique (15 min)**
Créer les endpoints GET et POST pour les tâches.

**Exercices guidés (10 min)**
1. Implémenter GET /api/tasks
2. Implémenter POST /api/tasks
3. Tester avec Postman

**QCM d'auto-évaluation (3 min)**
1. Quelle méthode pour retourner JSON ?
2. Quel code HTTP pour la création ?
3. Pourquoi une méthode to_dict() ?

**Devoir**
Implémenter tous les endpoints CRUD de base pour les tâches (GET, POST, PUT, DELETE).

---

## Cours 4 - Structure d'une API REST
**Objectifs**
- Organiser les endpoints selon les conventions REST
- Utiliser les bons codes HTTP
- Structurer les réponses de manière cohérente

**Leçon (30 min - détaillée)**
Une bonne API REST suit des conventions qui la rendent prévisible et facile à utiliser.

**Conventions de nommage**
- **Ressources au pluriel** : `/api/tasks`, `/api/users`
- **Hiérarchie** : `/api/users/1/tasks` (tâches d'un utilisateur)
- **Actions** : `/api/tasks/1/complete` (action sur une ressource)

**Structure des réponses**
```json
{
  "success": true,
  "data": { ... },
  "message": "Tâche créée avec succès",
  "errors": null
}
```

**Codes HTTP courants**
- 200 OK : Succès
- 201 Created : Ressource créée
- 400 Bad Request : Données invalides
- 401 Unauthorized : Non authentifié
- 403 Forbidden : Non autorisé
- 404 Not Found : Ressource inexistante
- 500 Internal Server Error : Erreur serveur

**Démonstration pratique (15 min)**
Refactoriser les endpoints pour suivre les conventions REST.

**Exercices guidés (10 min)**
1. Renommer les routes selon REST
2. Ajouter des messages de succès
3. Utiliser les bons codes HTTP

**QCM d'auto-évaluation (3 min)**
1. Quelle convention pour les noms de ressources ?
2. Quel code pour "non trouvé" ?
3. Pourquoi structurer les réponses ?

**Devoir**
Refactoriser toute l'API pour respecter les conventions REST complètes.

---

## Cours 5 - Gestion des erreurs HTTP
**Objectifs**
- Implémenter une gestion d'erreurs cohérente
- Retourner des messages d'erreur informatifs
- Gérer les exceptions de manière élégante

**Leçon (30 min - détaillée)**
Les erreurs doivent être gérées de manière à aider les développeurs qui consomment l'API.

**Gestion centralisée des erreurs**
```python
from werkzeug.exceptions import HTTPException

@app.errorhandler(HTTPException)
def handle_http_error(e):
    return jsonify({
        "success": False,
        "error": {
            "code": e.code,
            "name": e.name,
            "description": e.description
        }
    }), e.code

@app.errorhandler(404)
def not_found(e):
    return jsonify({
        "success": False,
        "error": "Endpoint non trouvé"
    }), 404
```

**Erreurs personnalisées**
```python
class APIError(Exception):
    def __init__(self, message, status_code=400):
        self.message = message
        self.status_code = status_code

@app.errorhandler(APIError)
def handle_api_error(e):
    return jsonify({
        "success": False,
        "error": e.message
    }), e.status_code
```

**Démonstration pratique (15 min)**
Implémenter la gestion d'erreurs pour l'API.

**Exercices guidés (10 min)**
1. Créer un gestionnaire d'erreurs 404
2. Ajouter des erreurs personnalisées
3. Tester différents scénarios d'erreur

**QCM d'auto-évaluation (3 min)**
1. Quel décorateur pour les erreurs HTTP ?
2. Pourquoi des messages d'erreur détaillés ?
3. Quand utiliser une exception personnalisée ?

**Devoir**
Implémenter une gestion d'erreurs complète pour tous les cas possibles dans l'API.

---

## Cours 6 - Validation des données d'entrée
**Objectifs**
- Valider les données reçues dans les requêtes
- Utiliser Pydantic pour la validation
- Retourner des erreurs de validation claires

**Leçon (30 min - détaillée)**
La validation des données est cruciale pour la sécurité et la robustesse de l'API.

**Pydantic pour la validation**
```python
from pydantic import BaseModel, ValidationError
from typing import Optional

class TaskCreate(BaseModel):
    title: str
    description: Optional[str] = None
    completed: bool = False

class TaskUpdate(BaseModel):
    title: Optional[str] = None
    description: Optional[str] = None
    completed: Optional[bool] = None
```

**Utilisation dans Flask**
```python
@app.route('/api/tasks', methods=['POST'])
def create_task():
    try:
        data = TaskCreate(**request.get_json())
        task = Task(**data.dict())
        db.session.add(task)
        db.session.commit()
        return jsonify(task.to_dict()), 201
    except ValidationError as e:
        return jsonify({
            "success": False,
            "error": "Données invalides",
            "details": e.errors()
        }), 400
```

**Démonstration pratique (15 min)**
Ajouter la validation Pydantic aux endpoints.

**Exercices guidés (10 min)**
1. Définir des modèles Pydantic
2. Valider les données d'entrée
3. Gérer les erreurs de validation

**QCM d'auto-évaluation (3 min)**
1. Quelle classe de base pour Pydantic ?
2. Comment gérer ValidationError ?
3. Pourquoi valider les données ?

**Devoir**
Ajouter la validation Pydantic à tous les endpoints de l'API avec des messages d'erreur détaillés.

---

## Cours 7 - Authentification de base
**Objectifs**
- Comprendre l'authentification web vs API
- Implémenter l'authentification par session
- Gérer la connexion/déconnexion

**Leçon (30 min - détaillée)**
L'authentification pour les APIs diffère de celle des applications web classiques.

**Authentification par session (pour web)**
```python
from flask import session, flash, redirect

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    
    user = User.query.filter_by(username=username).first()
    if user and check_password_hash(user.password, password):
        session['user_id'] = user.id
        return redirect('/dashboard')
    
    flash('Identifiants invalides')
    return redirect('/login')
```

**Vérification d'authentification**
```python
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect('/login')
        return f(*args, **kwargs)
    return decorated_function
```

**Démonstration pratique (15 min)**
Implémenter l'authentification par session.

**Exercices guidés (10 min)**
1. Créer le formulaire de login
2. Implémenter la vérification des credentials
3. Protéger une route avec login_required

**QCM d'auto-évaluation (3 min)**
1. Quel objet pour les sessions Flask ?
2. Comment vérifier si l'utilisateur est connecté ?
3. Quelle différence avec l'authentification API ?

**Devoir**
Implémenter l'authentification complète par session pour l'application web.

---

## Cours 8 - Introduction à JWT
**Objectifs**
- Comprendre le concept des JSON Web Tokens
- Découvrir la structure d'un JWT
- Différencier JWT des sessions

**Leçon (30 min - détaillée)**
Les JWT sont parfaits pour l'authentification d'APIs stateless.

**Structure d'un JWT**
Un JWT se compose de trois parties séparées par des points :
- **Header** : Type de token et algorithme
- **Payload** : Données (claims)
- **Signature** : Vérification d'intégrité

**Exemple de JWT**
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

**Claims courants**
- `sub` : Subject (identifiant utilisateur)
- `iat` : Issued at (date d'émission)
- `exp` : Expiration (date d'expiration)
- `iss` : Issuer (émetteur)

**Avantages des JWT**
- Stateless : Pas de stockage côté serveur
- Portable : Peut être utilisé par différents services
- Sécurisé : Signature empêche la falsification

**Démonstration pratique (15 min)**
Créer et décoder un JWT simple.

**Exercices guidés (10 min)**
1. Installer PyJWT
2. Créer un token simple
3. Décoder et vérifier un token

**QCM d'auto-évaluation (3 min)**
1. Combien de parties dans un JWT ?
2. Quel claim pour l'expiration ?
3. Pourquoi JWT pour les APIs ?

**Devoir**
Créer un script qui génère et valide des JWT avec différents claims.

---

## Cours 9 - Implémentation JWT
**Objectifs**
- Implémenter l'authentification JWT dans Flask
- Créer les endpoints de login/logout
- Protéger les routes avec JWT

**Leçon (30 min - détaillée)**
Intégration complète de JWT dans l'API Flask.

**Configuration JWT**
```python
import jwt
from datetime import datetime, timedelta

SECRET_KEY = "votre-cle-secrete"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30
```

**Génération de token**
```python
def create_access_token(data: dict):
    to_encode = data.copy()
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt
```

**Endpoint de login**
```python
@app.route('/api/auth/login', methods=['POST'])
def login():
    data = request.get_json()
    user = User.query.filter_by(username=data['username']).first()
    
    if user and check_password_hash(user.password, data['password']):
        token = create_access_token({"sub": str(user.id)})
        return jsonify({"access_token": token, "token_type": "bearer"})
    
    return jsonify({"error": "Identifiants invalides"}), 401
```

**Démonstration pratique (15 min)**
Implémenter l'authentification JWT complète.

**Exercices guidés (10 min)**
1. Créer la fonction de génération de token
2. Implémenter l'endpoint de login
3. Tester l'authentification avec Postman

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour créer un JWT ?
2. Quel header pour envoyer le token ?
3. Comment gérer l'expiration ?

**Devoir**
Implémenter l'authentification JWT complète avec login et gestion des erreurs.

---

## Cours 10 - Autorisation et rôles
**Objectifs**
- Implémenter un système de rôles
- Contrôler l'accès basé sur les permissions
- Gérer les autorisations granulaires

**Leçon (30 min - détaillée)**
L'autorisation détermine ce que l'utilisateur peut faire une fois authentifié.

**Modèle de rôles**
```python
class Role(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True)  # admin, user, moderator

class User(db.Model):
    roles = db.relationship('Role', secondary=user_roles)
```

**Décorateur d'autorisation**
```python
from functools import wraps

def requires_role(role_name):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            token = get_token_from_request()
            payload = decode_token(token)
            user_id = payload['sub']
            user = User.query.get(user_id)
            
            if not user or not user.has_role(role_name):
                return jsonify({"error": "Accès refusé"}), 403
            
            return f(*args, **kwargs)
        return decorated_function
    return decorator
```

**Utilisation**
```python
@app.route('/api/admin/users', methods=['GET'])
@requires_role('admin')
def get_all_users():
    # Seulement pour les admins
    pass
```

**Démonstration pratique (15 min)**
Implémenter un système de rôles simple.

**Exercices guidés (10 min)**
1. Créer le modèle Role
2. Implémenter le décorateur requires_role
3. Tester l'autorisation

**QCM d'auto-évaluation (3 min)**
1. Quelle différence entre authentification et autorisation ?
2. Comment vérifier les rôles ?
3. Pourquoi des rôles granulaires ?

**Devoir**
Implémenter un système d'autorisation avec au moins deux rôles (user et admin).

---

## Cours 11 - Endpoints sécurisés
**Objectifs**
- Protéger tous les endpoints sensibles
- Implémenter le middleware d'authentification
- Gérer le refresh des tokens

**Leçon (30 min - détaillée)**
Tous les endpoints qui manipulent des données doivent être sécurisés.

**Middleware d'authentification**
```python
def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None
        
        if 'Authorization' in request.headers:
            auth_header = request.headers['Authorization']
            if auth_header.startswith('Bearer '):
                token = auth_header.split(' ')[1]
        
        if not token:
            return jsonify({"error": "Token manquant"}), 401
        
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            current_user = User.query.get(payload['sub'])
            if not current_user:
                raise ValueError("Utilisateur non trouvé")
        except jwt.ExpiredSignatureError:
            return jsonify({"error": "Token expiré"}), 401
        except Exception as e:
            return jsonify({"error": "Token invalide"}), 401
        
        return f(current_user, *args, **kwargs)
    return decorated
```

**Utilisation**
```python
@app.route('/api/tasks', methods=['POST'])
@token_required
def create_task(current_user):
    # current_user est disponible ici
    data = TaskCreate(**request.get_json())
    task = Task(user_id=current_user.id, **data.dict())
    # ...
```

**Démonstration pratique (15 min)**
Sécuriser tous les endpoints CRUD.

**Exercices guidés (10 min)**
1. Créer le décorateur token_required
2. Protéger les endpoints
3. Tester avec et sans token

**QCM d'auto-évaluation (3 min)**
1. Quel header pour le token ?
2. Comment extraire le token ?
3. Que faire si le token est expiré ?

**Devoir**
Sécuriser complètement l'API avec authentification JWT sur tous les endpoints appropriés.

---

## Cours 12 - Pagination et filtrage
**Objectifs**
- Implémenter la pagination pour les gros volumes
- Ajouter des filtres de recherche
- Optimiser les requêtes

**Leçon (30 min - détaillée)**
Pour gérer efficacement de gros volumes de données.

**Pagination simple**
```python
@app.route('/api/tasks')
@token_required
def get_tasks(current_user):
    page = request.args.get('page', 1, type=int)
    per_page = request.args.get('per_page', 10, type=int)
    
    query = Task.query.filter_by(user_id=current_user.id)
    tasks = query.paginate(page=page, per_page=per_page, error_out=False)
    
    return jsonify({
        "tasks": [task.to_dict() for task in tasks.items],
        "pagination": {
            "page": tasks.page,
            "per_page": tasks.per_page,
            "total": tasks.total,
            "pages": tasks.pages
        }
    })
```

**Filtres avancés**
```python
@app.route('/api/tasks')
@token_required
def get_tasks(current_user):
    query = Task.query.filter_by(user_id=current_user.id)
    
    # Filtres
    completed = request.args.get('completed', type=bool)
    if completed is not None:
        query = query.filter_by(completed=completed)
    
    search = request.args.get('search')
    if search:
        query = query.filter(Task.title.contains(search))
    
    # Tri
    sort_by = request.args.get('sort_by', 'created_at')
    sort_order = request.args.get('sort_order', 'desc')
    if sort_order == 'desc':
        query = query.order_by(getattr(Task, sort_by).desc())
    else:
        query = query.order_by(getattr(Task, sort_by).asc())
    
    # Pagination
    page = request.args.get('page', 1, type=int)
    per_page = request.args.get('per_page', 10, type=int)
    tasks = query.paginate(page=page, per_page=per_page, error_out=False)
    
    return jsonify({
        "tasks": [task.to_dict() for task in tasks.items],
        "pagination": {
            "page": tasks.page,
            "per_page": tasks.per_page,
            "total": tasks.total,
            "pages": tasks.pages
        }
    })
```

**Démonstration pratique (15 min)**
Ajouter pagination et filtres à l'endpoint des tâches.

**Exercices guidés (10 min)**
1. Implémenter la pagination
2. Ajouter des filtres de recherche
3. Tester avec différents paramètres

**QCM d'auto-évaluation (3 min)**
1. Quel paramètre pour la page ?
2. Comment filtrer par statut ?
3. Pourquoi la pagination ?

**Devoir**
Implémenter pagination et filtrage complets sur l'endpoint GET /api/tasks.

---

## Cours 13 - Tri et recherche
**Objectifs**
- Implémenter le tri dynamique
- Ajouter la recherche full-text
- Optimiser les requêtes de recherche

**Leçon (30 min - détaillée)**
Améliorer l'expérience utilisateur avec des fonctionnalités de recherche avancées.

**Tri dynamique**
```python
def apply_sorting(query, model_class):
    sort_by = request.args.get('sort_by', 'created_at')
    sort_order = request.args.get('sort_order', 'desc')
    
    if hasattr(model_class, sort_by):
        column = getattr(model_class, sort_by)
        if sort_order == 'desc':
            query = query.order_by(column.desc())
        else:
            query = query.order_by(column.asc())
    
    return query
```

**Recherche full-text**
```python
def apply_search(query, model_class, search_fields):
    search_term = request.args.get('q')
    if search_term:
        search_filters = []
        for field in search_fields:
            if hasattr(model_class, field):
                column = getattr(model_class, field)
                search_filters.append(column.contains(search_term))
        
        if search_filters:
            query = query.filter(or_(*search_filters))
    
    return query
```

**Utilisation combinée**
```python
@app.route('/api/tasks')
@token_required
def get_tasks(current_user):
    query = Task.query.filter_by(user_id=current_user.id)
    
    # Appliquer filtres, recherche, tri
    query = apply_filters(query, Task)
    query = apply_search(query, Task, ['title', 'description'])
    query = apply_sorting(query, Task)
    
    # Pagination
    tasks = query.paginate(...)
```

**Démonstration pratique (15 min)**
Implémenter tri et recherche avancés.

**Exercices guidés (10 min)**
1. Ajouter le tri par différents champs
2. Implémenter la recherche full-text
3. Combiner avec les filtres existants

**QCM d'auto-évaluation (3 min)**
1. Comment trier par date décroissante ?
2. Quelle méthode pour la recherche ?
3. Comment combiner filtres et recherche ?

**Devoir**
Ajouter tri et recherche complets à l'API avec optimisation des performances.

---

## Cours 14 - Versioning d'API
**Objectifs**
- Comprendre l'importance du versioning
- Implémenter différentes stratégies de versioning
- Gérer les changements rétrocompatibles

**Leçon (30 min - détaillée)**
Le versioning permet d'évoluer l'API sans casser les clients existants.

**Stratégies de versioning**
1. **URI Versioning** : `/api/v1/tasks`, `/api/v2/tasks`
2. **Header Versioning** : `Accept: application/vnd.api.v1+json`
3. **Query Parameter** : `/api/tasks?version=1`
4. **Content Negotiation** : Via Accept header

**Implémentation URI**
```python
# Version 1
@app.route('/api/v1/tasks')
def get_tasks_v1():
    # Logique V1
    pass

# Version 2 avec nouvelles fonctionnalités
@app.route('/api/v2/tasks')
def get_tasks_v2():
    # Logique V2 avec filtres avancés
    pass
```

**Blueprint pour l'organisation**
```python
from flask import Blueprint

api_v1 = Blueprint('api_v1', __name__, url_prefix='/api/v1')
api_v2 = Blueprint('api_v2', __name__, url_prefix='/api/v2')

@api_v1.route('/tasks')
def get_tasks():
    # V1
    pass

@api_v2.route('/tasks')
def get_tasks():
    # V2
    pass
```

**Démonstration pratique (15 min)**
Créer deux versions de l'API.

**Exercices guidés (10 min)**
1. Créer des blueprints pour le versioning
2. Implémenter une V1 et V2
3. Tester la compatibilité

**QCM d'auto-évaluation (3 min)**
1. Quelle stratégie de versioning recommandée ?
2. Pourquoi utiliser des blueprints ?
3. Comment gérer les changements breaking ?

**Devoir**
Implémenter le versioning de l'API avec au moins deux versions.

---

## Cours 15 - Rate limiting
**Objectifs**
- Protéger l'API contre les abus
- Implémenter la limitation de débit
- Configurer différents niveaux de limitation

**Leçon (30 min - détaillée)**
Le rate limiting empêche les abus et protège les ressources serveur.

**Flask-Limiter**
```python
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

limiter = Limiter(
    app=app,
    key_func=get_remote_address,
    default_limits=["200 per day", "50 per hour"]
)
```

**Limitation par endpoint**
```python
@app.route('/api/tasks')
@limiter.limit("100 per minute")
def get_tasks():
    # Limité à 100 requêtes par minute
    pass

@app.route('/api/auth/login')
@limiter.limit("5 per minute")
def login():
    # Limité à 5 tentatives de login par minute
    pass
```

**Limitation par utilisateur**
```python
def get_user_id():
    token = get_token_from_request()
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            return payload['sub']
        except:
            pass
    return get_remote_address()

limiter = Limiter(
    app=app,
    key_func=get_user_id,
    default_limits=["1000 per day"]
)
```

**Démonstration pratique (15 min)**
Configurer le rate limiting.

**Exercices guidés (10 min)**
1. Installer Flask-Limiter
2. Configurer les limites globales
3. Tester la limitation

**QCM d'auto-évaluation (3 min)**
1. Pourquoi limiter le débit ?
2. Quelle limite pour le login ?
3. Comment différencier par utilisateur ?

**Devoir**
Implémenter le rate limiting complet sur tous les endpoints.

---

## Cours 16 - Caching des réponses
**Objectifs**
- Implémenter le caching pour améliorer les performances
- Utiliser Redis ou cache en mémoire
- Gérer l'invalidation du cache

**Leçon (30 min - détaillée)**
Le caching réduit la charge sur la base de données et améliore les temps de réponse.

**Flask-Caching**
```python
from flask_caching import Cache

cache = Cache(app, config={
    'CACHE_TYPE': 'redis',
    'CACHE_REDIS_URL': 'redis://localhost:6379/0'
})
```

**Caching des réponses**
```python
@app.route('/api/tasks')
@cache.cached(timeout=300, key_prefix='tasks_list')
@token_required
def get_tasks(current_user):
    # Cache pour 5 minutes
    tasks = Task.query.filter_by(user_id=current_user.id).all()
    return jsonify([task.to_dict() for task in tasks])
```

**Invalidation du cache**
```python
@app.route('/api/tasks', methods=['POST'])
@token_required
def create_task(current_user):
    # Créer la tâche
    task = Task(user_id=current_user.id, **data.dict())
    db.session.add(task)
    db.session.commit()
    
    # Invalider le cache
    cache.delete('tasks_list')
    
    return jsonify(task.to_dict()), 201
```

**Cache conditionnel**
```python
@app.route('/api/tasks/<int:task_id>')
@cache.cached(timeout=600, unless=lambda: request.method != 'GET')
def get_task(task_id):
    # Cache seulement pour GET
    pass
```

**Démonstration pratique (15 min)**
Ajouter le caching à l'API.

**Exercices guidés (10 min)**
1. Configurer Flask-Caching
2. Cacher les endpoints GET
3. Implémenter l'invalidation

**QCM d'auto-évaluation (3 min)**
1. Quel timeout par défaut ?
2. Quand invalider le cache ?
3. Quelle différence avec le cache HTTP ?

**Devoir**
Implémenter le caching complet avec invalidation appropriée.

---

## Cours 17 - Logging et monitoring
**Objectifs**
- Implémenter un logging structuré
- Monitorer les appels API
- Détecter les problèmes de performance

**Leçon (30 min - détaillée)**
Le logging et le monitoring sont essentiels pour maintenir une API en production.

**Configuration du logging**
```python
import logging
from logging.handlers import RotatingFileHandler

# Configuration
logging.basicConfig(level=logging.INFO)
handler = RotatingFileHandler('api.log', maxBytes=10000000, backupCount=5)
handler.setFormatter(logging.Formatter(
    '%(asctime)s %(levelname)s: %(message)s [in %(pathname)s:%(lineno)d]'
))
app.logger.addHandler(handler)
```

**Logging des requêtes**
```python
@app.before_request
def log_request_info():
    app.logger.info(f'{request.method} {request.url} - {request.remote_addr}')

@app.after_request
def log_response_info(response):
    app.logger.info(f'Response: {response.status_code}')
    return response
```

**Logging métier**
```python
@app.route('/api/tasks', methods=['POST'])
@token_required
def create_task(current_user):
    try:
        data = TaskCreate(**request.get_json())
        task = Task(user_id=current_user.id, **data.dict())
        db.session.add(task)
        db.session.commit()
        
        app.logger.info(f'Task created: {task.id} by user {current_user.id}')
        return jsonify(task.to_dict()), 201
        
    except Exception as e:
        app.logger.error(f'Error creating task: {str(e)}')
        return jsonify({"error": "Erreur interne"}), 500
```

**Démonstration pratique (15 min)**
Configurer le logging complet.

**Exercices guidés (10 min)**
1. Configurer le logging
2. Logger les requêtes
3. Ajouter le logging métier

**QCM d'auto-évaluation (3 min)**
1. Quel niveau pour les erreurs ?
2. Pourquoi logger les requêtes ?
3. Comment gérer la rotation des logs ?

**Devoir**
Implémenter un système de logging complet pour l'API.

---

## Cours 18 - Tests d'API
**Objectifs**
- Écrire des tests unitaires pour les endpoints
- Tester l'authentification et l'autorisation
- Automatiser les tests avec pytest

**Leçon (30 min - détaillée)**
Les tests garantissent la fiabilité de l'API.

**Configuration des tests**
```python
import pytest
from app import create_app, db
from flask_jwt_extended import create_access_token

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

@pytest.fixture
def auth_headers(app):
    with app.app_context():
        # Créer un utilisateur de test
        user = User(username='test', email='test@test.com')
        user.set_password('password')
        db.session.add(user)
        db.session.commit()
        
        # Créer un token
        token = create_access_token(identity=user.id)
        return {'Authorization': f'Bearer {token}'}
```

**Test d'un endpoint**
```python
def test_get_tasks(client, auth_headers):
    response = client.get('/api/tasks', headers=auth_headers)
    assert response.status_code == 200
    data = response.get_json()
    assert 'tasks' in data

def test_create_task(client, auth_headers):
    task_data = {'title': 'Test task', 'description': 'Test description'}
    response = client.post('/api/tasks', 
                          json=task_data, 
                          headers=auth_headers)
    assert response.status_code == 201
    data = response.get_json()
    assert data['title'] == 'Test task'

def test_unauthorized_access(client):
    response = client.get('/api/tasks')
    assert response.status_code == 401
```

**Démonstration pratique (15 min)**
Écrire des tests pour l'API.

**Exercices guidés (10 min)**
1. Configurer pytest
2. Écrire des tests d'authentification
3. Tester les endpoints CRUD

**QCM d'auto-évaluation (3 min)**
1. Quel fixture pour le client de test ?
2. Comment tester l'authentification ?
3. Pourquoi tester les erreurs ?

**Devoir**
Écrire une suite de tests complète pour l'API avec couverture des cas d'erreur.

---

## Cours 19 - Documentation OpenAPI
**Objectifs**
- Générer une documentation automatique
- Décrire les endpoints avec OpenAPI
- Créer des schémas pour les données

**Leçon (30 min - détaillée)**
OpenAPI permet de documenter l'API de manière standardisée.

**Flask-Smorest pour OpenAPI**
```python
from flask_smorest import Api, Blueprint
from flask_smorest.fields import Str, Bool, DateTime

app = Flask(__name__)
app.config['API_TITLE'] = 'Tasks API'
app.config['API_VERSION'] = 'v1'
app.config['OPENAPI_VERSION'] = '3.0.2'

api = Api(app)
tasks_bp = Blueprint('tasks', 'tasks', url_prefix='/api/tasks')
api.register_blueprint(tasks_bp)
```

**Schéma de données**
```python
from marshmallow import Schema, fields

class TaskSchema(Schema):
    id = fields.Int(dump_only=True)
    title = fields.Str(required=True, validate=fields.Length(min=1, max=100))
    description = fields.Str()
    completed = fields.Bool(default=False)
    created_at = fields.DateTime(dump_only=True)
    user_id = fields.Int(dump_only=True)
```

**Endpoint documenté**
```python
@tasks_bp.route('/')
class Tasks(MethodView):
    @tasks_bp.response(200, TaskSchema(many=True))
    @tasks_bp.paginate()
    @token_required
    def get(self):
        """Get all tasks"""
        query = Task.query.filter_by(user_id=current_user.id)
        return query

    @tasks_bp.arguments(TaskSchema)
    @tasks_bp.response(201, TaskSchema)
    @token_required
    def post(self, task_data):
        """Create a new task"""
        task = Task(user_id=current_user.id, **task_data)
        db.session.add(task)
        db.session.commit()
        return task
```

**Démonstration pratique (15 min)**
Configurer Flask-Smorest et documenter un endpoint.

**Exercices guidés (10 min)**
1. Installer Flask-Smorest
2. Créer des schémas
3. Documenter les endpoints

**QCM d'auto-évaluation (3 min)**
1. Quel package pour OpenAPI ?
2. Pourquoi des schémas ?
3. Comment documenter les réponses ?

**Devoir**
Générer la documentation OpenAPI complète pour l'API.

---

## Cours 20 - Swagger UI
**Objectifs**
- Activer l'interface Swagger UI
- Tester l'API directement depuis le navigateur
- Générer des exemples de requêtes

**Leçon (30 min - détaillée)**
Swagger UI fournit une interface web pour explorer et tester l'API.

**Configuration Swagger UI**
```python
from flask_smorest import Api

app.config['API_TITLE'] = 'Tasks API'
app.config['API_VERSION'] = 'v1'
app.config['OPENAPI_VERSION'] = '3.0.2'
app.config['OPENAPI_URL_PREFIX'] = '/docs'
app.config['OPENAPI_SWAGGER_UI_PATH'] = '/swagger-ui'
app.config['OPENAPI_SWAGGER_UI_URL'] = 'https://cdn.jsdelivr.net/npm/swagger-ui-dist/'

api = Api(app)
```

**Accès à la documentation**
- **Spécification OpenAPI** : `/docs/openapi.json`
- **Interface Swagger UI** : `/docs/swagger-ui`

**Authentification dans Swagger**
Pour tester les endpoints sécurisés, il faut configurer l'authentification :

```python
app.config['OPENAPI_SWAGGER_UI_CONFIG'] = {
    'presets': [
        'SwaggerUIBundle.presets.apis',
        'SwaggerUIBundle.SwaggerUIStandalonePreset'
    ],
    'layout': 'StandaloneLayout'
}
```

**Démonstration pratique (15 min)**
Activer Swagger UI et tester l'API.

**Exercices guidés (10 min)**
1. Configurer Swagger UI
2. Accéder à la documentation
3. Tester un endpoint authentifié

**QCM d'auto-évaluation (3 min)**
1. Quel URL pour Swagger UI ?
2. Comment tester les endpoints sécurisés ?
3. Pourquoi une interface web ?

**Devoir**
Configurer Swagger UI complet avec authentification fonctionnelle.

---

## Cours 21 - Gestion des CORS
**Objectifs**
- Comprendre les problèmes CORS
- Configurer Flask-CORS
- Gérer les requêtes cross-origin

**Leçon (30 min - détaillée)**
CORS (Cross-Origin Resource Sharing) contrôle l'accès aux ressources depuis d'autres domaines.

**Configuration CORS**
```python
from flask_cors import CORS

# CORS pour toute l'application
CORS(app)

# Ou configuration spécifique
CORS(app, resources={
    r"/api/*": {
        "origins": ["http://localhost:3000", "https://myapp.com"],
        "methods": ["GET", "POST", "PUT", "DELETE"],
        "allow_headers": ["Content-Type", "Authorization"]
    }
})
```

**Headers CORS**
- `Access-Control-Allow-Origin` : Origines autorisées
- `Access-Control-Allow-Methods` : Méthodes HTTP autorisées
- `Access-Control-Allow-Headers` : Headers autorisés
- `Access-Control-Allow-Credentials` : Autoriser les credentials

**Préflight requests**
Pour les requêtes complexes (avec headers personnalisés), le navigateur envoie une requête OPTIONS préliminaire.

**Démonstration pratique (15 min)**
Configurer CORS pour l'API.

**Exercices guidés (10 min)**
1. Installer Flask-CORS
2. Configurer les origines autorisées
3. Tester avec un frontend

**QCM d'auto-évaluation (3 min)**
1. Quel header pour les origines ?
2. Pourquoi les preflight requests ?
3. Quand configurer CORS ?

**Devoir**
Configurer CORS correctement pour permettre l'accès depuis un frontend.

---

## Cours 22 - Upload de fichiers
**Objectifs**
- Gérer l'upload de fichiers via API
- Sauvegarder les fichiers de manière sécurisée
- Retourner les URLs des fichiers

**Leçon (30 min - détaillée)**
L'upload de fichiers nécessite une gestion spéciale dans les APIs REST.

**Configuration de l'upload**
```python
import os
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = 'uploads/'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif', 'pdf'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16MB max

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
```

**Endpoint d'upload**
```python
@app.route('/api/upload', methods=['POST'])
@token_required
def upload_file(current_user):
    if 'file' not in request.files:
        return jsonify({"error": "Aucun fichier"}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "Nom de fichier vide"}), 400
    
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        # Ajouter l'ID utilisateur pour éviter les conflits
        unique_filename = f"{current_user.id}_{filename}"
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
        file.save(file_path)
        
        # Sauvegarder en base
        attachment = Attachment(
            filename=filename,
            path=file_path,
            user_id=current_user.id
        )
        db.session.add(attachment)
        db.session.commit()
        
        return jsonify({
            "message": "Fichier uploadé",
            "file_id": attachment.id,
            "url": f"/uploads/{unique_filename}"
        }), 201
    
    return jsonify({"error": "Type de fichier non autorisé"}), 400
```

**Démonstration pratique (15 min)**
Implémenter l'upload de fichiers.

**Exercices guidés (10 min)**
1. Configurer le dossier d'upload
2. Créer l'endpoint d'upload
3. Tester avec différents types de fichiers

**QCM d'auto-évaluation (3 min)**
1. Pourquoi secure_filename ?
2. Quelle taille max par défaut ?
3. Comment éviter les conflits de noms ?

**Devoir**
Implémenter l'upload de fichiers complet avec validation et stockage sécurisé.

---

## Cours 23 - Webhooks et callbacks
**Objectifs**
- Implémenter des webhooks pour les notifications
- Gérer les callbacks asynchrones
- Sécuriser les communications webhook

**Leçon (30 min - détaillée)**
Les webhooks permettent de notifier d'autres services des événements.

**Modèle de webhook**
```python
class Webhook(db.Model):
    url = db.Column(db.String(500), nullable=False)
    secret = db.Column(db.String(100), nullable=False)  # Pour la signature
    events = db.Column(db.JSON)  # Liste des événements à écouter
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
```

**Envoi de webhook**
```python
import requests
import hmac
import hashlib

def send_webhook(webhook, event_type, data):
    payload = {
        "event": event_type,
        "timestamp": datetime.utcnow().isoformat(),
        "data": data
    }
    
    # Signature pour la sécurité
    signature = hmac.new(
        webhook.secret.encode(),
        json.dumps(payload, sort_keys=True).encode(),
        hashlib.sha256
    ).hexdigest()
    
    headers = {
        "Content-Type": "application/json",
        "X-Webhook-Signature": signature
    }
    
    try:
        response = requests.post(webhook.url, 
                               json=payload, 
                               headers=headers,
                               timeout=5)
        return response.status_code == 200
    except:
        return False
```

**Déclenchement des webhooks**
```python
@app.route('/api/tasks', methods=['POST'])
@token_required
def create_task(current_user):
    # Créer la tâche
    task = Task(user_id=current_user.id, **data.dict())
    db.session.add(task)
    db.session.commit()
    
    # Notifier les webhooks
    webhooks = Webhook.query.filter(
        Webhook.user_id == current_user.id,
        Webhook.events.contains(['task.created'])
    ).all()
    
    for webhook in webhooks:
        send_webhook(webhook, 'task.created', task.to_dict())
    
    return jsonify(task.to_dict()), 201
```

**Démonstration pratique (15 min)**
Implémenter un système de webhooks simple.

**Exercices guidés (10 min)**
1. Créer le modèle Webhook
2. Implémenter la fonction send_webhook
3. Déclencher les webhooks lors d'événements

**QCM d'auto-évaluation (3 min)**
1. Pourquoi signer les webhooks ?
2. Quel timeout recommandé ?
3. Comment filtrer les événements ?

**Devoir**
Implémenter un système de webhooks complet pour les tâches.

---

## Cours 24 - APIs asynchrones
**Objectifs**
- Comprendre les APIs non-bloquantes
- Implémenter des tâches en arrière-plan
- Gérer les réponses asynchrones

**Leçon (30 min - détaillée)**
Pour les opérations longues, il vaut mieux les traiter de manière asynchrone.

**Celery pour les tâches asynchrones**
```python
from celery import Celery

app.config['CELERY_BROKER_URL'] = 'redis://localhost:6379/0'
app.config['CELERY_RESULT_BACKEND'] = 'redis://localhost:6379/0'

celery = Celery(app.name, broker=app.config['CELERY_BROKER_URL'])
celery.conf.update(app.config)
```

**Tâche asynchrone**
```python
@celery.task
def process_heavy_task(task_id):
    # Simulation d'un traitement lourd
    time.sleep(10)
    
    task = Task.query.get(task_id)
    task.status = 'processed'
    db.session.commit()
    
    return {"status": "completed", "task_id": task_id}
```

**Endpoint asynchrone**
```python
@app.route('/api/tasks/<int:task_id>/process', methods=['POST'])
@token_required
def process_task(task_id):
    # Vérifier que la tâche appartient à l'utilisateur
    task = Task.query.filter_by(id=task_id, user_id=current_user.id).first()
    if not task:
        return jsonify({"error": "Tâche non trouvée"}), 404
    
    # Lancer la tâche en arrière-plan
    result = process_heavy_task.delay(task_id)
    
    return jsonify({
        "message": "Traitement lancé",
        "task_id": task_id,
        "job_id": result.id
    }), 202
```

**Vérification du statut**
```python
@app.route('/api/jobs/<job_id>', methods=['GET'])
@token_required
def get_job_status(job_id):
    result = process_heavy_task.AsyncResult(job_id)
    
    if result.state == 'PENDING':
        response = {"status": "pending"}
    elif result.state == 'PROGRESS':
        response = {"status": "progress", "progress": result.info}
    elif result.state == 'SUCCESS':
        response = {"status": "completed", "result": result.info}
    else:
        response = {"status": "failed", "error": str(result.info)}
    
    return jsonify(response)
```

**Démonstration pratique (15 min)**
Configurer Celery et créer une tâche asynchrone.

**Exercices guidés (10 min)**
1. Installer Celery
2. Créer une tâche asynchrone
3. Implémenter les endpoints de vérification

**QCM d'auto-évaluation (3 min)**
1. Quel broker pour Celery ?
2. Quel code HTTP pour "accepté" ?
3. Comment vérifier le statut d'une tâche ?

**Devoir**
Implémenter une fonctionnalité asynchrone (par exemple, export de données).

---

## Cours 25 - Sécurité avancée
**Objectifs**
- Protéger contre les attaques courantes
- Implémenter HTTPS
- Gérer les secrets de manière sécurisée

**Leçon (30 min - détaillée)**
La sécurité est critique pour les APIs exposées sur Internet.

**Helmet pour les headers de sécurité**
```python
from flask_talisman import Talisman

Talisman(app, content_security_policy=None)
```

**Protection contre les attaques**
- **SQL Injection** : Utiliser SQLAlchemy (déjà protégé)
- **XSS** : Valider et échapper les entrées
- **CSRF** : Utiliser JWT au lieu des sessions
- **Rate Limiting** : Déjà implémenté
- **Input Validation** : Pydantic

**Gestion des secrets**
```python
import os

SECRET_KEY = os.environ.get('SECRET_KEY')
JWT_SECRET = os.environ.get('JWT_SECRET')
DATABASE_URL = os.environ.get('DATABASE_URL')
```

**HTTPS obligatoire**
```python
@app.before_request
def require_https():
    if not request.is_secure and app.env == 'production':
        url = request.url.replace('http://', 'https://', 1)
        return redirect(url, code=301)
```

**Démonstration pratique (15 min)**
Renforcer la sécurité de l'API.

**Exercices guidés (10 min)**
1. Configurer les variables d'environnement
2. Ajouter les headers de sécurité
3. Tester HTTPS

**QCM d'auto-évaluation (3 min)**
1. Pourquoi HTTPS obligatoire ?
2. Comment gérer les secrets ?
3. Quelle protection contre XSS ?

**Devoir**
Implémenter toutes les mesures de sécurité avancées.

---

## Cours 26 - Déploiement d'API
**Objectifs**
- Préparer l'API pour la production
- Configurer un serveur WSGI
- Déployer avec Docker

**Leçon (30 min - détaillée)**
Le déploiement d'une API nécessite des considérations spécifiques.

**Gunicorn pour la production**
```python
# wsgi.py
from app import app

if __name__ == "__main__":
    app.run()
```

**Lancement avec Gunicorn**
```bash
gunicorn --bind 0.0.0.0:8000 wsgi:app
```

**Docker pour l'API**
```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "wsgi:app"]
```

**Variables d'environnement**
```bash
export FLASK_ENV=production
export SECRET_KEY=your-secret-key
export DATABASE_URL=postgresql://...
```

**Démonstration pratique (15 min)**
Préparer l'API pour le déploiement.

**Exercices guidés (10 min)**
1. Configurer Gunicorn
2. Créer le Dockerfile
3. Tester en local

**QCM d'auto-évaluation (3 min)**
1. Quel serveur WSGI ?
2. Pourquoi Docker ?
3. Comment gérer les secrets en prod ?

**Devoir**
Préparer complètement l'API pour le déploiement en production.

---

## Cours 27 - Consommation d'APIs externes
**Objectifs**
- Intégrer des APIs tierces
- Gérer l'authentification externe
- Traiter les erreurs d'APIs externes

**Leçon (30 min - détaillée)**
Les applications modernes s'intègrent souvent avec des services externes.

**Exemple d'intégration**
```python
import requests

def get_weather(city):
    api_key = os.environ.get('WEATHER_API_KEY')
    url = f"http://api.weatherapi.com/v1/current.json?key={api_key}&q={city}"
    
    try:
        response = requests.get(url, timeout=5)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        app.logger.error(f"Erreur API météo: {e}")
        return None
```

**Endpoint utilisant l'API externe**
```python
@app.route('/api/weather/<city>', methods=['GET'])
@token_required
def get_city_weather(current_user):
    weather_data = get_weather(city)
    if weather_data:
        return jsonify(weather_data)
    else:
        return jsonify({"error": "Impossible de récupérer la météo"}), 503
```

**Cache des appels externes**
```python
@cache.memoize(timeout=1800)  # Cache 30 minutes
def get_weather(city):
    # Même fonction, mais cachée
    pass
```

**Démonstration pratique (15 min)**
Intégrer une API externe simple.

**Exercices guidés (10 min)**
1. Choisir une API publique
2. Implémenter l'intégration
3. Ajouter la gestion d'erreurs

**QCM d'auto-évaluation (3 min)**
1. Pourquoi timeout sur les requêtes ?
2. Quand utiliser le cache ?
3. Comment gérer les erreurs externes ?

**Devoir**
Intégrer au moins une API externe dans l'application.

---

## Cours 28 - Microservices concepts
**Objectifs**
- Comprendre l'architecture microservices
- Découper une application en services
- Gérer la communication inter-services

**Leçon (30 min - détaillée)**
Les microservices permettent de construire des applications évolutives.

**Principe des microservices**
- **Responsabilité unique** : Chaque service fait une chose
- **Indépendance** : Services déployables séparément
- **Communication API** : Via HTTP/REST ou message queues
- **Bases de données séparées** : Données isolées

**Exemple d'architecture**
```
API Gateway
├── Service Authentification
├── Service Utilisateurs  
├── Service Tâches
├── Service Notifications
└── Service Analytics
```

**Communication inter-services**
```python
def notify_user(user_id, message):
    # Appel au service de notifications
    response = requests.post(
        'http://notification-service:8000/api/notify',
        json={'user_id': user_id, 'message': message},
        headers={'Authorization': f'Bearer {service_token}'}
    )
    return response.status_code == 200
```

**Avantages**
- Évolutivité indépendante
- Technologies différentes possibles
- Déploiement plus sûr
- Équipes autonomes

**Démonstration pratique (15 min)**
Concevoir une architecture microservices pour l'app.

**Exercices guidés (10 min)**
1. Identifier les services potentiels
2. Définir les responsabilités
3. Planifier la communication

**QCM d'auto-évaluation (3 min)**
1. Quelle est la responsabilité unique ?
2. Pourquoi des bases séparées ?
3. Comment les services communiquent ?

**Devoir**
Concevoir une architecture microservices pour l'application.

---

## Cours 29 - Revue et optimisation finale
**Objectifs**
- Auditer le code et les performances
- Optimiser les requêtes lentes
- Préparer pour la production

**Leçon (30 min - détaillée)**
Revue finale avant la soutenance.

**Checklist de qualité**
- [ ] Endpoints RESTful complets
- [ ] Authentification JWT sécurisée
- [ ] Validation des données
- [ ] Gestion d'erreurs cohérente
- [ ] Documentation OpenAPI
- [ ] Tests automatisés
- [ ] Rate limiting
- [ ] Caching approprié
- [ ] Logging structuré
- [ ] Sécurité renforcée
- [ ] CORS configuré
- [ ] Versioning d'API
- [ ] Déploiement prêt

**Optimisations finales**
- Vérifier les N+1 queries
- Optimiser les index de base de données
- Compresser les réponses JSON
- Configurer les timeouts appropriés

**Démonstration pratique (15 min)**
Auditer et optimiser l'API.

**Exercices guidés (10 min)**
1. Vérifier les performances
2. Optimiser les requêtes
3. Nettoyer le code

**QCM d'auto-évaluation (3 min)**
1. Quels sont les critères de qualité ?
2. Pourquoi optimiser les requêtes ?
3. Comment mesurer les performances ?

**Devoir**
Effectuer une revue complète et optimiser l'API pour la production.

---

## Cours 30 - Soutenance module 4
**Objectifs**
- Présenter l'API REST complète
- Démontrer les fonctionnalités avancées
- Répondre aux questions techniques

**Leçon (30 min - détaillée)**
Préparation de la soutenance de l'API.

**Points clés à couvrir**
1. **Architecture REST** : Principes et implémentation
2. **Authentification JWT** : Sécurisation des endpoints
3. **Validation et documentation** : Pydantic et OpenAPI
4. **Fonctionnalités avancées** : Pagination, filtres, cache
5. **Sécurité** : Protection contre les attaques
6. **Tests et déploiement** : Qualité et production

**Démonstration**
- Interface Swagger UI
- Tests avec Postman
- Endpoints CRUD complets
- Authentification fonctionnelle
- Gestion d'erreurs

**Checklist de soutenance**
- [ ] API fonctionnelle et testée
- [ ] Documentation complète
- [ ] Authentification sécurisée
- [ ] Gestion d'erreurs robuste
- [ ] Tests automatisés
- [ ] Déploiement configuré
- [ ] Sécurité renforcée

**Démonstration pratique (15 min)**
Répétition de la soutenance.

**Exercices guidés (10 min)**
1. Préparer les slides/démo
2. Répéter les explications
3. Anticiper les questions

**QCM d'auto-évaluation (3 min)**
1. Combien de temps pour la démo ?

**Réponses et explications finales**
- Temps de démo : 10 à 15 minutes recommandé.
- Couverts dans la démo : création, lecture, mise à jour, suppression, login JWT, filtres/pagination, docs Swagger.
- Mesures : tracker performance (response time), logs, test de charge (locust).

## Annexes enseignant - Clés de correction
### QCM cours 1
1. POST (création). 2. Stateless = serveur sans session mutuelle. 3. PUT remplace, PATCH mise à jour partielle.

### QCM cours 2
1. `json.dumps` (serialize). 2. tableau via `[]`. 3. `dumps` vers JSON string, `loads` vers dict Python.

### QCM cours 3
1. Méthode GET pour récupération. 2. 201 pour création réussie. 3. 404 ressource absente.

### QCM cours 8-9 (JWT)
1. JWT = header.payload.signature (Base64URL). 2. Refresh token pour renouvellement sécurisé. 3. `@jwt_required()` protège route.

### QCM cours 16 (caching)
1. TTL = durée de validité. 2. Cache invalide après update. 3. `ETag` et `Cache-Control` pour coherence.

### QCM cours 29
1. critères: test, sécurité, docs, perf. 2. requêtes lentes = mauvaise UX + coûts CPU. 3. profiler + outils APM.

## Appendice : générateurs d'exercices et correction
- Exercice CRUD : vérifier response codes 200/201/204.
- Exercice filter/pagination : ajouter page, per_page, ORDER BY.
- Exercice sécurité : tests unitaires pour token expiré, scope user.
- Exercice docs : valider `openapi.json` contient tous les endpoints.

---



2. Quels aspects techniques couvrir ?
3. Comment gérer les questions difficiles ?

**Devoir**
Préparer complètement la soutenance du module 4 avec une API REST professionnelle.