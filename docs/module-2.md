# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 2 (30 cours) - Application Flask pro : sessions, securite, tests

### Resume
Dans ce module, tu vas passer d'une mini-app qui marche a une application web **plus robuste** et **plus pro** :
- authentification (login / logout) avec **sessions**
- protection des formulaires (anti-CSRF simple)
- validation stricte cote serveur
- gestion coherent des erreurs et des messages a l'utilisateur
- tests automatiques (niveau “unitaire” + test client Flask)

### Rappel du projet fil rouge (on conserve “Taches”)
Tu vas repartir de la base du Module 1 et ajouter :
1. un systeme de comptes utilisateur
2. une barre “Bonjour, <nom>” (et bouton logout)
3. protection des actions (ajouter / editer / supprimer) derriere `login`
4. `GET /api/tasks` reste disponible, mais les actions via formulaire sont protegees

### Hypotheses
- Python 3.11+
- Flask
- SQLite (pour rester simple)

---

## Planning (30 cours)
| Cours | Theme principal | Objectif du cours |
|---:|---|---|
| 1 | Repartir proprement | Mise a jour plan + verifier structure |
| 2 | Environnements & dependances | `venv` + `requirements.txt` |
| 3 | Config & secret key | `SECRET_KEY`, `DB_PATH`, env |
| 4 | Sessions Flask | comprendre cookies/sessions |
| 5 | Anti-CSRF simple | token cache en session |
| 6 | Validation serveur | erreurs 400 lisibles |
| 7 | Mot de passe : hash | `werkzeug.security` |
| 8 | Registre utilisateur | creation compte |
| 9 | Login utilisateur | verifier credentials |
| 10 | Logout | detruire session |
| 11 | Decorateur `login_required` | proteger routes |
| 12 | Flash messages | succes/erreur propres |
| 13 | Protection des formulaires | ajouter token anti-CSRF |
| 14 | Gestion erreurs 404/500 | pages propres |
| 15 | Schema SQLite utilisateurs | table `users` |
| 16 | Repository utilisateurs | couche DB separee |
| 17 | Tests Flask | test client + setup DB |
| 18 | Tests sur login | cas valide/invalide |
| 19 | Tests CSRF | rejet si token faux |
| 20 | Tests CRUD protege | create/edit/delete requires login |
| 21 | Ameliorer API GET tasks | filtre + tri + UX |
| 22 | Normaliser code | fonctions utilitaires |
| 23 | Documentation pro | README + “runbook” |
| 24 | Qualite code | style + noms + docstrings |
| 25 | Performances simples | eviter N+1 (si utile) |
| 26 | Accessibilite basique | labels/aria
| 27 | UX formulaire | messages + champs limites |
| 28 | Logs & diagnostic | erreurs lisibles (debug) |
| 29 | Hardening | limites, rate-limit light (concept) |
| 30 | Soutenance module 2 | demo + checklist |

---

## Cours 1 - Repartir proprement (base du module)
**Objectifs**
- comprendre ce qu'on va modifier dans le projet
- re-verifier structure `app.py / routes.py / db.py / templates`
- repartir avec une “liste de verification”

**Lecon (10 min)**
1. Proprete = structure stable
2. Securite = validation + gestion sessions
3. Tests = verifier automatiquement les changements

**Exercices (45 min)**
- Ex1 : recopier le projet du Module 1 dans un nouveau dossier `module2/`.
- Ex2 : verifier que `GET /` et `POST /add` fonctionnent (au moins en local).
- Ex3 : creer un dossier `tests/` et un fichier `test_smoke.py` vide.

**QCM (3 questions)**
1) Une “propreté” de projet aide surtout a : A) ajouter plus vite des features B) perdre du temps C) supprimer tests. (A)
2) Les tests servent a : A) eviter les regressions B) faire joli C) supprimer logs. (A)
3) La securite web de base repose surtout sur : A) validation + sessions B) themes C) HTML uniquement. (A)

**Devoir (5 min)**
- Ecrire une checklist en 8 points pour prouver que ton application est “propre” (structure, config, routes, templates, erreurs).

---

## Cours 2 - Environnements & dependances
**Objectifs**
- creer `venv`
- utiliser `pip freeze` (ou `pipreqs` si tu veux) pour figer
- comprendre ce que signifie “reproductibilite”

**Lecon (10 min)**
- un projet doit tourner pareil chez toi et chez l'eleve

**Exercices (45 min)**
- Ex1 : creer `venv` et installer Flask.
- Ex2 : generer `requirements.txt` (au minimum `flask`).
- Ex3 : relancer l'app avec un environnement propre.

**QCM**
1) `venv` sert a : A) isoler B) compresser C) chiffrer. (A)
2) `requirements.txt` sert a : A) figer les versions B) supprimer modules C) cacher erreurs. (A)
3) Reproductibilite signifie : A) meme resultats B) decorer C) oublier tests. (A)

**Devoir**
- Ajouter une section “Setup” dans le README module 2 : commande exacte pour lancer.

---

## Cours 3 - Config & secret key
**Objectifs**
- comprendre `SECRET_KEY`
- eviter les secrets en dur
- parametres via env variables

**Lecon (10 min)**
- `SECRET_KEY` = socle des sessions Flask

**Exercices (45 min)**
- Ex1 : ajouter `SECRET_KEY` dans `.env` (ou variables env).
- Ex2 : faire lire `DB_PATH` et `SECRET_KEY` dans une config `config.py`.
- Ex3 : afficher (sans secrets) des informations de debug.

**QCM**
1) `SECRET_KEY` est utilise pour : A) sessions et cookies B) CSS C) DB uniquement. (A)
2) Ne pas coder en dur : A) eviter fuite B) ralentir C) compliquer. (A)
3) `env` sert a : A) config externe B) images C) SQL. (A)

**Devoir**
- Proposer 3 variables d'environnement pour ton module 2 (sans secrets sensibles).

---

## Cours 4 - Sessions Flask : le concept
**Objectifs**
- comprendre qu'une session est associee a un cookie
- utiliser `session[...]`
- savoir ce qui est stocke cote serveur vs cookie

**Lecon (10 min)**
- la session permet de “savoir qui tu es” sur plusieurs requetes

**Exercices (45 min)**
- Ex1 : creer un route `/debug-session` qui affiche une valeur de session (sans secrets).
- Ex2 : route `/set-name` qui met `session["name"] = ...`
- Ex3 : route `/clear` qui supprime la session.

**QCM**
1) Session = A) memoire par utilisateur B) API GET C) CSS. (A)
2) Pour tester sessions : A) ouvrir plusieurs pages B) changer theme C) Docker. (A)
3) Un cookie permet de : A) reconnaitre le navigateur B) faire SQL C) generer PDF. (A)

**Devoir**
- Rediger 5 lignes expliquant comment `login` va utiliser les sessions dans ton projet.

---

## Cours 5 - Anti-CSRF simple (didactique)
**Objectifs**
- comprendre pourquoi CSRF est un risque
- generer un token anti-CSRF
- valider token sur les POST

**Lecon (10 min)**
- CSRF = une requete malicieuse tente d’agir a ta place via le navigateur

**Exercices (45 min)**
- Ex1 : creer une fonction `get_csrf_token()` qui stocke un token dans `session`.
- Ex2 : injecter token dans un template de formulaire via `<input type="hidden" ...>`.
- Ex3 : verifier token dans les routes POST (sinon 400).

**QCM**
1) CSRF vise : A) actions via navigateur deja authentifie B) CSS C) JSON. (A)
2) Le token CSRF doit etre : A) coherent entre session et formulaire B) aleatoire sans controle C) cache CSS. (A)
3) En cas de token invalide : A) 400 B) 200 C) rediriger vers page 404. (A)

**Devoir**
- Ecrire un exemple de 2 formulaires avec token (ajout + edit).

---

## Cours 6 - Validation serveur (et erreurs lisibles)
**Objectifs**
- valider `titre` (longueur, type)
- valider `echeance` (format optionnel)
- retourner des erreurs “humaines”

**Lecon (10 min)**
- validation serveur = “last line of defense”

**Exercices (45 min)**
- Ex1 : refactoriser `validate_title`.
- Ex2 : creer `validate_echeance(date_str)` (retourner `None` si vide, sinon string valide).
- Ex3 : rendre une page avec message erreur en cas d'invalidite.

**QCM**
1) Validation serveur sert a : A) robustesse B) joli C) supprimer tests. (A)
2) Une erreur 400 signifie : A) input client invalide B) serveur ok C) page introuvable. (A)
3) Validation limite aussi les bugs : A) oui B) non C) jamais. (A)

**Devoir**
- Lister 6 champs d’input a valider dans ton mini-projet Taches.

---

## Cours 7 - Hash de mot de passe
**Objectifs**
- utiliser `generate_password_hash`
- utiliser `check_password_hash`
- stocker seulement le hash en DB

**Lecon (10 min)**
- ne jamais stocker de mots de passe en clair

**Exercices (45 min)**
- Ex1 : creer une fonction `hash_password(pw)`.
- Ex2 : creer une fonction `verify_password(pw, hash)`.
- Ex3 : tester : meme mot de passe => True, autre => False.

**QCM**
1) Hash = A) transformation irreversible B) CSS C) JSON. (A)
2) Le hash en DB signifie : A) securite B) fuite C) compression. (A)
3) `check_password_hash` sert a : A) verifier authentification B) SQL C) PDF. (A)

**Devoir**
- Definir 3 regles simples sur le mot de passe (min longueur, etc.) et comment les valider.

---

## Cours 8 - Registre utilisateur
**Objectifs**
- creer endpoint `POST /register`
- insérer un user dans SQLite
- gerer doublons (username existe)

**Lecon (10 min)**
- creer un compte propre = validation + gestion exceptions DB

**Exercices (45 min)**
- Ex1 : creer page `register.html`
- Ex2 : route `POST /register` avec validation
- Ex3 : route `/login` affiche message “compte cree”

**QCM**
1) Doublon username : A) erreur a gerer B) ignorer C) supprimer DB. (A)
2) Registration cree : A) record DB B) CSS C) PDF. (A)
3) Enregistrement doit : A) valider B) ne rien verifier C) stocker clair. (A)

**Devoir**
- Ecrire une strategie pour renvoyer une erreur lisible a l’utilisateur.

---

## Cours 9 - Login utilisateur
**Objectifs**
- vérifier identifiant + mot de passe
- creer la session
- rediriger correctement

**Lecon (10 min)**
- login = “preuve” que tu connais le mot de passe

**Exercices**
- Ex1 : `POST /login` qui charge user depuis DB
- Ex2 : si credentials invalides => 401 ou message
- Ex3 : si OK => `session["user_id"] = ...`

**QCM**
1) Session user_id sert a : A) identifier B) style C) images. (A)
2) credentials invalides : A) refuser B) accepter C) effacer DB. (A)
3) Redirection apres login : A) guider B) compliquer C) cacher. (A)

**Devoir**
- Ajouter une page “Mon profil” qui affiche username depuis session.

---

## Cours 10 - Logout
**Objectifs**
- nettoyer session
- eviter acces apres logout

**Lecon**
- logout = suppression des preuves de session

**Exercices**
- Ex1 : route `/logout` supprime `session.clear()`
- Ex2 : tester : apres logout, POST /add refuse

**QCM**
1) Logout = A) detruire session B) changer theme C) SQL update seulement. (A)
2) Apres logout, il faut : A) proteger B) laisser ouvert C) cacher. (A)
3) `session.clear()` sert a : A) effacer variables B) CSS C) DB. (A)

**Devoir**
- Ecrire un paragraphe “ce que l’utilisateur voit” quand il est logout.

---

## Cours 11 - Decorateur `login_required`
**Objectifs**
- factoriser la protection
- simplifier les routes

**Lecon**
- un decorateur = une securite reusable

**Exercices**
- Ex1 : creer `login_required` (si pas login => redirect `/login`)
- Ex2 : ajouter decorateur sur `/add`, `/edit`, `/delete`, `/toggle`

**QCM**
1) decorateur sert a : A) reutiliser B) CSS C) DB uniquement. (A)
2) Protect route signifie : A) require login B) skip CSRF C) ignore validation. (A)
3) Redirect apres non-login : A) oui B) non C) 404. (A)

**Devoir**
- Lister les routes a proteger (au moins 5).

---

## Cours 12 - Flash messages
**Objectifs**
- utiliser `flash()` + template
- afficher messages success/error

**Lecon**
- flash = message temporaire pour la prochaine page

**Exercices**
- Ex1 : “Compte cree” apres register
- Ex2 : “Tache ajoutee” apres add
- Ex3 : “Tache supprimee” apres delete

**QCM**
1) Flash messages servent a : A) feedback utilisateur B) cacher erreurs C) PDF. (A)
2) Flash est temporaire : A) oui B) non C) jamais. (A)
3) Template lit flash : A) yes B) no C) CSS only. (A)

**Devoir**
- Ajouter un bloc HTML standard “messages” dans `base.html`.

---

## Cours 13 - Protection des formulaires (CSRF partout)
**Objectifs**
- injecter le token partout (add/edit/toggle/delete)
- valider sur chaque POST

**Lecon**
- la securite doit etre coherente : sinon certains POST restent exposés

**Exercices**
- Ex1 : ajouter hidden csrf token dans templates
- Ex2 : simuler token incorrect => 400

**QCM**
1) CSRF doit etre : A) sur chaque formulaire POST B) un seul. (A)
2) Sinon : A) risque reste B) aucun C) CSS change. (A)
3) Reponse 400 : A) correct B) cachée C) redirect. (A)

**Devoir**
- Faire une matrice “formulaire -> route -> verification CSRF”.

---

## Cours 14 - Gestion erreurs 404/500 (propre)
**Objectifs**
- pages 404/500
- messages lisibles

**Lecon**
- UX erreur = proteger la confiance de l’utilisateur

**Exercices**
- Ex1 : page 404 pour routes inconnues
- Ex2 : simuler 500 pour voir rendu (debug off)

**QCM**
1) 404 = ressource inexistante B) erreur DB C) paiement. (A)
2) 500 doit : A) guider sans exposer B) cacher logs complet C) afficher stacktrace. (A)
3) Error pages = UX. (A)

**Devoir**
- Ecrire 2 phrases pour ton template 500.

---

## Cours 15 - Schema SQLite utilisateurs
**Objectifs**
- creer table users
- contraintes (username unique)

**Lecon**
- schema = contrat

**Exercices**
- Ex1 : `CREATE TABLE users`
- Ex2 : `username UNIQUE`

**QCM**
1) UNIQUE utile pour : A) doublons B) suppression C) CSS. (A)
2) Table users contient : A) identifiant + hash B) HTML C) CSS. (A)
3) Schema doit etre stable : A) oui B) non C) jamais. (A)

**Devoir**
- Lister 4 colonnes utiles et pourquoi.

---

## Cours 16 - Repository utilisateurs
**Objectifs**
- separation logique DB (users_repo)
- re-utiliser validation

**Lecon**
- repository = testes facilement

**Exercices**
- Ex1 : `get_user_by_username(username)`
- Ex2 : `create_user(username, password_hash)`

**QCM**
1) Repository sert a : A) isoler SQL B) CSS C) templates. (A)
2) Separer aide : A) maintenir B) dupliquer C) casser. (A)
3) SQL parametré : A) oui B) non C) jamais. (A)

**Devoir**
- Refactoriser 1 fonction DB de Module 1 dans un repository separé (meme principe).

---

## Cours 17 - Tests Flask : approche
**Objectifs**
- creer tests avec `app.test_client()`
- initialiser DB de test

**Lecon (10 min)**
- tests = “contrat” exécutable

**Exercices**
- Ex1 : smoke test `GET /` renvoie 200
- Ex2 : test setup DB temporaire (fichier sqlite dans tests/)

**QCM**
1) Test client Flask : A) simule requetes HTTP B) PDF C) CSS. (A)
2) DB test : A) isoler B) partager C) nettoyer jamais. (A)
3) Smoke test sert a : A) detecter crash B) beautifier. (A)

**Devoir**
- Ecrire 3 cas de test “attendus” sur login.

---

## Cours 18 - Tests login
**Objectifs**
- tester login valide et invalide

**Exercices**
- Ex1 : login avec user existant => redirect /profile
- Ex2 : mauvais mdp => message erreur
- Ex3 : utilisateur inexistant => message erreur

**QCM**
1) Tester invalide : A) oui B) non C) ignore. (A)
2) Login valide => session ok : A) yes B) no C) unknown. (A)
3) Tests evitent regressions : A) oui. (A)

**Devoir**
- Ecrire pseudo-code de tes 3 tests.

---

## Cours 19 - Tests CSRF
**Objectifs**
- prouver que CSRF rejette

**Exercices**
- Ex1 : enregistrer token via GET formulaire
- Ex2 : envoyer POST avec token modifié => 400

**QCM**
1) CSRF test montre : A) securite B) CSS C) PDF. (A)
2) Token invalide => 400 : A) oui. (A)
3) Token valide => action : A) oui. (A)

**Devoir**
- Documenter la methode pour obtenir token dans un test (2 lignes).

---

## Cours 20 - Tests CRUD protege
**Objectifs**
- create/edit/delete requires login

**Exercices**
- Ex1 : sans login => POST /add redirige /login
- Ex2 : avec login => crée une tache
- Ex3 : delete supprime (vérifier DB)

**QCM**
1) Protection CRUD : A) login required. (A)
2) Vérifier DB : A) oui. (A)
3) tests CRUD : A) coeur. (A)

**Devoir**
- Lister les routes CRUD a tester.

---

## Cours 21 - Ameliorer API GET /api/tasks
**Objectifs**
- filtre fait côté serveur
- rester en GET uniquement
- nettoyer API payload

**Lecon**
- une API stable rend l'app facile

**Exercices**
- Ex1 : `GET /api/tasks?done=true` renvoie uniquement terminees
- Ex2 : trier par `created_at` ou `id`
- Ex3 : renvoyer schema JSON clair

**QCM**
1) Filtre dans API : A) réduit front logic. (A)
2) GET only : A) simplifie. (A)
3) payload clair : A) oui. (A)

**Devoir**
- Ecrire 2 exemples de JSON attendus dans le README.

---

## Cours 22 - Normaliser code
**Objectifs**
- refactorer duplication
- helpers : parse, validation, erreurs

**Exercices**
- Ex1 : créer fonction `_handle_form_error(...)`
- Ex2 : factoriser `_parse_done_param`

**QCM**
1) Normaliser = réduire duplication. (A)
2) Helpers aident. (A)
3) Moins de code = moins de bugs. (A)

**Devoir**
- Donner un exemple de duplication dans ton code Module 1 et comment tu l’élimines.

---

## Cours 23 - Documentation pro (README + runbook)
**Objectifs**
- README complet
- runbook : “si ca ne marche pas, fait ceci”

**Exercices**
- Ex1 : section “Installation”
- Ex2 : section “Lancer”
- Ex3 : section “Gérer erreurs”

**QCM**
1) README aide onboarding. (A)
2) Runbook aide debug. (A)
3) Docs sont importantes. (A)

**Devoir**
- Rédiger un runbook de 10 lignes (cas fréquents).

---

## Cours 24 - Qualite : style et docstrings
**Objectifs**
- docstrings
- noms cohérents
- fonctions courtes

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

## Cours 26 - Accessibilite basique
**Objectifs**
- labels sur inputs
- aria-live pour messages

**Exercices**
- Ex1 : améliorer templates add/edit
- Ex2 : vérifier que les messages d'erreur sont lisibles

**QCM**
1) Accessibilité = UX. (A)
2) aria-live : utile pour annonces. (A)
3) labels = compréhension. (A)

**Devoir**
- Lister 4 améliorations d’accessibilité.

---

## Cours 27 - UX formulaire
**Objectifs**
- limites & messages
- afficher erreurs sous champs

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

**Exercices**
- Ex1 : ajouter logger simple (print ou logging)
- Ex2 : capturer exceptions DB et retourner message propre

**QCM**
1) Logs servent à debug. (A)
2) Ne pas afficher secrets. (A)
3) 500 doit guider. (A)

**Devoir**
- Ecrire 3 exemples de logs utiles.

---

## Cours 29 - Hardening (notions)
**Objectifs**
- limiter abus (rate-limit concept)
- taille champs / brut input

**Exercices**
- Ex1 : limiter longueur formulaire (aussi en backend)
- Ex2 : refuser champs inattendus

**QCM**
1) Hardening = durcir. (A)
2) Limiter input => securite. (A)
3) Debug stacktrace en prod = mauvais. (A)

**Devoir**
- Décrire 3 risques et comment ton code réduit chacun.

---

## Cours 30 - Soutenance module 2
**Objectifs**
- présenter ce que tu as amélioré
- prouver via tests et demo
- checklist qualité avant livraison

**Lecon**
- un projet réussi se démontre

**Exercices**
- Ex1 : demo login/logout
- Ex2 : demo protection CRUD
- Ex3 : demo API GET /api/tasks
- Ex4 : lancer tests et expliquer résultats

**QCM**
1) Soutenance inclut : tests + demo + doc. (A)
2) CRUD protege si login. (A)
3) API GET seulement. (A)

**Devoir (final)**
- Rédiger ton texte de soutenance (8-10 phrases) : problème, solution, sécurité, tests, ce que tu as appris.

---

## Projet fil rouge - Corrige final (Taches sécurisé, Module 2)
Le code “version corrigee” (login/register, sessions, CSRF, protection des actions, tests) est disponible ici :
`docs/module-2-solution-taches/`

Contenu principal :
- `app.py` (point d'entree)
- `routes.py` (routes web + API `GET /api/tasks` publique)
- `db.py` (SQLite users + tasks)
- `security.py` (hash/verify mdp)
- `templates/` (Jinja2 : formulaires avec token CSRF)
- `static/style.css`
- `tests/test_auth.py` (unittest)

Lancer :
```bash
cd docs\\module-2-solution-taches
pip install -r requirements.txt
python app.py
```

