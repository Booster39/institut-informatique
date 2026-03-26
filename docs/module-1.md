# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 1 (30 cours) - Les fondations Python + 1er site en Flask

### Resume
Ce module pose les bases pour ecrire un programme Python propre, comprendre comment le web fonctionne (HTTP), et construire une premiere application web en Python avec `Flask` et `SQLite`.

### Hypotheses (a valider)
- Python `3.11+`
- Editeur : VS Code
- Framework web : `Flask` (avec templates `Jinja2`)
- Base de donnee : `SQLite` (simple, sans installation extra)

### Rythme
- 4 cours par semaine
- 30 cours pour ce module (environ 7 semaines et demie)
- Chaque cours dure 1 heure : theorie courte, demontation, exercices, QCM, devoir

---

## Projet fil rouge (a construire tout au long du module)
**Mini-app "Taches"** :
- une page liste des taches
- creation d'une tache via formulaire
- edition/suppression
- stockage dans `SQLite`
- une route API en JSON (`/api/tasks`)
- une interface plus agreable en HTML/CSS

Livrable final (cours 30) : app complete + README + export de quelques captures ecran.

---

## Planning (30 cours)
| Cours | Theme principal | Livrable approche |
|---:|---|---|
| 1 | Demarrer et apprendre efficacement | Environnement pret |
| 2 | Variables et types | Script Python de base |
| 3 | Conditions | Mini-regles (si/alors) |
| 4 | Boucles | Parcours de donnees |
| 5 | Fonctions | Utilitaires reutilisables |
| 6 | Listes et dictionnaires | Traitement de structures |
| 7 | Chaines de caracteres | Formatage + nettoyage |
| 8 | Fichiers + JSON | Export/import |
| 9 | Exceptions | Erreurs gerees proprement |
| 10 | Classes (bases) | Objet "Tache" |
| 11 | HTTP + Flask hello | 1 route web |
| 12 | Routage GET/POST | Formulaire vers serveur |
| 13 | Templates Jinja | HTML dynamique |
| 14 | Validation simple | Site robuste |
| 15 | Pages 404/erreurs | UX des erreurs |
| 16 | Separation front/back | Structure projet claire |
| 17 | CRUD en memoire | Taches sans DB |
| 18 | SQLite (schema) | Table tasks |
| 19 | CRUD SQLite | Operations persistantes |
| 20 | Organisation en modules | Code maintenable |
| 21 | API JSON | `/api/tasks` |
| 22 | Seecurite basique | Parametres + hygiene web |
| 23 | Tests simples | Tests du modele |
| 24 | CSS pour app | Mise en page propre |
| 25 | Composants UI | Formulaire + boutons |
| 26 | `fetch` (AJAX light) | Maj sans reload |
| 27 | Etat client | Filtres simples |
| 28 | Config & env variables | Mode dev facile |
| 29 | Qualite & documentation | README et style |
| 30 | Projet final + soutenance | App finalisee |

---

## Cours 1 - Demarrer et comprendre la logique
**Objectifs**
- Comprendre ce qu'est un "programme" et comment apprendre pas a pas
- Installer et lancer Python/VS Code
- Ecrire le premier script et le relancer proprement

**Lecon (10 min)**
1. Algorithmes : "etapes" -> code
2. Feedback : execution -> correction
3. Outils : terminal, interpreter, editeur

**Exercices (45 min)**
- Ex1: creer un dossier `module1/cours1` et un fichier `main.py` qui affiche 3 lignes.
- Ex2: creer `calc.py` avec une fonction `addition(a,b)` puis un test simple dans `main.py`.
- Ex3 (bonus): afficher la date et un message.

**Corrige detaille (exercices)**

### Ex1 - Premier script
Objectif : executer un script et observer le feedback dans la console.

1) Cree `module1/cours1/main.py` avec :
```python
print("Bonjour !")
print("Bienvenue dans le cours 1.")
print("Tu progresseras avec des exercices progressifs.")
```
2) Lance :
```bash
python main.py
```

Ce que tu dois verifier :
- le script affiche exactement 3 lignes
- aucune erreur n'est levee

### Ex2 - Fonction `addition(a, b)` + test
Objectif : reutiliser du code via une fonction, puis tester rapidement.

Dans `module1/cours1/calc.py` :
```python
def addition(a, b):
    return a + b
```

Dans `module1/cours1/main.py` :
```python
from calc import addition

def test_addition():
    # Si un test echoue, Python leve une exception -> feedback immediat
    assert addition(2, 3) == 5
    assert addition(-1, 1) == 0
    print("Tests OK !")

if __name__ == "__main__":
    test_addition()
```

### Ex3 (bonus) - Date + message
Objectif : utiliser un module standard (`datetime`).

Exemple :
```python
from datetime import datetime

now = datetime.now()
print("Nous sommes le :", now.strftime("%d/%m/%Y"))
print("Bonne continuation, cours apres cours.")
```

**QCM (3 questions)**
1) Un programme sert surtout a : A) dessiner B) executer une suite d'operations C) stocker des images D) lancer un film. (Reponse: B)
2) Le feedback vient surtout de : A) l'orthographe B) l'execution et les erreurs C) la couleur du theme D) la taille de l'ecran. (Reponse: B)
3) `print()` est utilise pour : A) creer des routes web B) afficher dans la console C) interagir avec une base SQL D) compiler Java. (Reponse: B)

**Devoir (5 min)**
- Noter 5 difficultes rencontrees sur le premier lancement et comment tu les resoudras.

---

## Cours 2 - Variables et types de donnees
**Objectifs**
- Identifier les types : `int`, `float`, `str`, `bool`
- Comprendre `=` et la conversion de type
- Reconnaitre la difference texte vs nombre

**Lecon (10 min)**
- Variable = etiquette sur une valeur
- Types = "format" des valeurs

**Exercices (45 min)**
- Ex1: ecrire un script qui calcule `prix_total = prix_unitaire * quantite` avec affichage formate.
- Ex2: demander a l'utilisateur `age` et convertir en `int` (gerer si mauvais format).
- Ex3: creer une variable `nom` et construire une phrase avec concat ou f-string.

**Corrige detaille (exercices)**

### Ex1 - Calcul de `prix_total` + affichage formate
Objectif : multiplier puis afficher proprement (2 decimales).

```python
prix_unitaire = 12.50
quantite = 3

prix_total = prix_unitaire * quantite
print(f"Total: {prix_total:.2f} €")
```

### Ex2 - Saisir `age` -> `int` + gestion d'erreur
Objectif : ne pas planter si l'utilisateur ecrit autre chose qu'un nombre.

```python
while True:
    entree = input("Quel est ton age ? ")
    try:
        age = int(entree)
        if age < 0 or age > 120:
            print("Age invalide (entre 0 et 120).")
            continue
        print("Age enregistre :", age)
        break
    except ValueError:
        print("Tu dois saisir un entier. Exemple : 20")
```

### Ex3 - Variable `nom` et phrase (concat ou f-string)
Objectif : construire un texte lisible.

Avec f-string :
```python
nom = "Amina"
print(f"Bonjour {nom}, bienvenue !")
```

Avec concat :
```python
nom = "Amina"
phrase = "Bonjour " + nom + ", bienvenue !"
print(phrase)
```

**QCM**
1) Une `str` represente surtout : A) un nombre B) du texte C) une table SQL D) une requete HTTP. (B)
2) `3 + "4"` marche : A) oui B) non C) seulement en HTML D) seulement en SQL. (B)
3) `bool` peut etre : A) "oui" B) `True/False` C) 0/1 toujours D) jamais. (B)

**Devoir**
- Ecrire 3 exemples de conversions : `str->int`, `int->str`, `float->int`.

---

## Cours 3 - Conditions : si/alors
**Objectifs**
- Ecrire `if/elif/else`
- Utiliser `and/or/not`
- Passer de regles metier a code

**Lecon (10 min)**
- Une condition decide "chemin A" vs "chemin B"

**Exercices (45 min)**
- Ex1: determiner une note `>= 90` -> "A", `>= 75` -> "B" sinon "C".
- Ex2: verifier si un age est valide (ex: 0-120) et afficher un message.
- Ex3 (bonus): ecrire une fonction `est_majeur(age)` -> True/False.

**Corrige detaille (exercices)**

### Ex1 - Notes A / B / C
Objectif : transformer une regle (metier) en `if/elif/else`.

Exemple :
```python
note = int(input("Donne une note (0-100) : "))

if note >= 90:
    resultat = "A"
elif note >= 75:
    resultat = "B"
else:
    resultat = "C"

print("Resultat :", resultat)
```

### Ex2 - Age valide
Objectif : ecrire une condition claire et donner un message utilisateur.

Exemple :
```python
age = int(input("Donne ton age : "))

if 0 <= age <= 120:
    print("Age valide.")
else:
    print("Age invalide (doit etre entre 0 et 120).")
```

Option (plus robuste) :
- ajouter un `try/except` comme dans le cours 2 si l'utilisateur peut ecrire autre chose qu'un nombre

### Ex3 (bonus) - Fonction `est_majeur(age)`
Objectif : reutiliser une logique sous forme de fonction.

```python
def est_majeur(age):
    return age >= 18

print(est_majeur(17))  # False
print(est_majeur(18))  # True
print(est_majeur(25))  # True
```

**QCM**
1) `elif` sert a : A) finir une boucle B) ajouter un autre cas conditionnel. (B)
2) `and` signifie : A) ou B) et. (B)
3) `else` s'executera si : A) une condition precedente est vraie B) aucune condition precedente n'est vraie. (B)

**Devoir**
- Ecrire 5 regles simples (ex: promo, etre majeur, type de ticket) et les transformer en conditions.

---

## Cours 4 - Boucles : for et while
**Objectifs**
- Parcourir une liste avec `for`
- Utiliser `while` pour repeter selon une condition
- Comprendre `range()`

**Lecon (10 min)**
- Une boucle repete "tant que" ou "pour chaque"

**Exercices (45 min)**
- Ex1: afficher les nombres de 1 a N.
- Ex2: calculer la somme d'une liste de nombres.
- Ex3: ecrire un compteur avec `while` qui s'arrete a une valeur cible.

**Corrige detaille (exercices)**

### Ex1 - Boucle `for` de 1 a N
Objectif : repeter une action pour chaque valeur.

```python
N = int(input("N = "))

for i in range(1, N + 1):
    print(i)
```

Rappel `range(1, N + 1)` :
- commence a 1
- s'arrete apres N (car la fin est exclusive)

### Ex2 - Somme d'une liste
Objectif : parcourir une structure et accumuler un resultat.

```python
nombres = [2, 5, 10]

total = 0
for x in nombres:
    total += x

print("Somme =", total)
```

Alternative (si tu comprends deja bien) : `sum(nombres)`, mais ici on apprend surtout la boucle.

### Ex3 - Compteur avec `while`
Objectif : repeter tant qu'une condition reste vraie.

```python
cible = int(input("Valeur cible = "))
compteur = 0

while compteur < cible:
    compteur += 1
    print("compteur =", compteur)

print("Termine !")
```

**QCM**
1) `for x in range(5)` genere : A) 5 nombres B) 6 nombres C) 0 a 4. (C)
2) Une boucle `while` s'arrete si : A) la condition devient fausse. (A)
3) La boucle sert principalement a : A) repetition. (A)

**Devoir**
- Implementer une fonction `compte_voyelles(texte)` avec boucle.

---

## Cours 5 - Fonctions : reutiliser le code
**Objectifs**
- Ecrire une fonction avec parametres et `return`
- Comprendre les variables locales
- Design : petites fonctions

**Lecon (10 min)**
- Diviser un probleme en sous-problemes

**Exercices (45 min)**
- Ex1: fonction `moyenne(liste)` -> float
- Ex2: fonction `est_pair(n)` -> bool
- Ex3 (bonus): `format_tache(titre, echeance)` -> str

**Corrige detaille (exercices)**

### Ex1 - Moyenne d'une liste
Objectif : calculer `somme / nombre d'elements`.

```python
def moyenne(liste):
    if not liste:
        raise ValueError("La liste ne doit pas etre vide.")
    return sum(liste) / len(liste)

print(moyenne([10, 20, 30]))  # 20.0
```

### Ex2 - Test paire/impair
Objectif : utiliser le modulo `%`.

```python
def est_pair(n):
    return n % 2 == 0

print(est_pair(4))  # True
print(est_pair(5))  # False
```

### Ex3 (bonus) - Formatter une tache
Objectif : construire une string lisible.

```python
def format_tache(titre, echeance):
    return f"- {titre} (echeance: {echeance})"

print(format_tache("Faire les exercices", "2026-04-01"))
```

**QCM**
1) `return` sert a : A) donner une valeur de sortie. (B)
2) Sans `return`, la fonction renvoie : A) rien (None). (A)
3) Une fonction aide a : A) reutiliser. (B)

**Devoir**
- Reduire le code du cours 4 en fonctions (au moins 2).

---

## Cours 6 - Listes et dictionnaires
**Objectifs**
- Manipuler `list` (ajouter, parcourir, filtrer)
- Comprendre `dict` (cle -> valeur)
- Choisir la structure adaptee

**Lecon (10 min)**
- List = collection ordonnee
- Dict = carte clee -> valeur

**Exercices (45 min)**
- Ex1: cree une liste de taches (strings) et affiche-les numerotees.
- Ex2: cree un dict `contact` avec `nom`, `email`, `ville` et affiche une phrase.
- Ex3 (bonus): dict de statistiques : nombre d'occurrences de chaque mot.

**QCM**
1) Dans une `list`, l'ordre est : A) important. (B)
2) Dans un `dict`, on accede a : A) une cle. (A)
3) Ajouter a une liste se fait souvent avec : A) `append`. (B)

**Devoir**
- Ecrire `compter_par_mot(texte)` -> dict (mot -> nombre).

---

## Cours 7 - Chaines de caracteres (str)
**Objectifs**
- Utiliser `lower()`, `strip()`, `split()`
- Construire des messages propres (f-string)
- Eviter les erreurs de type

**Lecon (10 min)**
- Une chaine est une suite de caracteres

**Exercices (45 min)**
- Ex1: nettoyer une entree (trim + lower)
- Ex2: compter les mots d'une phrase
- Ex3 (bonus): creer un slug simple (minuscules, espaces -> underscore)

**QCM**
1) `strip()` sert a : A) enlever les espaces debut/fin. (A)
2) `split()` sert a : A) diviser une chaine. (A)
3) `f"{x}"` sert a : A) formatage de chaine. (B)

**Devoir**
- Ecrire une fonction `nettoie_nom(nom)` -> nom propre.

---

## Cours 8 - Fichiers + JSON
**Objectifs**
- Lire/ecrire des fichiers texte
- Utiliser JSON pour stocker des donnees
- Comprendre `json.dump`/`json.load`

**Lecon (10 min)**
- Fichier = memoire persistante

**Exercices (45 min)**
- Ex1: creer `data.json` avec une liste de taches puis la relire
- Ex2: sauvegarder des resultats (ex: statistiques du cours 7)
- Ex3 (bonus): `sauvegarde_json(obj, chemin)`

**QCM**
1) `json.load()` s'utilise pour : A) lire depuis un fichier. (A)
2) JSON sert a : A) representer des structures. (B)
3) Ecrire dans un fichier consiste souvent a : A) ouvrir + ecrire + fermer. (A)

**Devoir**
- Ajouter un champ dans ton JSON : `cree_le` (date sous forme string).

---

## Cours 9 - Exceptions
**Objectifs**
- Comprendre `try/except`
- Decider quand gerer une erreur
- Proposer des messages utilisateur

**Lecon (10 min)**
- Une exception = "le probleme" qui remonte

**Exercices (45 min)**
- Ex1: demander un nombre tant que l'utilisateur ne saisit pas un entier
- Ex2: tester un parse JSON et afficher un message clair en cas d'erreur
- Ex3 (bonus): exception personnalisee `ValidationError`

**QCM**
1) `try` entoure : code potentiellement problematique. (B)
2) `except ValueError` attrape par exemple : erreurs de valeur numerique. (A)
3) Gerer une exception sert surtout a : rendre l'app robuste. (B)

**Devoir**
- Ajouter un controle de type a tes fonctions (ex: liste non vide).

---

## Cours 10 - Classes (bases)
**Objectifs**
- Creer une classe `Tache`
- Attributs + methodes
- Utiliser `__init__`

**Lecon (10 min)**
- Objet = donnees + comportements

**Exercices (45 min)**
- Ex1: classe `Tache` avec `id`, `titre`, `terminee`
- Ex2: methode `marquer_terminee()` qui change l'etat
- Ex3 (bonus): `to_dict()` utile pour JSON

**QCM**
1) `__init__` sert a : initialiser les objets. (A)
2) Une methode est : une fonction dans une classe. (B)
3) `self` represente : l'instance courante. (B)

**Devoir**
- Ajouter `echeance` (optionnel) dans `Tache` et mettre a jour `to_dict()`.

---

## Cours 11 - Web : HTTP + Flask "hello"
**Objectifs**
- Comprendre requete/reponse
- Comprendre le concept GET vs POST
- Creer une route Flask simple

**Lecon (10 min)**
- HTTP = "langue" entre navigateur et serveur

**Exercices (45 min)**
- Ex1: installer `flask` dans un environnement virtuel
- Ex2: ecrire `app.py` avec `@app.route("/")` qui retourne du texte
- Ex3 (bonus): renvoyer un status code different (ex: 404)

**QCM**
1) Le client HTTP c'est : le navigateur. (B)
2) Une route Flask correspond a : une URL. (A)
3) `GET` sert surtout a : demander une ressource. (B)

**Devoir**
- Ecrire 5 URL possibles pour ton futur mini-projet (ex: `/tasks`).

---

## Cours 12 - Routage GET/POST + recuperer des donnees
**Objectifs**
- Utiliser `request` pour acceder aux donnees
- Comprendre `form` en `POST`
- Construire une logique serveur

**Lecon (10 min)**
- Le serveur recoit, traite, repond

**Exercices (45 min)**
- Ex1: route `/add` (POST) qui recoit `titre` depuis un formulaire
- Ex2: afficher un message de confirmation
- Ex3 (bonus): separer dans `creer_tache(titre)`

**QCM**
1) Pour lire une donnee envoyee via formulaire : `request.form`. (A)
2) `POST` est utile quand : envoyer des donnees au serveur. (A)
3) Une route decide quoi faire pour : une URL. (A)

**Devoir**
- Creer un formulaire HTML minimal qui envoie vers `/add`.

---

## Cours 13 - Templates Jinja2 : HTML dynamique
**Objectifs**
- Comprendre le role des templates
- Injecter des variables dans le HTML
- Afficher une liste dans un template

**Lecon (10 min)**
- Le serveur rend HTML en remplacant des variables

**Exercices (45 min)**
- Ex1: `render_template("tasks.html", tasks=...)`
- Ex2: template qui affiche une liste de taches
- Ex3 (bonus): condition dans le template (`{% if ... %}`)

**QCM**
1) Un template sert a : generer du HTML avec variables. (B)
2) Jinja utilise : `{% ... %}` et `{{ ... }}`. (B)
3) Rendre un template se fait avec : `render_template(...)`. (A)

**Devoir**
- Ajouter un message "Aucune tache" si la liste est vide.

---

## Cours 14 - Validation + retours utilisateur
**Objectifs**
- Valider `titre` (non vide, longueur)
- Rediriger vers la page liste
- Afficher des messages en cas d'erreur

**Lecon (10 min)**
- Une application robuste n'accepte pas n'importe quoi

**Exercices (45 min)**
- Ex1: refuser un titre vide
- Ex2: si ok, ajouter la tache puis rediriger
- Ex3 (bonus): afficher un message d'erreur dans le template

**QCM**
1) Valider en serveur sert a : proteger l'app. (B)
2) Une redirection se fait souvent avec : `redirect(...)`. (A)
3) Un titre vide est souvent : invalide. (B)

**Devoir**
- Ajouter une validation de longueur (ex: 3 a 60 caracteres).

---

## Cours 15 - Gestion d'erreurs web (404/500)
**Objectifs**
- Creer une page 404
- Comprendre l'impact d'une erreur serveur
- Utiliser des handlers/`abort`

**Lecon (10 min)**
- Les erreurs doivent etre lisibles par l'humain

**Exercices (45 min)**
- Ex1: gerer une route inconnue (404)
- Ex2: declencher un 500 (cas force) pour comprendre
- Ex3 (bonus): message utilisateur en cas de mauvais input

**QCM**
1) 404 signifie : ressource introuvable. (B)
2) Arreter une route : `abort(404)`. (A)
3) Une bonne gestion d'erreur sert a : aider et guider. (B)

**Devoir**
- Ajouter une page "Erreur" generique pour les erreurs 500.

---

## Cours 16 - Structure de projet + static vs templates
**Objectifs**
- Comprendre la separation dossiers `templates/` et `static/`
- Devenir maintenable
- Eviter les chemins absolus

**Lecon (10 min)**
- Un projet clair evite la confusion

**Exercices (45 min)**
- Ex1: deplacer les HTML dans `templates/`
- Ex2: ajouter un fichier CSS dans `static/`
- Ex3 (bonus): factoriser la generation de la liste de taches

**QCM**
1) `templates/` contient : HTML genere par le serveur. (B)
2) `static/` contient : fichiers servis tels quels. (A)
3) Une separation aide a : maintenir et relire. (B)

**Devoir**
- Renommer tes fichiers et verifier que tout marche sans chemins absolus.

---

## Cours 17 - CRUD en memoire
**Objectifs**
- Implementer Create/Read/Update/Delete en memoire
- Definir des routes pour manipuler les taches

**Lecon (10 min)**
- CRUD = coeur d'une application de gestion

**Exercices (45 min)**
- Ex1: stocker les taches en liste Python au demarrage
- Ex2: route `/delete/<id>` (suppression)
- Ex3 (bonus): route `/edit/<id>` (mise a jour)

**QCM**
1) CRUD signifie : Create/Read/Update/Delete. (B)
2) En memoire signifie : perdu au redemarrage. (B)
3) `/delete/<id>` sert a : supprimer. (B)

**Devoir**
- Creer une vue "details" d'une tache (lecture par id).

---

## Cours 18 - SQLite : creer le stockage
**Objectifs**
- Comprendre le role d'une base
- Creer la table `tasks`
- Inserer une tache en base

**Lecon (10 min)**
- SQLite = persistance locale (fichier)

**Exercices (45 min)**
- Ex1: fichier `db.py` qui initialise la table
- Ex2: insert dans `tasks`
- Ex3 (bonus): recuperer une liste depuis la base

**QCM**
1) SQLite stocke dans : un fichier local. (B)
2) Une table regroupe : lignes et colonnes. (B)
3) Inserer en SQL utilise souvent : `INSERT INTO`. (B)

**Devoir**
- Ajouter une colonne `created_at` et l'alimenter (facultatif).

---

## Cours 19 - CRUD SQLite (model definitif)
**Objectifs**
- Implementer CRUD avec SQL parametre
- Reduire les duplications
- Rendre l'interface coherente

**Lecon (10 min)**
- SQL parametre = securite + lisibilite

**Exercices (45 min)**
- Ex1: Read : `SELECT` + affichage template
- Ex2: Update : `UPDATE ... WHERE id=?`
- Ex3: Delete : `DELETE ... WHERE id=?`
- Ex4 (bonus): bouton toggle `terminee`

**QCM**
1) `?` dans SQL protege surtout contre : injection SQL. (B)
2) `UPDATE` sert a : modifier. (B)
3) `DELETE` sert a : supprimer. (C)

**Devoir**
- Reflechir aux cas limites : id inexistant, titre invalide.

---

## Cours 20 - Organisation du code (propre)
**Objectifs**
- Separer routes (web) et repository (DB)
- Creer des fichiers lisibles
- Utiliser une config simple

**Lecon (10 min)**
- Architecture minimale : routes -> logique -> DB

**Exercices (45 min)**
- Ex1: creer des fonctions/routes `routes/tasks_routes.py` ou equivalents
- Ex2: repository `TaskRepository` avec methodes CRUD
- Ex3 (bonus): factoriser la validation formulaire

**QCM**
1) Separation aide a : eviter duplication. (A)
2) Un repository sert a : gerer la base. (A)
3) `app.py` devrait contenir surtout : orchestration minimale. (B)

**Devoir**
- Ecrire un mini "schema" routes -> repository -> SQL -> template.

---

## Cours 21 - Endpoint JSON (API)
**Objectifs**
- Fournir une route `/api/tasks` qui renvoie du JSON
- Convertir une tache en dict
- Tester dans le navigateur

**Lecon (10 min)**
- API = contrat de donnees (JSON)

**Exercices (45 min)**
- Ex1: route `/api/tasks` renvoie une liste
- Ex2: ajouter `/api/tasks/<id>` (optionnel)
- Ex3 (bonus): id inexistant -> 404

**QCM**
1) JSON est adapte pour : echange front/back. (A)
2) Une API doit etre : coherente et documentee. (B)
3) JSON d'une tache peut contenir : id et titre. (A)

**Devoir**
- Ajouter 2 exemples de reponses JSON dans un `README` (1 page).

---

## Cours 22 - Seecurite basique et hygiene web
**Objectifs**
- Eviter injection SQL
- Comprendre echappement HTML (XSS)
- Apprendre a valider les entrees

**Lecon (10 min)**
- Les bonnes habitudes font gagner beaucoup de temps

**Exercices (45 min)**
- Ex1: verifier que SQL utilise des parametres
- Ex2: ne pas injecter du brut dans le template (laisser Jinja echapper)
- Ex3 (bonus): erreur si titre trop long

**QCM**
1) Injection SQL arrive souvent quand : on concatene des chaines. (B)
2) Jinja echappe generalement : les variables HTML. (B)
3) Validation serveur sert aussi a : securiser. (A)

**Devoir**
- Lister 3 points de securite que tu conserveras pour le module 2.

---

## Cours 23 - Tests simples
**Objectifs**
- Ecrire des tests pour le repository
- Utiliser `unittest`
- Comprendre le sens d'un test

**Lecon (10 min)**
- Un test valide une regle, pas juste "du code qui marche"

**Exercices (45 min)**
- Ex1: tester `create_task` et `list_tasks`
- Ex2: tester `update_task` (etat terminee)
- Ex3 (bonus): comportement sur id inexistant

**QCM**
1) Un test unitaire teste : une petite partie. (B)
2) Un test utile doit : verifier une regle. (B)
3) Tester tot aide a : reduire les surprises. (B)

**Devoir**
- Ajouter au moins 2 tests supplementaires (cas limites).

---

## Cours 24 - HTML/CSS : mise en page
**Objectifs**
- Structurer une page (header, main, formulaires)
- Utiliser CSS de base (flex/grid simple)
- Harmoniser boutons et inputs

**Lecon (10 min)**
- UI lisible = moins de friction

**Exercices (45 min)**
- Ex1: creer un layout 2 colonnes (ou une colonne centre)
- Ex2: styliser une liste de taches
- Ex3 (bonus): style "terminee" (barrer le texte)

**QCM**
1) CSS sert a : presenter et styliser. (B)
2) Responsive vise a : s'adapter aux ecrans. (B)
3) Un bon style rend : plus clair. (B)

**Devoir**
- Proposer 2 ameliorations UI pour ton app.

---

## Cours 25 - Composants UI et ergonomie
**Objectifs**
- Renforcer la navigation
- Ajouter messages, confirmations
- Rendre l'app plus accessible

**Lecon (10 min)**
- Une app doit guider l'utilisateur

**Exercices (45 min)**
- Ex1: message de reussite apres create/update/delete
- Ex2: boutons "Edit" et "Delete" avec style
- Ex3 (bonus): ajouter un affichage sous forme de cartes

**QCM**
1) Un message de confirmation est utile car : guide l'utilisateur. (A)
2) Ergonomie vise : faciliter l'usage. (A)
3) Accessibilite basique = labels/texte/contraste. (A)

**Devoir**
- Ajouter un titre de page coherent a chaque route.

---

## Cours 26 - fetch (AJAX light) pour maj
**Objectifs**
- Appeler une API JSON
- Utiliser `fetch` et `response.json()`
- Mettre a jour la liste sans reload complet

**Lecon (10 min)**
- Front dialogue avec le back via API

**Exercices (45 min)**
- Ex1: bouton "rafraichir" qui appelle `/api/tasks` et met a jour la liste
- Ex2: gerer un `catch` en cas d'erreur
- Ex3 (bonus): filtrer cote client

**QCM**
1) `fetch(url)` sert a : faire un appel reseau. (B)
2) `response.json()` transforme : une reponse en objet JS. (B)
3) `catch` aide a : gerer erreur. (A)

**Devoir**
- Ajouter un indicateur "chargement..." pendant l'appel fetch.

---

## Cours 27 - Filtres simples et experience utilisateur
**Objectifs**
- Ajouter des filtres (toutes / en cours / terminees)
- Comprendre la logique front vs back
- Ameliorer la navigation interne

**Lecon (10 min)**
- Les filtres transforment la liste a afficher

**Exercices (45 min)**
- Ex1: menu select qui filtre la liste
- Ex2: option A (cote client) : filtre dans le tableau JS
- Ex3 (bonus): option B (cote serveur) : `/api/tasks?done=true`

**QCM**
1) Un filtre sert a : restreindre ce qu'on voit. (B)
2) Filtrer cote client signifie : traitement dans le navigateur. (B)
3) Filtrer cote serveur signifie : calcul serveur avant renvoi JSON. (A)

**Devoir**
- Choisir l'option A ou B et justifier dans le `README` (1 paragraphe).

---

## Cours 28 - Configuration et variables d'environnement
**Objectifs**
- Comprendre dev vs prod
- Utiliser `os.environ` pour config
- Ne pas coder en dur le chemin DB

**Lecon (10 min)**
- Ne pas coder en dur

**Exercices (45 min)**
- Ex1: variable `DB_PATH` utilisee dans `db.py`
- Ex2: `DEBUG=true` via env
- Ex3 (bonus): separer `config.py` ou constantes

**QCM**
1) Env sert a : parametres externes. (B)
2) `os.environ["X"]` sert a : lire un environnement. (A)
3) En production, on evite : coder en dur. (B)

**Devoir**
- Ajouter un exemple de variables dans `README` (sans secrets).

---

## Cours 29 - Qualite : style, docstrings, README
**Objectifs**
- Suivre de bonnes pratiques (lisibilite)
- Ajouter des docstrings
- Ecrire un README clair et complet

**Lecon (10 min)**
- Pro = code lisible + documentation utile

**Exercices (45 min)**
- Ex1: revoir noms de variables et fonctions
- Ex2: ajouter docstrings a 3 fonctions cles
- Ex3: ecrire un README module 1 complet (installation, execution, routes, features)

**QCM**
1) Une docstring sert a : expliquer l'intention. (B)
2) Un README utile doit inclure : comment demarrer. (A)
3) Style coherent aide a : maintenance. (A)

**Devoir**
- Ajouter une section "ameliorations possibles" (3 idees).

---

## Cours 30 - Projet final et soutenance
**Objectifs**
- Finaliser l'app
- Verifier toutes les routes
- Presentater le projet

**Lecon (10 min)**
- Checklist avant livraison

**Exercices (45 min)**
- Ex1: relancer et verifier routes
- Ex2: tester CRUD (create, edit, delete)
- Ex3: verifier API JSON (au moins `/api/tasks`)
- Ex4: finir l'UI (CSS) et corriger 2 bugs maximum

**QCM**
1) Livraison pro inclut : fonctionnement + doc. (B)
2) CRUD complet = create/read/update/delete. (B)
3) Avant de rendre, tu dois : tester. (B)

**Devoir (final)**
- Ecrire un court texte de soutenance (5-7 phrases) : probleme, solution, points appris.

---

## Corriges detailles (a la fin du module)
Cette section contient les corriges detaillees des **devoirs** et (ensuite) du **projet fil rouge**.

### Cours 1 - Devoir
Attendu (exemple de reponse, a adapter a ton experience) :
- Difficultes : trouver le bon dossier (chemin) dans le terminal.
  - Resolution : ouvrir le terminal depuis le dossier du projet (VS Code -> `Terminal` -> `New Terminal`) puis lancer `python main.py`.
- Difficultes : erreurs de nom de fichier / nom de fonction.
  - Resolution : verifier l’orthographe exacte et la position des fichiers.
- Difficultes : “SyntaxError” apres avoir modifie le code.
  - Resolution : lire la ligne indiquee par Python et relire les guillemets / parentheses.
- Difficultes : comprendre le role de `if __name__ == "__main__":`.
  - Resolution : utiliser cette condition pour lancer le test uniquement quand on execute `main.py`.
- Difficultes : interpreter la sortie console.
  - Resolution : lire les messages et corriger petit a petit.

### Cours 2 - Devoir
Exemples de conversions :
```python
age_str = "20"
age_int = int(age_str)      # str -> int

age_int = 20
age_txt = str(age_int)     # int -> str

note_float = 12.9
note_int = int(note_float) # float -> int (tronque vers le bas)
```

### Cours 3 - Devoir
Exemple de 5 regles metier -> conditions :
```python
age = int(input("Age: "))
titre = input("Titre: ")

# 1) Promo si <= 25 ans
promo = age <= 25

# 2) Etre majeur si >= 18
majeur = age >= 18

# 3) Ticket adulte si >= 12
type_ticket = "adulte" if age >= 12 else "enfant"

# 4) Valider un titre (non vide)
titre_ok = len(titre.strip()) > 0

# 5) Condition bonus : si majeur ET titre valide
message = "OK" if majeur and titre_ok else "Verifier les informations"
print(promo, majeur, type_ticket, message)
```

### Cours 4 - Devoir
Implantation de `compte_voyelles(texte)` :
```python
def compte_voyelles(texte: str) -> int:
    voyelles = set("aeiouyAEIOUY")
    total = 0
    for ch in texte:
        if ch in voyelles:
            total += 1
    return total

print(compte_voyelles("Bonjour tout le monde"))  # exemple
```

### Cours 5 - Devoir
Refactorisation du cours 4 (au moins 2 fonctions).
Exemple :
```python
def afficher_1_a_n(N: int) -> None:
    for i in range(1, N + 1):
        print(i)

def somme_liste(nombres: list[int]) -> int:
    total = 0
    for x in nombres:
        total += x
    return total

def compteur_while(cible: int) -> None:
    compteur = 0
    while compteur < cible:
        compteur += 1
        print("compteur =", compteur)

if __name__ == "__main__":
    # tests rapides
    afficher_1_a_n(5)
    print("Somme =", somme_liste([2, 5, 10]))
    compteur_while(3)
```

### Cours 6 - Devoir
`compter_par_mot(texte)` -> dict (mot -> nombre)
```python
def compter_par_mot(texte: str) -> dict[str, int]:
    # Nettoyage simple : minuscules + suppression des espaces superflus
    mots = texte.lower().strip().split()
    stats = {}
    for mot in mots:
        stats[mot] = stats.get(mot, 0) + 1
    return stats

print(compter_par_mot("Bonjour bonjour monde"))  # {'bonjour': 2, 'monde': 1}
```

### Cours 7 - Devoir
`nettoie_nom(nom)` -> nom propre
```python
def nettoie_nom(nom: str) -> str:
    nom = nom.strip()
    # Garde la structure en mots et met la premiere lettre en majuscule
    mots = [m for m in nom.split(" ") if m]
    mots = [m.lower().capitalize() for m in mots]
    return " ".join(mots)

print(nettoie_nom("  abDOu  doulaR  "))  # Abdou Doul... (selon input)
```

### Cours 8 - Devoir
Ajouter un champ `cree_le` (date sous forme string) dans ton JSON
```python
import json
from datetime import datetime

with open("data.json", "r", encoding="utf-8") as f:
    data = json.load(f)

data["cree_le"] = datetime.now().strftime("%Y-%m-%d")

with open("data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
```

### Cours 9 - Devoir
Controle de type (ex : liste non vide)
```python
def moyenne(liste: list[float]) -> float:
    if not isinstance(liste, list):
        raise TypeError("Le parametre doit etre une liste.")
    if len(liste) == 0:
        raise ValueError("La liste ne doit pas etre vide.")

    return sum(liste) / len(liste)
```

### Cours 10 - Devoir
Ajouter `echeance` optionnel + mise a jour de `to_dict()`
```python
class Tache:
    def __init__(self, id: int, titre: str, terminee: bool, echeance: str | None = None):
        self.id = id
        self.titre = titre
        self.terminee = terminee
        self.echeance = echeance

    def marquer_terminee(self) -> None:
        self.terminee = not self.terminee

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "titre": self.titre,
            "terminee": self.terminee,
            "echeance": self.echeance,
        }
```

### Cours 11 - Devoir
Exemples d’URL pour le mini-projet :
- `/` : liste des taches
- `/add` : formulaire + creation (GET/POST selon ton design)
- `/tasks/<int:task_id>` : detail d’une tache
- `/delete/<int:task_id>` : suppression
- `/api/tasks` : API JSON list

### Cours 12 - Devoir
Formulaire HTML minimal qui envoie vers `/add`
```html
<!-- templates/add_task.html -->
<form method="POST" action="/add">
  <label for="titre">Titre</label>
  <input id="titre" name="titre" type="text" required>
  <button type="submit">Ajouter</button>
</form>
```

### Cours 13 - Devoir
Message "Aucune tache" si la liste est vide (Jinja2)
```html
{% if tasks|length == 0 %}
  <p>Aucune tache.</p>
{% else %}
  <ul>
    {% for t in tasks %}
      <li>{{ t.titre }}</li>
    {% endfor %}
  </ul>
{% endif %}
```

### Cours 14 - Devoir
Validation de longueur (ex : 3 a 60 caracteres)
```python
def est_titre_valide(titre: str) -> bool:
    titre = (titre or "").strip()
    return 3 <= len(titre) <= 60
```
Puis dans ta route `POST /add` :
```python
if not est_titre_valide(titre):
    # selon ton design : afficher un message ou renvoyer une erreur
    return "Titre invalide", 400
```

### Cours 15 - Devoir
Page generique d’erreur 500
```python
from flask import render_template

@app.errorhandler(500)
def internal_error(_e):
    return render_template("error_500.html"), 500
```
Et `templates/error_500.html` :
```html
<h1>Erreur interne</h1>
<p>Une erreur est survenue. Reessaie plus tard.</p>
```

### Cours 16 - Devoir
Checklist rapide :
- `templates/` contient tous les HTML (pas de HTML “a cote”)
- `static/` contient ton CSS/JS (pas de CSS inline partout)
- tes routes n’utilisent pas de chemins absolus
- `url_for('static', filename='style.css')` marche

### Cours 17 - Devoir
Vue detail pour une tache par id
```python
@app.route("/tasks/<int:task_id>")
def task_detail(task_id: int):
    task = repo.get_task(task_id)  # a adapter a ton code
    if task is None:
        abort(404)
    return render_template("task_detail.html", task=task)
```

### Cours 18 - Devoir
Ajouter `created_at` (colonne) et l’alimenter
Idée SQL (exemple) :
```sql
ALTER TABLE tasks ADD COLUMN created_at TEXT;
```
Puis insertion :
```python
created_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
```

### Cours 19 - Devoir
Cas limites a considerer :
- id inexistant : retourner `404` (ou message)
- titre invalide : refuser en amont (400 / message)
- suppression d’une tache deja supprimee : id inexistant donc 404
- update de `terminee` : garantir que la tache existe avant ecriture

### Cours 20 - Devoir
Mini-schema (routes -> repository -> SQL -> template)
- `routes/*.py` : gere HTTP (request, validation, render)
- `repository/*.py` : logique CRUD (appelle SQL parametré)
- `db.py` : connexion + requetes SQL
- `templates/*.html` : affichage HTML

### Cours 21 - Devoir
Exemples de reponses JSON (a mettre dans README)
```json
[
  {"id": 1, "titre": "Faire les exercices", "terminee": false, "echeance": null},
  {"id": 2, "titre": "Corriger le code", "terminee": true, "echeance": "2026-04-01"}
]
```

### Cours 22 - Devoir
3 points de securite a appliquer :
- utiliser SQL parametré (pas de concat SQL)
- echappement des variables dans les templates (Jinja2 par defaut)
- valider les entrees cote serveur (longueur, type, champs attendus)

### Cours 23 - Devoir
Ajouter au moins 2 tests supplementaires
Exemples (unittest) :
```python
def test_update_nonexistent_returns_none(self):
    task = self.repo.update_task(999, {"terminee": True})
    self.assertIsNone(task)

def test_create_rejects_empty_title(self):
    with self.assertRaises(ValueError):
        self.repo.create_task({"titre": "  ", "terminee": False})
```

### Cours 24 - Devoir
2 ameliorations UI possibles :
- afficher un badge “Terminee” vs “En cours” avec une couleur
- ajouter un compteur “X taches restantes”

### Cours 25 - Devoir
Titre coherent a chaque route
Exemple (strategie) :
- liste : `<title>Mes taches</title>`
- creation : `<title>Ajouter une tache</title>`
- detail : `<title>Détail - {{ task.titre }}</title>`

### Cours 26 - Devoir
Indicateur “chargement...” pendant `fetch`
Exemple JS :
```javascript
const status = document.getElementById("loading");
status.textContent = "chargement...";

fetch("/api/tasks")
  .then(res => res.json())
  .then(tasks => { /* re-render la liste */ })
  .catch(() => { status.textContent = "Erreur"; })
  .finally(() => { status.textContent = ""; });
```

### Cours 27 - Devoir
Justification (exemple pour option B “cote serveur”)
Je choisis l’option B car elle reduit la taille des donnees renvoyees au navigateur et centralise la logique metier sur le serveur. Comme la source de verite est la base, le filtre reste coherent meme si plusieurs clients affichent les taches. Enfin, cela simplifie le front : il se contente de presenter le resultat sans dupliquer la logique.

### Cours 28 - Devoir
Exemple de variables d’environnement (sans secrets)
```env
FLASK_DEBUG=true
DB_PATH=./data/tasks.sqlite
APP_ENV=development
```

### Cours 29 - Devoir
3 ameliorations possibles
- Ajouter une recherche (par titre) + pagination
- Ajouter un systeme d’authentification (login, roles)
- Ajouter des tests end-to-end (front -> API) ou un environnement CI

### Cours 30 - Devoir final (soutenance, exemple)
J’ai realise une application “Taches” en Python avec Flask pour creer un site simple et utile. Le probleme etait de gerer des taches de facon claire, avec une interface web. La solution consiste en des routes Flask pour creer, lire, mettre a jour et supprimer, et une base SQLite pour persister les donnees. J’ai aussi ajoute une route API `/api/tasks` pour fournir du JSON. J’ai appris a structurer mon projet (routes, repository, templates), a valider les entrees et a gerer les erreurs. Enfin, j’ai rendu l’interface plus lisible avec un peu de CSS et des retours utilisateur.

---

### Projet fil rouge - Corrige final (Taches, Flask + SQLite)
Le code “version corrigee” (propre, API GET uniquement) est disponible ici :
`docs/module-1-solution-taches/`

Contenu (principaux fichiers) :
- `app.py`
- `routes.py` (routes web + `GET /api/tasks`)
- `db.py` (SQLite + CRUD)
- `templates/` (pages Jinja)
- `static/style.css`
- `README.md` (installation + lancement)

## Annexes (optionnel)
### Liste de commandes (a adapter)
```bash
python -m venv .venv
.venv\\Scripts\\activate
pip install flask
python app.py
```

