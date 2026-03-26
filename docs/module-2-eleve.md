# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 2 (30 cours) - Application Flask pro : sessions, securite, tests

### Résumé
Dans ce module, tu vas passer d'une mini-app qui marche à une application web **plus robuste** et **plus pro** :
- authentification (login / logout) avec **sessions**
- protection des formulaires (anti-CSRF simple)
- validation stricte côté serveur
- gestion cohérente des erreurs et des messages à l'utilisateur
- tests automatiques (niveau "unitaire" + test client Flask)

### Rappel du projet fil rouge (on conserve "Tâches")
Tu vas repartir de la base du Module 1 et ajouter :
1. un système de comptes utilisateur
2. une barre "Bonjour, <nom>" (et bouton logout)
3. protection des actions (ajouter / éditer / supprimer) derrière `login`
4. `GET /api/tasks` reste disponible, mais les actions via formulaire sont protégées

### Hypothèses
- Python 3.11+
- Flask
- SQLite (pour rester simple)

---

## Planning (30 cours)
| Cours | Thème principal | Objectif du cours |
|---:|---|---|
| 1 | Repartir proprement | Mise à jour plan + vérifier structure |
| 2 | Environnements & dépendances | `venv` + `requirements.txt` |
| 3 | Config & secret key | `SECRET_KEY`, `DB_PATH`, env |
| 4 | Sessions Flask | comprendre cookies/sessions |
| 5 | Anti-CSRF simple | token caché en session |
| 6 | Validation serveur | erreurs 400 lisibles |
| 7 | Mot de passe : hash | `werkzeug.security` |
| 8 | Registre utilisateur | création compte |
| 9 | Login utilisateur | vérifier credentials |
| 10 | Logout | détruire session |
| 11 | Décorateur `login_required` | protéger routes |
| 12 | Flash messages | succès/erreur propres |
| 13 | Protection des formulaires | ajouter token anti-CSRF |
| 14 | Gestion erreurs 404/500 | pages propres |
| 15 | Schema SQLite utilisateurs | table `users` |
| 16 | Repository utilisateurs | couche DB séparée |
| 17 | Tests Flask | test client + setup DB |
| 18 | Tests sur login | cas valide/invalide |
| 19 | Tests CSRF | rejet si token faux |
| 20 | Tests CRUD protégé | create/edit/delete requires login |
| 21 | Améliorer API GET tasks | filtre + tri + UX |
| 22 | Normaliser code | fonctions utilitaires |
| 23 | Documentation pro | README + "runbook" |
| 24 | Qualité code | style + noms + docstrings |
| 25 | Performances simples | éviter N+1 (si utile) |
| 26 | Accessibilité basique | labels/aria
| 27 | UX formulaire | messages + champs limites |
| 28 | Logs & diagnostic | erreurs lisibles (debug) |
| 29 | Hardening | limites, rate-limit light (concept) |
| 30 | Soutenance module 2 | demo + checklist |

---

## Cours 1 - Repartir proprement (base du module)
**Objectifs**
- comprendre ce qu'on va modifier dans le projet
- re-vérifier structure `app.py / routes.py / db.py / templates`
- repartir avec une "liste de vérification"

**Leçon (30 min - détaillée)**
La propreté d'un projet est essentielle pour pouvoir l'évoluer facilement. Avant d'ajouter de nouvelles fonctionnalités complexes comme l'authentification et la sécurité, il faut s'assurer que la base est solide.

**Pourquoi repartir proprement ?**
- **Maintenabilité** : Un code bien structuré est plus facile à modifier et déboguer
- **Évolutivité** : Les nouvelles fonctionnalités s'intègrent mieux dans une architecture claire
- **Collaboration** : D'autres développeurs peuvent comprendre et contribuer plus facilement

**Structure idéale d'une application Flask**
```
mon_projet/
├── app.py              # Point d'entrée principal
├── config.py           # Configuration centralisée
├── models.py           # Classes de données
├── database.py         # Accès à la base de données
├── routes.py           # Définition des routes
├── security.py         # Fonctions de sécurité (hash, validation)
├── templates/          # Templates HTML
│   ├── base.html
│   ├── tasks.html
│   └── ...
├── static/             # Fichiers statiques
│   ├── css/
│   └── js/
├── tests/              # Tests automatisés
└── requirements.txt    # Dépendances
```

**Liste de vérification avant de commencer**
- [ ] Structure des dossiers claire et logique
- [ ] Séparation des responsabilités (routes, DB, modèles)
- [ ] Configuration externalisée (pas de secrets en dur)
- [ ] Gestion d'erreurs de base (404, 500)
- [ ] Tests de base fonctionnels
- [ ] Documentation minimale (README)

**Bonnes pratiques pour la suite**
- Utiliser des environnements virtuels
- Versionner les dépendances
- Tester régulièrement les changements
- Documenter les nouvelles fonctionnalités

**Exercices (25 min)**
- Ex1 : recopier le projet du Module 1 dans un nouveau dossier `module2/`.
- Ex2 : vérifier que `GET /` et `POST /add` fonctionnent (au moins en local).
- Ex3 : créer un dossier `tests/` et un fichier `test_smoke.py` vide.

**QCM (3 questions)**
1) Une "propreté" de projet aide surtout à : A) ajouter plus vite des features B) perdre du temps C) supprimer tests.
2) Les tests servent à : A) éviter les régressions B) faire joli C) supprimer logs.
3) La sécurité web de base repose surtout sur : A) validation + sessions B) thèmes C) HTML uniquement.

**Devoir (5 min)**
- Écrire une checklist en 8 points pour prouver que ton application est "propre" (structure, config, routes, templates, erreurs).

---

## Cours 2 - Environnements & dépendances
**Objectifs**
- créer `venv`
- utiliser `pip freeze` (ou `pipreqs` si tu veux) pour figer
- comprendre ce que signifie "reproductibilité"

**Leçon (30 min - détaillée)**
Un environnement de développement reproductible garantit que ton application fonctionne de la même manière sur différentes machines.

**Qu'est-ce qu'un environnement virtuel ?**
Un environnement virtuel Python est un espace isolé où tu peux installer des packages spécifiques à ton projet sans affecter le Python système ou d'autres projets.

**Pourquoi utiliser venv ?**
- **Isolation** : Évite les conflits entre versions de packages
- **Reproductibilité** : Tout le monde peut recréer exactement le même environnement
- **Nettoyage** : Supprimer l'environnement virtuel nettoie tout

**Création et utilisation d'un venv**
```bash
# Créer l'environnement virtuel
python -m venv venv

# Activer l'environnement (Windows)
venv\Scripts\activate

# Activer l'environnement (Linux/Mac)
source venv/bin/activate

# Désactiver
deactivate
```

**Gérer les dépendances**
Le fichier `requirements.txt` liste toutes les dépendances nécessaires avec leurs versions.

```bash
# Installer un package
pip install flask

# Générer requirements.txt
pip freeze > requirements.txt

# Installer depuis requirements.txt
pip install -r requirements.txt
```

**Outils alternatifs**
- `pipreqs` : Génère requirements.txt basé sur les imports dans ton code
- `poetry` : Gestionnaire de dépendances plus avancé
- `conda` : Pour les environnements scientifiques

**Bonnes pratiques**
- Toujours travailler dans un environnement virtuel
- Figer les versions pour éviter les surprises
- Documenter les commandes d'installation
- Mettre à jour régulièrement les dépendances (avec précaution)

**Exercices (25 min)**
- Ex1 : créer `venv` et installer Flask.
- Ex2 : générer `requirements.txt` (au minimum `flask`).
- Ex3 : relancer l'app avec un environnement propre.

**QCM**
1) `venv` sert à : A) isoler B) compresser C) chiffrer.
2) `requirements.txt` sert à : A) figer les versions B) supprimer modules C) cacher erreurs.
3) Reproductibilité signifie : A) mêmes résultats B) décorer C) oublier tests.

**Devoir**
- Ajouter une section "Setup" dans le README module 2 : commande exacte pour lancer.

---

## Cours 3 - Config & secret key
**Objectifs**
- comprendre `SECRET_KEY`
- éviter les secrets en dur
- paramètres via env variables

**Leçon (30 min - détaillée)**
La configuration d'une application doit être flexible et sécurisée, sans coder en dur les informations sensibles.

**Le rôle crucial de SECRET_KEY**
En Flask, `SECRET_KEY` est une chaîne secrète utilisée pour :
- Signer les cookies de session
- Générer des tokens anti-CSRF
- Sécuriser les données sensibles

**Pourquoi c'est critique ?**
Sans `SECRET_KEY` appropriée :
- Les sessions peuvent être falsifiées
- Les tokens de sécurité sont prévisibles
- L'application est vulnérable aux attaques

**Configuration via variables d'environnement**
```python
import os

# Configuration sécurisée
class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY')
    DATABASE_URI = os.environ.get('DATABASE_URI', 'sqlite:///app.db')
    DEBUG = os.environ.get('DEBUG', 'False').lower() == 'true'

# Vérification
if not Config.SECRET_KEY:
    raise ValueError("SECRET_KEY doit être définie dans les variables d'environnement")
```

**Fichier .env pour le développement**
```
# Fichier .env (NE PAS committer !)
SECRET_KEY=ta-cle-secrete-unique-et-longue
DATABASE_URI=sqlite:///dev.db
DEBUG=True
```

**Chargement du .env**
```python
from dotenv import load_dotenv
load_dotenv()  # Charge automatiquement le fichier .env
```

**Bonnes pratiques de sécurité**
- Générer des clés secrètes aléatoirement (utiliser `secrets` module)
- Ne jamais committer les secrets
- Utiliser des clés différentes pour dev/prod
- Limiter l'accès aux variables d'environnement

**Exercices (25 min)**
- Ex1 : ajouter `SECRET_KEY` dans `.env` (ou variables env).
- Ex2 : faire lire `DB_PATH` et `SECRET_KEY` dans une config `config.py`.
- Ex3 : afficher (sans secrets) des informations de debug.

**QCM**
1) `SECRET_KEY` est utilisé pour : A) sessions et cookies B) CSS C) DB uniquement.
2) Ne pas coder en dur : A) éviter fuite B) ralentir C) compliquer.
3) `env` sert à : A) config externe B) images C) SQL.

**Devoir**
- Proposer 3 variables d'environnement pour ton module 2 (sans secrets sensibles).

---

## Cours 4 - Sessions Flask : le concept
**Objectifs**
- comprendre qu'une session est associée à un cookie
- utiliser `session[...]`
- savoir ce qui est stocké côté serveur vs cookie

**Leçon (30 min - détaillée)**
Les sessions permettent de maintenir un état entre les requêtes HTTP, qui sont par nature sans état.

**Qu'est-ce qu'une session web ?**
Une session web permet au serveur de "se souvenir" d'un utilisateur à travers plusieurs requêtes. Contrairement aux cookies simples, les sessions stockent des données sensibles côté serveur.

**Comment ça fonctionne ?**
1. **Cookie de session** : Petit identifiant stocké dans le navigateur
2. **Stockage serveur** : Données associées à cet identifiant
3. **Sécurité** : Le cookie est signé pour éviter la falsification

**Utilisation en Flask**
```python
from flask import session

@app.route('/login', methods=['POST'])
def login():
    # Vérifier les credentials
    if credentials_valides:
        session['user_id'] = user.id
        session['username'] = user.username
        return redirect(url_for('dashboard'))

@app.route('/profile')
def profile():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    user_id = session['user_id']
    # Récupérer les données utilisateur
    return render_template('profile.html', user=get_user(user_id))
```

**Différences avec les cookies**
- **Cookies** : Stockés côté client, limités à 4KB, visibles par l'utilisateur
- **Sessions** : Stockées côté serveur, taille illimitée, invisibles pour l'utilisateur

**Sécurité des sessions**
- Sessions expirent automatiquement
- Protection contre la fixation de session
- Cookies sécurisés (HTTPS seulement en production)

**Exercices (25 min)**
- Ex1 : créer un route `/debug-session` qui affiche une valeur de session (sans secrets).
- Ex2 : route `/set-name` qui met `session["name"] = ...`
- Ex3 : route `/clear` qui supprime la session.

**QCM**
1) Session = A) mémoire par utilisateur B) API GET C) CSS.
2) Pour tester sessions : A) ouvrir plusieurs pages B) changer thème C) Docker.
3) Un cookie permet de : A) reconnaître le navigateur B) faire SQL C) générer PDF.

**Devoir**
- Rédiger 5 lignes expliquant comment `login` va utiliser les sessions dans ton projet.

---

## Cours 5 - Anti-CSRF simple (didactique)
**Objectifs**
- comprendre pourquoi CSRF est un risque
- générer un token anti-CSRF
- valider token sur les POST

**Leçon (30 min - détaillée)**
CSRF (Cross-Site Request Forgery) est une attaque où un site malveillant force un utilisateur authentifié à effectuer une action non désirée.

**Comment fonctionne une attaque CSRF ?**
1. L'utilisateur est connecté sur ton site (session active)
2. L'utilisateur visite un site malveillant
3. Ce site contient un formulaire qui POST vers ton site
4. Le navigateur envoie automatiquement les cookies de session
5. Ton serveur traite la requête comme légitime

**Exemple d'attaque CSRF**
Un site malveillant contient :
```html
<form action="http://ton-site.com/transfer" method="POST">
    <input name="montant" value="1000">
    <input name="destinataire" value="attaquant">
</form>
<script>
    document.forms[0].submit(); // Soumission automatique
</script>
```

**Protection anti-CSRF**
- Générer un token unique par session
- L'inclure dans tous les formulaires
- Le vérifier sur chaque requête POST

**Implémentation simple**
```python
from flask import session
import secrets

def generate_csrf_token():
    if 'csrf_token' not in session:
        session['csrf_token'] = secrets.token_hex(32)
    return session['csrf_token']

@app.route('/formulaire')
def show_form():
    token = generate_csrf_token()
    return render_template('form.html', csrf_token=token)

@app.route('/action', methods=['POST'])
def do_action():
    token = request.form.get('csrf_token')
    if token != session.get('csrf_token'):
        abort(400, "Token CSRF invalide")
    # Traiter l'action
```

**Template protégé**
```html
<form method="POST">
    <input type="hidden" name="csrf_token" value="{{ csrf_token }}">
    <input name="titre" placeholder="Titre de la tâche">
    <button type="submit">Ajouter</button>
</form>
```

**Exercices (25 min)**
- Ex1 : créer une fonction `get_csrf_token()` qui stocke un token dans `session`.
- Ex2 : injecter token dans un template de formulaire via `<input type="hidden" ...>`.
- Ex3 : vérifier token dans les routes POST (sinon 400).

**QCM**
1) CSRF vise : A) actions via navigateur déjà authentifié B) CSS C) JSON.
2) Le token CSRF doit être : A) cohérent entre session et formulaire B) aléatoire sans contrôle C) caché CSS.
3) En cas de token invalide : A) 400 B) 200 C) rediriger vers page 404.

**Devoir**
- Écrire un exemple de 2 formulaires avec token (ajout + edit).

---

## Cours 6 - Validation serveur (et erreurs lisibles)
**Objectifs**
- valider `titre` (longueur, type)
- valider `echeance` (format optionnel)
- retourner des erreurs "humaines"

**Leçon (30 min - détaillée)**
La validation côté serveur est la dernière ligne de défense contre les données invalides ou malveillantes.

**Pourquoi valider côté serveur ?**
- **Sécurité** : Le client peut être compromis ou modifié
- **Cohérence** : Garantir l'intégrité des données
- **UX** : Fournir des messages d'erreur clairs

**Types de validation**
- **Format** : Email, date, numéro de téléphone
- **Longueur** : Minimum/maximum de caractères
- **Contenu** : Caractères autorisés, mots interdits
- **Logique métier** : Contraintes spécifiques à l'application

**Validation en Python**
```python
def validate_title(titre):
    if not titre:
        return "Le titre ne peut pas être vide"
    
    if len(titre.strip()) < 3:
        return "Le titre doit contenir au moins 3 caractères"
    
    if len(titre) > 100:
        return "Le titre ne peut pas dépasser 100 caractères"
    
    return None  # Pas d'erreur

def validate_date(date_str):
    if not date_str:
        return None  # Optionnel
    
    try:
        # Essayer de parser la date
        from datetime import datetime
        datetime.strptime(date_str, '%Y-%m-%d')
        return None
    except ValueError:
        return "Format de date invalide (utilisez YYYY-MM-DD)"
```

**Gestion des erreurs dans Flask**
```python
@app.route('/add', methods=['POST'])
def add_task():
    titre = request.form.get('titre', '').strip()
    
    # Validation
    error = validate_title(titre)
    if error:
        flash(error, 'error')
        return redirect(url_for('tasks'))
    
    # Créer la tâche
    # ...
    flash('Tâche ajoutée avec succès', 'success')
    return redirect(url_for('tasks'))
```

**Messages d'erreur utilisateur-friendly**
- Éviter le jargon technique
- Expliquer ce qui ne va pas
- Suggérer la correction
- Rester positif

**Exercices (25 min)**
- Ex1 : refactoriser `validate_title`.
- Ex2 : créer `validate_echeance(date_str)` (retourner `None` si vide, sinon string valide).
- Ex3 : rendre une page avec message erreur en cas d'invalidité.

**QCM**
1) Validation serveur sert à : A) robustesse B) joli C) supprimer tests.
2) Une erreur 400 signifie : A) input client invalide B) serveur ok C) page introuvable.
3) Validation limite aussi les bugs : A) oui B) non C) jamais.

**Devoir**
- Lister 6 champs d'input à valider dans ton mini-projet Tâches.

---

## Cours 7 - Hash de mot de passe
**Objectifs**
- utiliser `generate_password_hash`
- utiliser `check_password_hash`
- stocker seulement le hash en DB

**Leçon (30 min - détaillée)**
Les mots de passe ne doivent jamais être stockés en clair dans la base de données.

**Qu'est-ce qu'un hash ?**
Un hash est une fonction à sens unique qui transforme une donnée en une chaîne de caractères fixe. Il est impossible de retrouver le mot de passe original à partir du hash.

**Pourquoi hasher les mots de passe ?**
- **Sécurité** : Même si la DB est compromise, les mots de passe restent secrets
- **Irréversibilité** : Impossible de "décrypter" un hash
- **Détermination** : Même mot de passe = même hash

**Utilisation de Werkzeug**
Flask utilise Werkzeug pour la sécurité :
```python
from werkzeug.security import generate_password_hash, check_password_hash

# Lors de l'inscription
password_hash = generate_password_hash(password, method='pbkdf2:sha256')

# Lors de la connexion
if check_password_hash(stored_hash, provided_password):
    # Mot de passe correct
    pass
else:
    # Mot de passe incorrect
    pass
```

**Stockage en base de données**
```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

**Bonnes pratiques**
- Utiliser des algorithmes forts (pbkdf2, bcrypt, argon2)
- Saler automatiquement les hashes
- Mettre à jour les anciens hashes lors de la connexion
- Ne jamais logger les mots de passe

**Exercices (25 min)**
- Ex1 : créer une fonction `hash_password(pw)`.
- Ex2 : créer une fonction `verify_password(pw, hash)`.
- Ex3 : tester : même mot de passe => True, autre => False.

**QCM**
1) Hash = A) transformation irréversible B) CSS C) JSON.
2) Le hash en DB signifie : A) sécurité B) fuite C) compression.
3) `check_password_hash` sert à : A) vérifier authentification B) SQL C) PDF.

**Devoir**
- Définir 3 règles simples sur le mot de passe (min longueur, etc.) et comment les valider.

---

## Cours 8 - Registre utilisateur
**Objectifs**
- créer endpoint `POST /register`
- insérer un user dans SQLite
- gérer doublons (username existe)

**Leçon (30 min - détaillée)**
L'inscription d'utilisateurs doit être sécurisée et gérer les cas d'erreur de manière élégante.

**Processus d'inscription**
1. **Validation des données** : Username et mot de passe valides
2. **Vérification d'unicité** : Username pas déjà pris
3. **Hash du mot de passe** : Sécurité
4. **Insertion en base** : Créer le compte
5. **Feedback utilisateur** : Confirmation ou erreur

**Gestion des doublons**
SQLite permet de définir des contraintes d'unicité :
```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);
```

**Code d'inscription**
```python
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username', '').strip()
        password = request.form.get('password')
        
        # Validation
        if not username or len(username) < 3:
            flash("Nom d'utilisateur invalide", 'error')
            return redirect(url_for('register'))
        
        # Vérifier si username existe déjà
        if get_user_by_username(username):
            flash("Ce nom d'utilisateur existe déjà", 'error')
            return redirect(url_for('register'))
        
        # Créer l'utilisateur
        password_hash = generate_password_hash(password)
        create_user(username, password_hash)
        
        flash("Compte créé avec succès !", 'success')
        return redirect(url_for('login'))
    
    return render_template('register.html')
```

**Sécurité de l'inscription**
- Valider les entrées
- Hasher les mots de passe
- Éviter les injections SQL
- Limiter les tentatives (rate limiting)

**Exercices (25 min)**
- Ex1 : créer page `register.html`
- Ex2 : route `POST /register` avec validation
- Ex3 : route `/login` affiche message "compte créé"

**QCM**
1) Doublon username : A) erreur à gérer B) ignorer C) supprimer DB.
2) Registration crée : A) record DB B) CSS C) PDF.
3) Enregistrement doit : A) valider B) ne rien vérifier C) stocker clair.

**Devoir**
- Écrire une stratégie pour renvoyer une erreur lisible à l'utilisateur.

---

## Cours 9 - Login utilisateur
**Objectifs**
- vérifier identifiant + mot de passe
- créer la session
- rediriger correctement

**Leçon (30 min - détaillée)**
Le login est le processus qui établit l'identité de l'utilisateur pour la session en cours.

**Étapes du login**
1. **Récupération des credentials** : Username et mot de passe
2. **Validation des données** : Format correct
3. **Vérification en base** : Utilisateur existe et mot de passe correct
4. **Création de session** : Stocker l'identité utilisateur
5. **Redirection** : Vers la page appropriée

**Implémentation sécurisée**
```python
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username', '').strip()
        password = request.form.get('password')
        
        # Validation basique
        if not username or not password:
            flash("Nom d'utilisateur et mot de passe requis", 'error')
            return redirect(url_for('login'))
        
        # Récupérer l'utilisateur
        user = get_user_by_username(username)
        if not user:
            flash("Nom d'utilisateur ou mot de passe incorrect", 'error')
            return redirect(url_for('login'))
        
        # Vérifier le mot de passe
        if not check_password_hash(user['password_hash'], password):
            flash("Nom d'utilisateur ou mot de passe incorrect", 'error')
            return redirect(url_for('login'))
        
        # Créer la session
        session['user_id'] = user['id']
        session['username'] = user['username']
        
        flash(f"Bienvenue {user['username']} !", 'success')
        return redirect(url_for('dashboard'))
    
    return render_template('login.html')
```

**Sécurité du login**
- Ne pas révéler si c'est l'username ou le mot de passe qui est incorrect
- Limiter les tentatives de connexion
- Utiliser HTTPS en production
- Hasher les mots de passe (déjà fait)

**Exercices**
- Ex1 : `POST /login` qui charge user depuis DB
- Ex2 : si credentials invalides => 401 ou message
- Ex3 : si OK => `session["user_id"] = ...`

**QCM**
1) Session user_id sert à : A) identifier B) style C) images.
2) credentials invalides : A) refuser B) accepter C) effacer DB.
3) Redirection après login : A) guider B) oui C) cacher.

**Devoir**
- Ajouter une page "Mon profil" qui affiche username depuis session.

---

## Cours 10 - Logout
**Objectifs**
- nettoyer session
- éviter accès après logout

**Leçon (30 min - détaillée)**
Le logout doit complètement nettoyer la session pour éviter tout accès non autorisé.

**Pourquoi nettoyer complètement ?**
- **Sécurité** : Éviter l'accès avec une session expirée
- **Confidentialité** : Ne pas laisser de traces
- **Propreté** : Session vierge pour le prochain utilisateur

**Implémentation du logout**
```python
@app.route('/logout')
def logout():
    # Nettoyer complètement la session
    session.clear()
    
    flash("Vous avez été déconnecté", 'info')
    return redirect(url_for('index'))
```

**Protection contre les accès post-logout**
```python
@app.route('/profile')
@login_required  # Décorateur que nous verrons au cours 11
def profile():
    # Cette route ne sera accessible qu'aux utilisateurs connectés
    return render_template('profile.html')
```

**Bonnes pratiques**
- Toujours rediriger après logout
- Nettoyer complètement la session (pas seulement quelques clés)
- Informer l'utilisateur de la déconnexion
- Invalider les tokens si utilisés

**Exercices**
- Ex1 : route `/logout` supprime `session.clear()`
- Ex2 : tester : après logout, POST /add refuse

**QCM**
1) Logout = A) détruire session B) changer thème C) SQL update seulement.
2) Après logout, il faut : A) protéger B) laisser ouvert C) cacher.
3) `session.clear()` sert à : A) effacer variables B) CSS C) DB.

**Devoir**
- Écrire un paragraphe "ce que l'utilisateur voit" quand il est logout.

---

## Cours 11 - Décorateur `login_required`
**Objectifs**
- factoriser la protection
- simplifier les routes

**Leçon (30 min - détaillée)**
Les décorateurs permettent de réutiliser de la logique de manière élégante et DRY (Don't Repeat Yourself).

**Qu'est-ce qu'un décorateur ?**
Un décorateur est une fonction qui modifie le comportement d'une autre fonction. En Flask, ils sont souvent utilisés pour ajouter des vérifications avant l'exécution d'une route.

**Création du décorateur login_required**
```python
from functools import wraps
from flask import session, redirect, url_for, flash

def login_required(f):
    @wraps(f)  # Préserve les métadonnées de la fonction originale
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            flash("Vous devez être connecté pour accéder à cette page", 'warning')
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function
```

**Utilisation du décorateur**
```python
@app.route('/tasks')
@login_required
def list_tasks():
    # Cette fonction ne s'exécute que si l'utilisateur est connecté
    user_id = session['user_id']
    tasks = get_user_tasks(user_id)
    return render_template('tasks.html', tasks=tasks)

@app.route('/add', methods=['POST'])
@login_required
def add_task():
    # Protégé automatiquement
    titre = request.form.get('titre')
    user_id = session['user_id']
    create_task_for_user(titre, user_id)
    return redirect(url_for('list_tasks'))
```

**Avantages du décorateur**
- **DRY** : Une seule vérification pour toutes les routes protégées
- **Maintenabilité** : Modifier la logique de protection à un seul endroit
- **Lisibilité** : `@login_required` rend explicite qu'une route nécessite une authentification
- **Réutilisabilité** : Peut être utilisé sur n'importe quelle fonction

**Exercices**
- Ex1 : créer `login_required` (si pas login => redirect `/login`)
- Ex2 : ajouter décorateur sur `/add`, `/edit`, `/delete`, `/toggle`

**QCM**
1) décorateur sert à : A) réutiliser B) CSS C) DB uniquement.
2) Protéger route signifie : A) require login B) skip CSRF C) ignore validation.
3) Redirect après non-login : A) oui B) non C) 404.

**Devoir**
- Lister les routes à protéger (au moins 5).

---

## Cours 12 - Flash messages
**Objectifs**
- utiliser `flash()` + template
- afficher messages success/error

**Leçon (30 min - détaillée)**
Les messages flash permettent de communiquer temporairement avec l'utilisateur après une action.

**Pourquoi des messages flash ?**
- **Feedback utilisateur** : Confirmer les actions réussies
- **Erreurs** : Expliquer ce qui s'est mal passé
- **Navigation** : Messages qui persistent à travers les redirections

**Utilisation de flash**
```python
from flask import flash

@app.route('/add', methods=['POST'])
@login_required
def add_task():
    titre = request.form.get('titre')
    
    # Validation
    if not titre or len(titre.strip()) < 3:
        flash("Le titre doit contenir au moins 3 caractères", 'error')
        return redirect(url_for('add_form'))
    
    # Création réussie
    create_task(titre, session['user_id'])
    flash("Tâche ajoutée avec succès !", 'success')
    
    return redirect(url_for('list_tasks'))
```

**Affichage dans les templates**
```html
<!-- templates/base.html -->
{% with messages = get_flashed_messages(with_categories=true) %}
  {% if messages %}
    <div class="messages">
      {% for category, message in messages %}
        <div class="alert alert-{{ category }}">
          {{ message }}
        </div>
      {% endfor %}
    </div>
  {% endif %}
{% endwith %}
```

**CSS pour les messages**
```css
.messages {
    margin: 1rem 0;
}

.alert {
    padding: 1rem;
    border-radius: 4px;
    margin-bottom: 0.5rem;
}

.alert-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert-error {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.alert-warning {
    background-color: #fff3cd;
    color: #856404;
    border: 1px solid #ffeaa7;
}
```

**Bonnes pratiques**
- Catégoriser les messages (success, error, warning, info)
- Garder les messages courts et clairs
- Utiliser des icônes pour renforcer le message
- Faire disparaître automatiquement après lecture

**Exercices**
- Ex1 : "Compte créé" après register
- Ex2 : "Tâche ajoutée" après add
- Ex3 : "Tâche supprimée" après delete

**QCM**
1) Flash messages servent à : A) feedback utilisateur B) cacher erreurs C) PDF.
2) Flash est temporaire : A) oui B) non C) jamais.
3) Template lit flash : A) oui B) no C) CSS only.

**Devoir**
- Ajouter un bloc HTML standard "messages" dans `base.html`.

---

## Cours 13 - Protection des formulaires (CSRF partout)
**Objectifs**
- injecter le token partout (add/edit/toggle/delete)
- valider sur chaque POST

**Leçon (30 min - détaillée)**
La sécurité doit être cohérente : tous les formulaires POST doivent être protégés contre CSRF.

**Injection du token dans tous les formulaires**
```html
<!-- templates/add_task.html -->
<form method="POST" action="{{ url_for('add_task') }}">
    <input type="hidden" name="csrf_token" value="{{ csrf_token }}">
    
    <label for="titre">Titre de la tâche :</label>
    <input type="text" id="titre" name="titre" required>
    
    <button type="submit">Ajouter</button>
</form>
```

**Validation dans toutes les routes POST**
```python
def validate_csrf_token():
    token = request.form.get('csrf_token')
    expected = session.get('csrf_token')
    
    if not token or token != expected:
        abort(400, "Token CSRF invalide")

@app.route('/add', methods=['POST'])
@login_required
def add_task():
    validate_csrf_token()  # Vérification CSRF
    
    titre = request.form.get('titre')
    # ... traitement normal
```

**Génération du token dans base.html**
```html
<!-- templates/base.html -->
{% set csrf_token = csrf_token or session.get('csrf_token') %}
```

**Routes concernées**
- `/add` (POST) - Ajouter une tâche
- `/edit/<id>` (POST) - Modifier une tâche
- `/delete/<id>` (POST) - Supprimer une tâche
- `/toggle/<id>` (POST) - Changer le statut
- `/register` (POST) - Créer un compte
- `/login` (POST) - Se connecter

**Exercices**
- Ex1 : ajouter hidden csrf token dans templates
- Ex2 : simuler token incorrect => 400

**QCM**
1) CSRF doit être : A) sur chaque formulaire POST B) un seul. (A)
2) Sinon : A) risque reste B) aucun C) CSS change. (A)
3) Réponse 400 : A) correct B) cachée C) redirect. (A)

**Devoir**
- Faire une matrice "formulaire -> route -> vérification CSRF".

---

## Cours 14 - Gestion erreurs 404/500 (propre)
**Objectifs**
- pages 404/500
- messages lisibles

**Leçon (30 min - détaillée)**
Les erreurs sont inévitables. Une bonne gestion améliore la confiance des utilisateurs.

**Erreur 404 - Page non trouvée**
```python
@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404
```

**Erreur 500 - Erreur serveur**
```python
@app.errorhandler(500)
def internal_error(error):
    # Ne pas exposer les détails techniques en production
    return render_template('500.html'), 500
```

**Templates d'erreur**
```html
<!-- templates/404.html -->
{% extends "base.html" %}

{% block content %}
<div class="error-page">
    <h1>404 - Page non trouvée</h1>
    <p>Désolé, la page que vous cherchez n'existe pas.</p>
    <p><a href="{{ url_for('index') }}">Retour à l'accueil</a></p>
</div>
{% endblock %}
```

```html
<!-- templates/500.html -->
{% extends "base.html" %}

{% block content %}
<div class="error-page">
    <h1>Erreur interne du serveur</h1>
    <p>Une erreur inattendue s'est produite.</p>
    <p>Nos équipes ont été notifiées. Veuillez réessayer plus tard.</p>
    <p><a href="{{ url_for('index') }}">Retour à l'accueil</a></p>
</div>
{% endblock %}
```

**CSS pour les pages d'erreur**
```css
.error-page {
    text-align: center;
    padding: 2rem;
}

.error-page h1 {
    color: #dc3545;
    font-size: 3rem;
    margin-bottom: 1rem;
}

.error-page p {
    font-size: 1.2rem;
    margin-bottom: 1rem;
}
```

**Exercices**
- Ex1 : page 404 pour routes inconnues
- Ex2 : simuler 500 pour voir rendu (debug off)

**QCM**
1) 404 = ressource inexistante B) erreur DB C) paiement. (A)
2) 500 doit : A) guider sans exposer B) cacher logs complet C) afficher stacktrace. (A)
3) Error pages = UX. (A)

**Devoir**
- Écrire 2 phrases pour ton template 500.

---

## Cours 15 - Schema SQLite utilisateurs
**Objectifs**
- créer table users
- contraintes (username unique)

**Leçon (30 min - détaillée)**
Le schéma de base de données définit la structure et les contraintes des données.

**Table users - Conception**
```sql
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME
);
```

**Contraintes importantes**
- **PRIMARY KEY** : Identifiant unique automatique
- **UNIQUE** : Empêche les doublons de username
- **NOT NULL** : Champs obligatoires
- **DEFAULT CURRENT_TIMESTAMP** : Date de création automatique

**Migration de schéma**
```python
def init_db():
    conn = sqlite3.connect('app.db')
    cursor = conn.cursor()
    
    # Créer la table users
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password_hash TEXT NOT NULL,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            last_login DATETIME
        )
    ''')
    
    # Ajouter des colonnes si nécessaire (migration)
    try:
        cursor.execute('ALTER TABLE users ADD COLUMN last_login DATETIME')
    except sqlite3.OperationalError:
        # Colonne existe déjà
        pass
    
    conn.commit()
    conn.close()
```

**Bonnes pratiques**
- Utiliser des noms de colonnes explicites
- Définir les contraintes appropriées
- Prévoir l'évolutivité (nouvelles colonnes)
- Documenter le schéma

**Exercices**
- Ex1 : `CREATE TABLE users`
- Ex2 : `username UNIQUE`

**QCM**
1) UNIQUE utile pour : A) doublons B) suppression C) CSS. (A)
2) Table users contient : A) identifiant + hash B) HTML C) CSS. (A)
3) Schema doit être stable : A) oui B) non C) jamais. (A)

**Devoir**
- Lister 4 colonnes utiles et pourquoi.

---

## Cours 16 - Repository utilisateurs
**Objectifs**
- séparation logique DB (users_repo)
- ré-utiliser validation

**Leçon (30 min - détaillée)**
Le repository pattern sépare la logique d'accès aux données du reste de l'application.

**Pattern Repository**
```python
# repositories/user_repository.py
class UserRepository:
    def __init__(self, db_path='app.db'):
        self.db_path = db_path
    
    def get_user_by_username(self, username):
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        
        cursor.execute('SELECT * FROM users WHERE username = ?', (username,))
        user = cursor.fetchone()
        
        conn.close()
        return user
    
    def create_user(self, username, password_hash):
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        
        try:
            cursor.execute('''
                INSERT INTO users (username, password_hash)
                VALUES (?, ?)
            ''', (username, password_hash))
            
            user_id = cursor.lastrowid
            conn.commit()
            return user_id
        except sqlite3.IntegrityError:
            # Username déjà pris
            return None
        finally:
            conn.close()
    
    def update_last_login(self, user_id):
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        
        cursor.execute('''
            UPDATE users SET last_login = CURRENT_TIMESTAMP
            WHERE id = ?
        ''', (user_id,))
        
        conn.commit()
        conn.close()
```

**Utilisation du repository**
```python
from repositories.user_repository import UserRepository

user_repo = UserRepository()

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    
    user = user_repo.get_user_by_username(username)
    if user and check_password_hash(user[2], password):  # user[2] = password_hash
        user_repo.update_last_login(user[0])  # user[0] = id
        # ...
```

**Avantages du pattern Repository**
- **Testabilité** : Facile à mocker pour les tests
- **Séparation** : Logique DB séparée de la logique métier
- **Réutilisabilité** : Même repository utilisable dans plusieurs parties de l'app
- **Maintenance** : Changements de DB impactent seulement le repository

**Exercices**
- Ex1 : `get_user_by_username(username)`
- Ex2 : `create_user(username, password_hash)`

**QCM**
1) Repository sert à : A) isoler SQL B) CSS C) templates. (A)
2) Séparer aide : A) maintenir B) dupliquer C) casser. (A)
3) SQL paramétré : A) oui B) non C) jamais. (A)

**Devoir**
- Refactoriser 1 fonction DB de Module 1 dans un repository séparé (même principe).

---

## Cours 17 - Tests Flask : approche
**Objectifs**
- créer tests avec `app.test_client()`
- initialiser DB de test

**Leçon (30 min - détaillée)**
Les tests automatisés garantissent que l'application fonctionne correctement et détectent les régressions.

**Test client Flask**
```python
import unittest
from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        # Configuration pour les tests
        app.config['TESTING'] = True
        app.config['DATABASE'] = ':memory:'  # DB en mémoire
        self.client = app.test_client()
        
        # Initialiser la DB de test
        with app.app_context():
            init_db()
    
    def test_home_page(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Welcome', response.data)
```

**Structure des tests**
```
tests/
├── __init__.py
├── test_app.py          # Tests généraux
├── test_auth.py         # Tests d'authentification
├── test_tasks.py        # Tests des tâches
├── test_csrf.py         # Tests CSRF
└── conftest.py          # Configuration pytest
```

**Base de données de test**
```python
import tempfile
import os

class TestConfig:
    TESTING = True
    SECRET_KEY = 'test-secret-key'
    DATABASE = ':memory:'  # Ou fichier temporaire
    
    @staticmethod
    def init_test_db():
        # Créer les tables de test
        pass

def create_test_app():
    app = create_app(TestConfig)
    with app.app_context():
        TestConfig.init_test_db()
    return app
```

**Exécuter les tests**
```bash
# Avec unittest
python -m unittest discover

# Avec pytest
pytest

# Avec coverage
coverage run -m pytest
coverage report
```

**Exercices**
- Ex1 : smoke test `GET /` renvoie 200
- Ex2 : test setup DB temporaire (fichier sqlite dans tests/)

**QCM**
1) Test client Flask : A) simule requêtes HTTP B) PDF C) CSS. (A)
2) DB test : A) isoler B) partager C) nettoyer jamais. (A)
3) Smoke test sert à : A) détecter crash B) beautifier. (A)

**Devoir**
- Écrire 3 cas de test "attendus" sur login.

---

## Cours 18 - Tests login
**Objectifs**
- tester login valide et invalide

**Leçon (30 min - détaillée)**
Les tests d'authentification doivent couvrir tous les scénarios possibles.

**Tests de login - Structure**
```python
class TestAuth(unittest.TestCase):
    def setUp(self):
        self.app = create_test_app()
        self.client = self.app.test_client()
        
        # Créer un utilisateur de test
        with self.app.app_context():
            create_test_user('testuser', 'testpass')
    
    def test_login_success(self):
        response = self.client.post('/login', data={
            'username': 'testuser',
            'password': 'testpass'
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Welcome', response.data)
        
        # Vérifier que la session contient user_id
        with self.client.session_transaction() as sess:
            self.assertIn('user_id', sess)
    
    def test_login_wrong_password(self):
        response = self.client.post('/login', data={
            'username': 'testuser',
            'password': 'wrongpass'
        })
        
        self.assertEqual(response.status_code, 200)  # Redirection vers login
        self.assertIn(b'invalid', response.data.lower())
    
    def test_login_nonexistent_user(self):
        response = self.client.post('/login', data={
            'username': 'nonexistent',
            'password': 'anypass'
        })
        
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'invalid', response.data.lower())
```

**Bonnes pratiques de test**
- **Isolation** : Chaque test est indépendant
- **Données de test** : Utiliser des données prévisibles
- **Assertions claires** : Vérifier le comportement attendu
- **Nommage** : `test_login_success`, `test_login_wrong_password`

**Exercices**
- Ex1 : login avec user existant => redirect /profile
- Ex2 : mauvais mdp => message erreur
- Ex3 : utilisateur inexistant => message erreur

**QCM**
1) Tester invalide : A) oui B) non C) ignore. (A)
2) Login valide => session ok : A) oui B) no C) unknown. (A)
3) Tests évitent régressions : A) oui. (A)

**Devoir**
- Écrire pseudo-code de tes 3 tests.

---

## Cours 19 - Tests CSRF
**Objectifs**
- prouver que CSRF rejette

**Leçon (30 min - détaillée)**
Les tests de sécurité doivent vérifier que les protections fonctionnent.

**Test CSRF - Approche**
```python
class TestCSRF(unittest.TestCase):
    def setUp(self):
        self.app = create_test_app()
        self.client = self.app.test_client()
        
        # Se connecter d'abord
        self.login_as_test_user()
        
        # Récupérer le token CSRF
        response = self.client.get('/add')  # Page avec formulaire
        # Extraire le token du HTML (ou via session)
    
    def test_csrf_protection(self):
        # Tenter un POST sans token CSRF
        response = self.client.post('/add', data={
            'titre': 'Test task'
            # Pas de csrf_token
        })
        
        self.assertEqual(response.status_code, 400)
        self.assertIn(b'invalid', response.data.lower())
    
    def test_csrf_with_valid_token(self):
        # Récupérer un token valide
        csrf_token = self.get_csrf_token()
        
        # POST avec token valide
        response = self.client.post('/add', data={
            'titre': 'Test task',
            'csrf_token': csrf_token
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        # Vérifier que la tâche a été créée
```

**Méthodes helper**
```python
def get_csrf_token(self):
    with self.client.session_transaction() as sess:
        return sess.get('csrf_token')

def login_as_test_user(self):
    # Logique de connexion pour les tests
    pass
```

**Exercices**
- Ex1 : enregistrer token via GET formulaire
- Ex2 : envoyer POST avec token modifié => 400

**QCM**
1) CSRF test montre : A) sécurité B) CSS C) PDF. (A)
2) Token invalide => 400 : A) oui. (A)
3) Token valide => action : A) oui. (A)

**Devoir**
- Documenter la méthode pour obtenir token dans un test (2 lignes).

---

## Cours 20 - Tests CRUD protégé
**Objectifs**
- create/edit/delete requires login

**Leçon (30 min - détaillée)**
Les tests doivent vérifier que les protections d'authentification fonctionnent.

**Tests CRUD protégé**
```python
class TestProtectedCRUD(unittest.TestCase):
    def setUp(self):
        self.app = create_test_app()
        self.client = self.app.test_client()
    
    def test_add_task_requires_login(self):
        response = self.client.post('/add', data={
            'titre': 'Test task',
            'csrf_token': 'fake-token'
        })
        
        # Devrait rediriger vers login
        self.assertEqual(response.status_code, 302)
        self.assertIn('/login', response.headers['Location'])
    
    def test_add_task_authenticated(self):
        # Se connecter d'abord
        self.login_as_test_user()
        
        csrf_token = self.get_csrf_token()
        
        response = self.client.post('/add', data={
            'titre': 'Test task',
            'csrf_token': csrf_token
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        # Vérifier en DB que la tâche existe
        self.assert_task_exists('Test task')
    
    def test_delete_task_authenticated(self):
        # Créer une tâche d'abord
        task_id = self.create_test_task()
        
        response = self.client.post(f'/delete/{task_id}', data={
            'csrf_token': self.get_csrf_token()
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        # Vérifier que la tâche n'existe plus
        self.assert_task_not_exists(task_id)
```

**Méthodes helper pour les tests**
```python
def login_as_test_user(self):
    # Connexion automatique pour les tests
    pass

def create_test_task(self):
    # Créer une tâche de test et retourner son ID
    pass

def assert_task_exists(self, title):
    # Vérifier en DB
    pass
```

**Exercices**
- Ex1 : sans login => POST /add redirige /login
- Ex2 : avec login => crée une tâche
- Ex3 : delete supprime (vérifier DB)

**QCM**
1) Protection CRUD : A) login required. (A)
2) Vérifier DB : A) oui. (A)
3) tests CRUD : A) cœur. (A)

**Devoir**
- Lister les routes CRUD à tester.

---

## Cours 21 - Améliorer API GET /api/tasks
**Objectifs**
- filtre côté serveur
- rester en GET uniquement
- nettoyer API payload

**Leçon (30 min - détaillée)**
Une API bien conçue est stable et facile à utiliser.

**Filtrage côté serveur**
```python
@app.route('/api/tasks')
@login_required  # Même si GET, peut nécessiter auth
def api_tasks():
    user_id = session['user_id']
    
    # Filtres depuis les paramètres GET
    status_filter = request.args.get('status')  # 'pending', 'completed', 'all'
    search = request.args.get('search', '').strip()
    limit = int(request.args.get('limit', 50))
    
    # Construire la requête
    query = 'SELECT * FROM tasks WHERE user_id = ?'
    params = [user_id]
    
    if status_filter == 'pending':
        query += ' AND completed = 0'
    elif status_filter == 'completed':
        query += ' AND completed = 1'
    
    if search:
        query += ' AND title LIKE ?'
        params.append(f'%{search}%')
    
    query += ' ORDER BY created_at DESC LIMIT ?'
    params.append(limit)
    
    tasks = execute_query(query, params)
    
    # Convertir en JSON
    return jsonify([{
        'id': t[0],
        'title': t[1],
        'description': t[2],
        'completed': bool(t[3]),
        'created_at': t[4]
    } for t in tasks])
```

**Avantages du filtrage serveur**
- **Performance** : Moins de données transférées
- **Sécurité** : Filtrage basé sur l'utilisateur authentifié
- **Flexibilité** : Tri, pagination, recherche
- **Cache** : Possibilité de cacher les résultats

**URLs d'exemple**
```
/api/tasks                           # Toutes les tâches
/api/tasks?status=pending           # Tâches en cours
/api/tasks?status=completed         # Tâches terminées
/api/tasks?search=urgent            # Recherche
/api/tasks?limit=10                 # Pagination
```

**Exercices**
- Ex1 : `GET /api/tasks?done=true` renvoie uniquement terminées
- Ex2 : trier par `created_at` ou `id`
- Ex3 : renvoyer schéma JSON clair

**QCM**
1) Filtre dans API : A) réduit front logic. (A)
2) GET only : A) simplifie. (A)
3) payload clair : A) oui. (A)

**Devoir**
- Écrire 2 exemples de JSON attendus dans le README.

---

## Cours 22 - Normaliser code
**Objectifs**
- refactorer duplication
- helpers : parse, validation, erreurs

**Leçon (30 min - détaillée)**
Éliminer la duplication améliore la maintenabilité et réduit les bugs.

**Identifier les duplications**
```python
# Code dupliqué dans plusieurs routes
error_msg = ""
if not titre:
    error_msg = "Titre requis"
elif len(titre) > 100:
    error_msg = "Titre trop long"

if error_msg:
    flash(error_msg, 'error')
    return redirect(url_for('form'))
```

**Créer des helpers**
```python
# utils/validation.py
def validate_task_title(title):
    if not title or not title.strip():
        return "Le titre ne peut pas être vide"
    
    title = title.strip()
    if len(title) < 3:
        return "Le titre doit contenir au moins 3 caractères"
    
    if len(title) > 100:
        return "Le titre ne peut pas dépasser 100 caractères"
    
    return None  # Pas d'erreur

# utils/forms.py
def handle_form_error(error_message, redirect_route):
    flash(error_message, 'error')
    return redirect(url_for(redirect_route))

# utils/api.py
def parse_bool_param(param_name, default=False):
    value = request.args.get(param_name, str(default)).lower()
    return value in ('true', '1', 'yes', 'on')
```

**Utilisation dans les routes**
```python
@app.route('/add', methods=['POST'])
@login_required
def add_task():
    titre = request.form.get('titre', '').strip()
    
    # Validation normalisée
    error = validate_task_title(titre)
    if error:
        return handle_form_error(error, 'add_form')
    
    # Création
    create_task(titre, session['user_id'])
    flash("Tâche ajoutée !", 'success')
    return redirect(url_for('tasks'))
```

**Avantages de la normalisation**
- **DRY** : Don't Repeat Yourself
- **Maintenance** : Un changement = impact partout
- **Tests** : Valider une fois pour toutes
- **Lisibilité** : Code plus clair

**Exercices**
- Ex1 : créer fonction `_handle_form_error(...)`
- Ex2 : factoriser `_parse_done_param`

**QCM**
1) Normaliser = réduire duplication. (A)
2) Helpers aident. (A)
3) Moins de code = moins de bugs. (A)

**Devoir**
- Donner un exemple de duplication dans ton code Module 1 et comment tu l'élimines.

---

## Cours 23 - Documentation pro (README + runbook)
**Objectifs**
- README complet
- runbook : "si ça ne marche pas, fait ceci"

**Leçon (30 min - détaillée)**
Une bonne documentation est essentielle pour la maintenance et l'onboarding.

**Structure d'un README professionnel**
```markdown
# Todo App - Application de Gestion de Tâches

Application web Flask pour gérer des tâches personnelles avec authentification.

## Fonctionnalités

- ✅ Authentification utilisateur (login/logout)
- ✅ CRUD complet des tâches
- ✅ Protection CSRF sur tous les formulaires
- ✅ API REST JSON
- ✅ Interface responsive
- ✅ Tests automatisés complets

## Prérequis

- Python 3.11+
- pip

## Installation

1. **Cloner le repository**
   ```bash
   git clone https://github.com/username/todo-app.git
   cd todo-app
   ```

2. **Créer un environnement virtuel**
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/Mac
   # ou
   venv\Scripts\activate     # Windows
   ```

3. **Installer les dépendances**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configurer les variables d'environnement**
   Créer un fichier `.env` :
   ```
   SECRET_KEY=votre-cle-secrete-unique
   DATABASE_URL=sqlite:///app.db
   DEBUG=True
   ```

## Utilisation

1. **Initialiser la base de données**
   ```bash
   python init_db.py
   ```

2. **Lancer l'application**
   ```bash
   python app.py
   ```

3. **Accéder à l'application**
   Ouvrir http://localhost:5000

## API

### GET /api/tasks
Retourne les tâches de l'utilisateur connecté.

**Paramètres :**
- `status` : `pending`, `completed`, ou `all` (défaut)
- `search` : terme de recherche dans le titre
- `limit` : nombre maximum de résultats (défaut 50)

**Exemple :**
```bash
curl "http://localhost:5000/api/tasks?status=pending&limit=10"
```

**Réponse :**
```json
[
  {
    "id": 1,
    "title": "Apprendre Flask",
    "description": "Suivre le module 2",
    "completed": false,
    "created_at": "2024-01-15T10:30:00Z"
  }
]
```

## Tests

```bash
# Lancer tous les tests
python -m pytest

# Avec couverture
coverage run -m pytest
coverage report
```

## Structure du projet

```
├── app.py              # Application principale
├── config.py           # Configuration
├── models/             # Modèles de données
├── repositories/       # Accès base de données
├── routes/             # Définition des routes
├── templates/          # Templates HTML
├── static/             # CSS/JS/Images
├── tests/              # Tests unitaires
├── utils/              # Fonctions utilitaires
└── requirements.txt    # Dépendances
```

## Troubleshooting

### "Module not found"
Assurez-vous d'avoir activé l'environnement virtuel :
```bash
source venv/bin/activate
```

### "Database error"
Vérifiez que le fichier de base de données existe et les permissions :
```bash
ls -la app.db
```

### "CSRF token invalid"
Videz les cookies du navigateur ou redémarrez la session.

### "Login doesn't work"
Vérifiez :
1. Que l'utilisateur existe en base
2. Que le mot de passe est correct
3. Que `SECRET_KEY` est défini

## Sécurité

- Mots de passe hashés avec Werkzeug
- Protection CSRF sur tous les formulaires
- Sessions sécurisées
- Validation côté serveur
- Tests de sécurité automatisés

## Contribution

1. Fork le projet
2. Créer une branche feature
3. Commiter les changements
4. Push et créer une PR

## Licence

MIT
```

**Runbook - Guide de dépannage**
```markdown
# Runbook - Guide de dépannage

## Problèmes courants et solutions

### Application ne démarre pas

**Symptôme :** Erreur au lancement de `python app.py`

**Solutions :**
1. Vérifier l'environnement virtuel :
   ```bash
   source venv/bin/activate
   pip list | grep flask
   ```

2. Vérifier les variables d'environnement :
   ```bash
   echo $SECRET_KEY
   ```

3. Vérifier la base de données :
   ```bash
   python -c "import sqlite3; sqlite3.connect('app.db')"
   ```

### Erreur 500

**Symptôme :** Page d'erreur interne

**Solutions :**
1. Activer le debug :
   ```bash
   export DEBUG=True
   python app.py
   ```

2. Consulter les logs de l'application

3. Vérifier la base de données :
   ```bash
   sqlite3 app.db "SELECT * FROM users LIMIT 1;"
   ```

### Login impossible

**Symptôme :** Login rejeté malgré bonnes credentials

**Solutions :**
1. Vérifier l'utilisateur en base :
   ```bash
   sqlite3 app.db "SELECT username FROM users;"
   ```

2. Reset le mot de passe :
   ```python
   from werkzeug.security import generate_password_hash
   print(generate_password_hash('newpassword'))
   # UPDATE users SET password_hash = '...' WHERE username = '...'
   ```

3. Vérifier la fonction de hash

### Tests échouent

**Symptôme :** `pytest` retourne des erreurs

**Solutions :**
1. Lancer un test spécifique :
   ```bash
   python -m pytest tests/test_auth.py::TestAuth::test_login_success -v
   ```

2. Vérifier la configuration de test

3. Vérifier les dépendances de test :
   ```bash
   pip install pytest coverage
   ```
```

**Exercices**
- Ex1 : section "Installation"
- Ex2 : section "Lancer"
- Ex3 : section "Gérer erreurs"

**QCM**
1) README aide onboarding. (A)
2) Runbook aide debug. (A)
3) Docs sont importantes. (A)

**Devoir**
- Rédiger un runbook de 10 lignes (cas fréquents).

---

## Cours 24 - Qualité : style et docstrings
**Objectifs**
- docstrings
- noms cohérents
- fonctions courtes

**Leçon (30 min - détaillée)**
PEP 8 et les docstrings améliorent considérablement la qualité du code.

**PEP 8 - Style guide Python**
```python
# ✅ Bon style
def calculate_total_price(items, tax_rate=0.20):
    """
    Calcule le prix total avec taxes.
    
    Args:
        items (list): Liste de dictionnaires avec 'price' et 'quantity'
        tax_rate (float): Taux de taxe (défaut 20%)
    
    Returns:
        float: Prix total TTC
    
    Raises:
        ValueError: Si items est vide ou mal formé
    """
    if not items:
        raise ValueError("La liste d'articles ne peut pas être vide")
    
    subtotal = sum(item['price'] * item['quantity'] for item in items)
    return subtotal * (1 + tax_rate)

# ❌ Mauvais style
def calc_tot(itms,tax=0.2):
    if not itms: raise ValueError("empty")
    subtot=sum(i['price']*i['quantity']for i in itms)
    return subtot*(1+tax)
```

**Docstrings complètes**
- **Description** : Ce que fait la fonction
- **Args** : Paramètres avec types et descriptions
- **Returns** : Valeur de retour avec type
- **Raises** : Exceptions levées

**Noms significatifs**
```python
# ✅ Bon
def authenticate_user(username, password):
    pass

def validate_task_data(title, description, due_date):
    pass

# ❌ Mauvais
def auth(u, p):
    pass

def check(t, d, dd):
    pass
```

**Fonctions courtes et focalisées**
- Une fonction = une responsabilité
- Maximum 20-30 lignes
- Si plus longue, la diviser

**Outils de qualité**
```bash
# Vérifier le style
pip install flake8
flake8 app.py

# Formatter automatiquement
pip install black
black app.py

# Vérifier les types (optionnel)
pip install mypy
mypy app.py
```

**Exercices**
- Ex1 : docstring 3 fonctions
- Ex2 : renommer variables mal nommées

**QCM**
1) Docstring sert à : A) intention. (A)
2) Noms clairs => maintenance. (A)
3) Style constant : A) oui. (A)

**Devoir**
- Mettre 5 docstrings au minimum.

---

## Cours 25 - Performances simples
**Objectifs**
- éviter requêtes inutiles
- comprendre caching simple (concept)

**Leçon (30 min - détaillée)**
Les optimisations de performance doivent être mesurées et justifiées.

**Éviter le N+1 queries**
```python
# ❌ Problématique - N+1 queries
@app.route('/tasks')
def list_tasks():
    user_id = session['user_id']
    
    # 1 requête pour les tâches
    tasks = db.execute("SELECT * FROM tasks WHERE user_id = ?", (user_id,))
    
    # N requêtes pour les détails (problème !)
    for task in tasks:
        task.details = db.execute("SELECT * FROM task_details WHERE task_id = ?", (task.id,))
    
    return render_template('tasks.html', tasks=tasks)

# ✅ Optimisé - 1 ou 2 requêtes max
@app.route('/tasks')
def list_tasks():
    user_id = session['user_id']
    
    # Jointure ou requête optimisée
    tasks = db.execute("""
        SELECT t.*, td.* 
        FROM tasks t 
        LEFT JOIN task_details td ON t.id = td.task_id 
        WHERE t.user_id = ?
    """, (user_id,))
    
    return render_template('tasks.html', tasks=tasks)
```

**Cache simple (concept)**
```python
# Cache en mémoire (simple)
task_cache = {}

def get_task_with_cache(task_id):
    if task_id in task_cache:
        return task_cache[task_id]
    
    task = db.execute("SELECT * FROM tasks WHERE id = ?", (task_id,))
    task_cache[task_id] = task
    return task

# Invalider le cache lors des modifications
def update_task(task_id, data):
    db.execute("UPDATE tasks SET ... WHERE id = ?", (task_id, data))
    task_cache.pop(task_id, None)  # Invalider
```

**Mesurer les performances**
```python
import time

def measure_performance(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"{func.__name__} took {end - start:.2f} seconds")
        return result
    return wrapper

@measure_performance
def list_tasks():
    # Code à mesurer
    pass
```

**Quand optimiser ?**
- Seulement si c'est un vrai problème
- Mesurer avant et après
- Commencer par les goulots d'étranglement évidents

**Exercices**
- Ex1 : vérifier nombre de requêtes lors d'une liste
- Ex2 : ajuster query si besoin

**QCM**
1) Performance = moins de travail inutile. (A)
2) N+1 = risque. (A)
3) Optimiser sans complexifier. (A)

**Devoir**
- Identifier 1 optimisation possible dans ton code.

---

## Cours 26 - Accessibilité basique
**Objectifs**
- labels sur inputs
- aria-live pour messages

**Leçon (30 min - détaillée)**
L'accessibilité rend l'application utilisable par tous, y compris les personnes en situation de handicap.

**Labels explicites**
```html
<!-- ✅ Bon -->
<label for="task-title">Titre de la tâche :</label>
<input type="text" id="task-title" name="titre" required>

<!-- ❌ Mauvais -->
<input type="text" name="titre" placeholder="Titre">
```

**Messages d'erreur accessibles**
```html
<div role="alert" aria-live="assertive" class="error-message">
    {{ error_message }}
</div>
```

**Navigation au clavier**
- Tous les éléments interactifs accessibles au Tab
- Indicateurs visuels de focus
- Raccourcis clavier logiques

**Contraste et lisibilité**
```css
/* Bon contraste */
.error-message {
    color: #dc3545; /* Rouge foncé */
    background-color: #f8d7da; /* Fond clair */
}

/* Focus visible */
button:focus, input:focus {
    outline: 2px solid #007bff;
    outline-offset: 2px;
}
```

**ARIA - Attributes**
```html
<!-- Région de contenu principal -->
<main role="main" aria-labelledby="main-title">
    <h1 id="main-title">Mes tâches</h1>
    
    <!-- Statut pour les lecteurs d'écran -->
    <div aria-live="polite" aria-atomic="true">
        {{ flash_message }}
    </div>
    
    <!-- Liste de tâches -->
    <ul role="list" aria-label="Liste des tâches">
        {% for task in tasks %}
        <li role="listitem">
            <span aria-label="Titre de la tâche">{{ task.title }}</span>
            {% if task.completed %}
                <span aria-label="Tâche terminée">✓</span>
            {% endif %}
        </li>
        {% endfor %}
    </ul>
</main>
```

**Tests d'accessibilité**
- Utiliser le lecteur d'écran NVDA ou JAWS
- Tester uniquement au clavier (Tab, Entrée, Échap)
- Vérifier les contrastes avec des outils en ligne

**Exercices**
- Ex1 : améliorer templates add/edit
- Ex2 : vérifier que les messages d'erreur sont lisibles

**QCM**
1) Accessibilité = UX. (A)
2) aria-live : utile pour annonces. (A)
3) labels = compréhension. (A)

**Devoir**
- Lister 4 améliorations d'accessibilité.

---

## Cours 27 - UX formulaire
**Objectifs**
- limites & messages
- afficher erreurs sous champs

**Leçon (30 min - détaillée)**
Une bonne UX des formulaires guide l'utilisateur et prévient les erreurs.

**Messages d'erreur contextuels**
```html
<!-- templates/add_task.html -->
<form method="POST">
    <div class="form-group">
        <label for="titre">Titre de la tâche *</label>
        <input type="text" id="titre" name="titre" 
               value="{{ request.form.titre }}" 
               maxlength="100" required>
        {% if errors.titre %}
            <div class="error-message" role="alert">
                {{ errors.titre }}
            </div>
        {% endif %}
        <small class="help-text">3 à 100 caractères</small>
    </div>
    
    <button type="submit" class="btn btn-primary">
        Ajouter la tâche
    </button>
</form>
```

**Validation côté client + serveur**
```javascript
// Validation basique côté client
function validateForm() {
    const titre = document.getElementById('titre').value.trim();
    
    if (titre.length < 3) {
        showError('titre', 'Le titre doit contenir au moins 3 caractères');
        return false;
    }
    
    if (titre.length > 100) {
        showError('titre', 'Le titre ne peut pas dépasser 100 caractères');
        return false;
    }
    
    return true;
}

function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    const errorDiv = field.parentNode.querySelector('.error-message');
    
    if (errorDiv) {
        errorDiv.textContent = message;
        errorDiv.style.display = 'block';
    }
    
    field.focus();
}
```

**Améliorations UX**
- **Pré-remplissage** : Conserver les valeurs en cas d'erreur
- **Focus automatique** : Aller sur le premier champ en erreur
- **Indicateurs visuels** : Couleurs, icônes pour les états
- **Messages progressifs** : Montrer les erreurs au fur et à mesure
- **Limites claires** : Compteurs de caractères, formats attendus

**CSS pour les formulaires**
```css
.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: bold;
}

.form-group input {
    width: 100%;
    padding: 0.75rem;
    border: 2px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
}

.form-group input:focus {
    border-color: #007bff;
    outline: none;
}

.error-message {
    color: #dc3545;
    font-size: 0.875rem;
    margin-top: 0.25rem;
    display: none;
}

.help-text {
    color: #6c757d;
    font-size: 0.875rem;
    margin-top: 0.25rem;
}

.btn {
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
}

.btn-primary {
    background-color: #007bff;
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
}
```

**Exercices**
- Ex1 : afficher erreur titre invalide dans add
- Ex2 : afficher erreur dans edit

**QCM**
1) UX = guider. (A)
2) erreurs lisibles => confiance. (A)
3) pas d'erreur = mieux? non. (B)

**Devoir**
- Rédiger une maquette texte de ton écran add.

---

## Cours 28 - Logs & diagnostic
**Objectifs**
- apprendre à lire l'erreur
- logs sans exposer secrets

**Leçon (30 min - détaillée)**
Les logs sont essentiels pour déboguer et surveiller l'application.

**Configuration des logs**
```python
import logging
from logging.handlers import RotatingFileHandler

# Configuration basique
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

# Logger pour l'application
logger = logging.getLogger(__name__)

# Handler pour fichier avec rotation
file_handler = RotatingFileHandler('app.log', maxBytes=1024*1024, backupCount=5)
file_handler.setFormatter(logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
))
logger.addHandler(file_handler)
```

**Niveaux de log**
```python
# Debug - Informations détaillées pour le développement
logger.debug("Traitement de la tâche ID: %s", task_id)

# Info - Informations générales sur le fonctionnement
logger.info("Utilisateur %s s'est connecté", username)

# Warning - Situations potentiellement problématiques
logger.warning("Tentative de connexion échouée pour %s", username)

# Error - Erreurs qui ne bloquent pas l'application
logger.error("Erreur lors de la sauvegarde: %s", str(e))

# Critical - Erreurs graves
logger.critical("Base de données inaccessible")
```

**Logs dans l'application**
```python
@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    
    logger.info("Tentative de connexion pour utilisateur: %s", username)
    
    user = get_user_by_username(username)
    if not user:
        logger.warning("Utilisateur inexistant: %s", username)
        flash("Identifiants invalides", 'error')
        return redirect(url_for('login'))
    
    if not check_password_hash(user['password_hash'], password):
        logger.warning("Mot de passe incorrect pour: %s", username)
        flash("Identifiants invalides", 'error')
        return redirect(url_for('login'))
    
    logger.info("Connexion réussie pour: %s", username)
    session['user_id'] = user['id']
    session['username'] = user['username']
    
    return redirect(url_for('dashboard'))
```

**Logs d'erreurs**
```python
@app.errorhandler(500)
def internal_error(error):
    logger.exception("Erreur 500: %s", str(error))
    return render_template('500.html'), 500

def create_task(title, user_id):
    try:
        # Code de création
        logger.info("Tâche créée: %s pour utilisateur %s", title, user_id)
        return task_id
    except Exception as e:
        logger.error("Erreur lors de la création de tâche: %s", str(e))
        raise
```

**Bonnes pratiques**
- Ne pas logger les mots de passe ou données sensibles
- Utiliser des niveaux appropriés
- Inclure le contexte (user_id, action)
- Rotation des fichiers de log
- Monitoring des logs en production

**Exercices**
- Ex1 : ajouter logger simple (print ou logging)
- Ex2 : capturer exceptions DB et retourner message propre

**QCM**
1) Logs servent à debug. (A)
2) Ne pas afficher secrets. (A)
3) 500 doit guider. (A)

**Devoir**
- Écrire 3 exemples de logs utiles.

---

## Cours 29 - Hardening (notions)
**Objectifs**
- limiter abus (rate-limit concept)
- taille champs / brut input

**Leçon (30 min - détaillée)**
Le hardening consiste à durcir l'application contre les abus et attaques.

**Rate limiting - Limiter les requêtes**
```python
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

limiter = Limiter(
    app,
    key_func=get_remote_address,
    default_limits=["200 per day", "50 per hour"]
)

@app.route('/login', methods=['POST'])
@limiter.limit("5 per minute")
def login():
    # Code de login
    pass

@app.route('/register', methods=['POST'])
@limiter.limit("3 per hour")
def register():
    # Code d'inscription
    pass
```

**Validation stricte des entrées**
```python
def sanitize_input(text):
    """Nettoie et valide l'entrée utilisateur."""
    if not text:
        return ""
    
    # Supprimer les caractères dangereux
    import re
    text = re.sub(r'[<>]', '', text)  # Supprimer < >
    text = text.strip()
    
    # Limiter la longueur
    if len(text) > 1000:
        raise ValueError("Texte trop long")
    
    return text

@app.route('/add', methods=['POST'])
@login_required
def add_task():
    titre = sanitize_input(request.form.get('titre', ''))
    
    # Validation métier
    if len(titre) < 3:
        flash("Titre trop court", 'error')
        return redirect(url_for('add'))
    
    # Création
    create_task(titre, session['user_id'])
    return redirect(url_for('tasks'))
```

**Protection contre les attaques courantes**
- **SQL Injection** : Utiliser les paramètres préparés (fait)
- **XSS** : Échapper le HTML (fait avec Jinja2)
- **CSRF** : Tokens anti-CSRF (fait)
- **Brute force** : Rate limiting et comptes temporaires bloqués
- **Input validation** : Valider et nettoyer toutes les entrées

**Headers de sécurité**
```python
@app.after_request
def add_security_headers(response):
    response.headers['X-Content-Type-Options'] = 'nosniff'
    response.headers['X-Frame-Options'] = 'DENY'
    response.headers['X-XSS-Protection'] = '1; mode=block'
    response.headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'
    return response
```

**Monitoring et alertes**
```python
# Surveiller les tentatives suspectes
@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    
    # Compter les échecs
    failure_key = f"login_failures_{username}"
    failures = int(session.get(failure_key, 0))
    
    if failures >= 5:
        logger.warning("Trop de tentatives pour %s", username)
        flash("Trop de tentatives. Réessayez plus tard.", 'error')
        return redirect(url_for('login'))
    
    # Tentative de connexion...
    if not success:
        session[failure_key] = failures + 1
    else:
        session.pop(failure_key, None)
```

**Exercices**
- Ex1 : limiter longueur formulaire (aussi en backend)
- Ex2 : refuser champs inattendus

**QCM**
1) Hardening = durcir. (A)
2) Limiter input => sécurité. (A)
3) Debug stacktrace en prod = mauvais. (A)

**Devoir**
- Décrire 3 risques et comment ton code réduit chacun.

---

## Cours 30 - Soutenance module 2
**Objectifs**
- présenter ce que tu as amélioré
- prouver via tests et demo
- checklist qualité avant livraison

**Leçon (30 min - détaillée)**
La soutenance est l'occasion de démontrer la qualité de ton travail.

**Préparation de la soutenance**
1. **Répétition** : Présenter devant un miroir ou des amis
2. **Timing** : Respecter le temps imparti (5-10 minutes)
3. **Démonstration** : Préparer des scénarios de test
4. **Questions** : Anticiper les questions du jury

**Structure de la présentation**
```
Introduction (1 minute)
├── Présentation du projet
├── Rappel du contexte (Module 1 → Module 2)
└── Objectifs du Module 2

Évolution technique (3-4 minutes)
├── Sécurité ajoutée (authentification, CSRF, validation)
├── Architecture améliorée (sessions, repository, tests)
├── Fonctionnalités nouvelles (login/logout, protection CRUD)
└── Qualité (tests, documentation, accessibilité)

Démonstration (3-4 minutes)
├── Inscription d'un utilisateur
├── Connexion/déconnexion
├── CRUD des tâches (avec protection)
├── Gestion des erreurs
├── API JSON
└── Tests automatisés

Conclusion (1 minute)
├── Défis rencontrés et solutions
├── Compétences acquises
├── Améliorations possibles
└── Perspectives
```

**Checklist avant soutenance**
- [ ] Application démarre sans erreur
- [ ] Base de données initialisée correctement
- [ ] Authentification fonctionne (login/logout)
- [ ] CRUD protégé (nécessite login)
- [ ] Protection CSRF active
- [ ] Validation des formulaires
- [ ] Messages d'erreur appropriés
- [ ] API JSON opérationnelle
- [ ] Tests passent (au minimum les principaux)
- [ ] Documentation à jour
- [ ] Interface utilisateur propre

**Conseils pour la présentation**
- **Parler clairement** : Articuler, pas trop vite
- **Montrer, ne pas dire** : Démontrer concrètement
- **Préparer des alternatives** : Si quelque chose ne marche pas
- **Rester positif** : Même sur les difficultés rencontrées
- **Connaître son code** : Être capable d'expliquer les choix techniques

**Critères d'évaluation typiques**
- **Fonctionnalités** : Toutes les exigences remplies
- **Sécurité** : Protection adéquate contre les vulnérabilités
- **Qualité du code** : Structure, lisibilité, tests
- **Interface** : Ergonomie et accessibilité
- **Présentation** : Clarté et démonstration convaincante

**Après la soutenance**
- Félicitations ! Module 2 terminé
- Réfléchir aux apprentissages
- Préparer le Module 3 avec ces nouvelles compétences

**Exercices**
- Ex1 : demo login/logout
- Ex2 : demo protection CRUD
- Ex3 : demo API GET /api/tasks
- Ex4 : lancer tests et expliquer résultats

**QCM**
1) Soutenance inclut : tests + demo + doc. (A)
2) CRUD protégé si login. (A)
3) API GET seulement. (A)

**Devoir (final)**
- Rédiger ton texte de soutenance (8-10 phrases) : problème, solution, sécurité, tests, ce que tu as appris.
```</content>
<parameter name="filePath">c:\Users\abdou\Desktop\new\docs\module-2-eleve.md