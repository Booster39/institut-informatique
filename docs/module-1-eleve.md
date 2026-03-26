# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 1 (30 cours) - Les fondations Python + 1er site en Flask

### Résumé
Ce module pose les bases essentielles pour écrire un programme Python propre et maintenable. Nous commencerons par comprendre les concepts fondamentaux de la programmation, puis nous explorerons les structures de données de base, les fonctions, et la gestion des erreurs. Ensuite, nous nous tournerons vers le développement web en apprenant les principes du protocole HTTP et en construisant une première application web complète avec Flask, un framework Python léger et puissant. Nous intégrerons également une base de données SQLite pour la persistance des données, et nous terminerons par des notions d'interface utilisateur avec HTML, CSS, et JavaScript de base. Ce module vous donnera une base solide pour comprendre comment les applications web fonctionnent et comment les construire étape par étape.

### Hypothèses (à valider)
- **Python 3.11+** : Nous utiliserons la dernière version stable de Python pour bénéficier des dernières fonctionnalités et améliorations de performance.
- **Éditeur : VS Code** : Un environnement de développement intégré moderne avec de nombreuses extensions pour Python et le développement web.
- **Framework web : Flask** : Un micro-framework Python simple mais extensible pour créer des applications web rapidement.
- **Base de données : SQLite** : Une base de données légère et sans installation supplémentaire, parfaite pour les applications de petite à moyenne taille.

### Rythme
- **4 cours par semaine** : Un rythme soutenu mais réaliste pour permettre l'assimilation progressive des concepts.
- **30 cours pour ce module** : Environ 7 semaines et demie d'apprentissage intensif.
- **Chaque cours dure 1 heure** : Composé d'une théorie courte mais approfondie, d'une démonstration pratique, d'exercices guidés, d'un QCM d'auto-évaluation, et d'un devoir pour consolider les apprentissages.

---

## Projet fil rouge (à construire tout au long du module)
**Mini-app "Tâches"** :
Cette application sera notre fil conducteur tout au long du module. Elle représentera une liste de tâches personnelles que l'utilisateur pourra gérer. Au fur et à mesure des cours, nous ajouterons des fonctionnalités :

- Une page d'accueil affichant la liste des tâches existantes
- Un formulaire pour créer une nouvelle tâche avec un titre et une description
- Des boutons pour éditer et supprimer des tâches existantes
- Un système de marquage des tâches comme terminées ou en cours
- Un stockage persistant des données dans une base de données SQLite
- Une interface utilisateur agréable avec du HTML et du CSS
- Une API REST en JSON pour permettre des interactions dynamiques
- Des filtres pour afficher seulement certaines tâches (toutes, en cours, terminées)

Livrable final (cours 30) : Une application web complète et fonctionnelle, accompagnée d'un README détaillé expliquant l'installation, l'utilisation, et les fonctionnalités, ainsi que quelques captures d'écran pour illustrer le résultat final.

---

## Planning (30 cours)
| Cours | Thème principal | Livrable attendu |
|---:|---|---|
| 1 | Démarrer et comprendre la logique | Environnement de développement prêt |
| 2 | Variables et types de données | Script Python basique fonctionnel |
| 3 | Conditions | Règles logiques (si/alors) implémentées |
| 4 | Boucles | Parcours et traitement de données |
| 5 | Fonctions | Utilitaires réutilisables créés |
| 6 | Listes et dictionnaires | Structures de données complexes manipulées |
| 7 | Chaînes de caractères | Formatage et nettoyage de texte |
| 8 | Fichiers + JSON | Import/export de données |
| 9 | Exceptions | Gestion propre des erreurs |
| 10 | Classes (bases) | Objet "Tâche" défini et utilisé |
| 11 | HTTP + Flask hello | Première route web fonctionnelle |
| 12 | Routage GET/POST | Formulaire vers serveur opérationnel |
| 13 | Templates Jinja | HTML dynamique généré |
| 14 | Validation simple | Application web robuste |
| 15 | Pages 404/erreurs | Gestion d'erreurs utilisateur |
| 16 | Séparation front/back | Structure de projet claire |
| 17 | CRUD en mémoire | Opérations de base sur les tâches |
| 18 | SQLite (schema) | Table de base de données créée |
| 19 | CRUD SQLite | Persistance des données assurée |
| 20 | Organisation en modules | Code maintenable et modulaire |
| 21 | API JSON | Endpoint REST disponible |
| 22 | Sécurité basique | Protection contre les vulnérabilités courantes |
| 23 | Tests simples | Suite de tests automatisés |
| 24 | CSS pour app | Interface utilisateur stylisée |
| 25 | Composants UI | Éléments d'interface ergonomiques |
| 26 | `fetch` (AJAX light) | Mises à jour dynamiques sans rechargement |
| 27 | État client | Filtres et interactions côté client |
| 28 | Config & env variables | Configuration flexible |
| 29 | Qualité & documentation | Code propre et bien documenté |
| 30 | Projet final + soutenance | Application complète présentée |

---

## Cours 1 - Démarrer et comprendre la logique
**Objectifs**
- Comprendre ce qu'est réellement un programme informatique et comment il s'exécute
- Apprendre à installer et configurer un environnement de développement Python
- Écrire votre premier script Python et comprendre le cycle d'exécution
- Développer une approche méthodique pour résoudre les problèmes informatiques

**Leçon (30 min - détaillée)**
Un programme informatique est essentiellement une suite d'instructions que l'ordinateur doit exécuter dans un ordre précis pour accomplir une tâche spécifique. Contrairement à ce que l'on pourrait penser, un programme n'est pas magique - c'est une traduction logique d'un processus que vous pourriez faire manuellement.

**Les algorithmes : le cœur de la programmation**
Un algorithme est une séquence d'étapes logiques pour résoudre un problème. Par exemple, pour faire des pâtes :
1. Remplir une casserole d'eau
2. Porter à ébullition
3. Ajouter du sel
4. Plonger les pâtes
5. Attendre le temps de cuisson
6. Égoutter

En programmation, nous traduisons ces étapes en code. Chaque ligne de code correspond à une action précise.

**Le feedback : l'apprentissage par l'erreur**
L'un des aspects les plus importants de la programmation est le cycle "essai-erreur-correction". Quand vous écrivez du code :
1. Vous écrivez une instruction
2. Vous l'exécutez
3. Si ça fonctionne, vous continuez
4. Si ça ne fonctionne pas, vous analysez l'erreur et corrigez

Les erreurs (ou "bugs") ne sont pas des échecs - elles sont des opportunités d'apprentissage. Chaque erreur que vous corrigez vous rend meilleur programmeur.

**Les outils essentiels**
- **Terminal/Console** : L'interface où vous interagissez avec l'ordinateur via des commandes texte
- **Interpréteur Python** : Le programme qui lit et exécute votre code Python
- **Éditeur de code** : VS Code, qui vous aide à écrire du code avec coloration syntaxique, auto-complétion, etc.

**Installation étape par étape**
1. Téléchargez Python depuis python.org (version 3.11 ou supérieure)
2. Installez-le en suivant l'assistant d'installation
3. Ouvrez VS Code et installez l'extension Python officielle
4. Créez un dossier pour vos projets (par exemple `module1`)
5. Ouvrez ce dossier dans VS Code

**Premier contact avec Python**
Python est un langage interprété, ce qui signifie que vous pouvez exécuter votre code ligne par ligne pour voir immédiatement le résultat. C'est parfait pour l'apprentissage !

**Exercices (25 min)**
- Ex1: Créez un dossier `module1/cours1` et un fichier `main.py` qui affiche 3 lignes de texte différentes.
- Ex2: Créez `calc.py` avec une fonction `addition(a,b)` puis un test simple dans `main.py`.
- Ex3 (bonus): Affichez la date actuelle et un message d'encouragement personnalisé.

**QCM (3 questions)**
1) Un programme sert surtout à :
   A) Dessiner des images
   B) Exécuter une suite d'opérations logiques
   C) Stocker des vidéos
   D) Lancer un film

2) Le feedback vient surtout de :
   A) L'orthographe parfaite du code
   B) L'exécution et les erreurs rencontrées
   C) La couleur du thème de l'éditeur
   D) La taille de l'écran

3) `print()` est utilisé pour :
   A) Créer des routes web
   B) Afficher du texte dans la console
   C) Interagir avec une base de données SQL
   D) Compiler du code Java

**Devoir (5 min)**
- Notez 5 difficultés que vous avez rencontrées lors du premier lancement et comment vous les avez résolues ou comptez les résoudre.

---

## Cours 2 - Variables et types de données
**Objectifs**
- Maîtriser le concept de variable comme conteneur de données
- Comprendre les différents types de données fondamentaux en Python
- Apprendre à convertir entre types de données
- Éviter les erreurs courantes liées aux types

**Leçon (30 min - détaillée)**
Une variable en programmation est comme une boîte étiquetée dans laquelle vous stockez une valeur. Le nom de la variable est l'étiquette, et la valeur peut être de différents types.

**Les types de données de base**
- **int (entier)** : Nombres entiers positifs ou négatifs (1, -5, 42)
- **float (flottant)** : Nombres décimaux (3.14, -2.5, 1.0)
- **str (chaîne)** : Texte entre guillemets ("Bonjour", 'Hello')
- **bool (booléen)** : Valeurs vraies ou fausses (True, False)

**L'affectation (=)**
Le symbole `=` n'est pas un signe d'égalité mathématique, mais un opérateur d'affectation. Il prend la valeur à droite et la stocke dans la variable à gauche.

```python
age = 25          # âge reçoit la valeur 25
nom = "Alice"     # nom reçoit la chaîne "Alice"
est_majeur = True # est_majeur reçoit la valeur booléenne True
```

**La conversion de types**
Parfois, vous devez changer le type d'une valeur :
- `int("42")` transforme la chaîne "42" en nombre entier 42
- `str(25)` transforme le nombre 25 en chaîne "25"
- `float("3.14")` transforme la chaîne "3.14" en nombre flottant 3.14

Attention : toutes les conversions ne sont pas possibles ! Par exemple, `int("bonjour")` provoquera une erreur.

**Différences entre types**
- Un nombre et une chaîne qui représente ce nombre sont différents : `5 ≠ "5"`
- Vous pouvez faire des opérations mathématiques sur les nombres, mais pas sur les chaînes
- Les booléens sont souvent le résultat de comparaisons : `age >= 18`

**Exercices (25 min)**
- Ex1: Écrivez un script qui calcule `prix_total = prix_unitaire * quantité` avec un affichage formaté à 2 décimales.
- Ex2: Demandez à l'utilisateur son âge et convertissez-le en `int` (gérez le cas où l'entrée n'est pas un nombre valide).
- Ex3: Créez une variable `nom` et construisez une phrase complète en utilisant ce nom.

**QCM**
1) Une `str` représente surtout :
   A) Un nombre mathématique
   B) Du texte ou des caractères
   C) Une table de base de données
   D) Une requête HTTP

2) `3 + "4"` fonctionne :
   A) Oui, ça donne 7
   B) Non, c'est une erreur de type
   C) Seulement en HTML
   D) Seulement en SQL

3) `bool` peut être :
   A) "oui" ou "non"
   B) `True` ou `False`
   C) 0 ou 1 toujours
   D) Jamais utilisé

**Devoir**
- Écrivez 3 exemples de conversions : `str->int`, `int->str`, `float->int`. Testez-les et notez ce qui se passe.

---

## Cours 3 - Conditions : si/alors
**Objectifs**
- Maîtriser les structures conditionnelles `if/elif/else`
- Utiliser les opérateurs logiques `and`, `or`, `not`
- Transformer des règles métier en code exécutable
- Comprendre le flux d'exécution conditionnel

**Leçon (30 min - détaillée)**
Les conditions permettent à votre programme de prendre des décisions. C'est ce qui rend les programmes "intelligents" - ils peuvent s'adapter à différentes situations.

**La structure de base : if**
```python
if condition:
    # code exécuté si la condition est vraie
```

**Conditions multiples : elif et else**
```python
if condition1:
    # exécuté si condition1 est vraie
elif condition2:
    # exécuté si condition1 est fausse mais condition2 est vraie
else:
    # exécuté si aucune condition précédente n'est vraie
```

**Les opérateurs de comparaison**
- `==` : égal à
- `!=` : différent de
- `<` : strictement inférieur
- `<=` : inférieur ou égal
- `>` : strictement supérieur
- `>=` : supérieur ou égal

**Les opérateurs logiques**
- `and` : les deux conditions doivent être vraies
- `or` : au moins une des deux conditions doit être vraie
- `not` : inverse la valeur booléenne

**Exemples concrets**
```python
# Vérification d'âge
age = 20
if age >= 18:
    print("Vous êtes majeur")
else:
    print("Vous êtes mineur")

# Vérification de plage
note = 85
if 0 <= note <= 100:
    if note >= 90:
        print("Excellent")
    elif note >= 80:
        print("Très bien")
    elif note >= 70:
        print("Bien")
    else:
        print("À améliorer")
else:
    print("Note invalide")
```

**Bonnes pratiques**
- Indentez toujours le code dans les blocs if/elif/else
- Les conditions doivent être claires et lisibles
- Préférez les conditions positives quand possible
- Utilisez des parenthèses pour clarifier les expressions complexes

**Exercices (25 min)**
- Ex1: Déterminez une note `>= 90` → "A", `>= 75` → "B" sinon "C".
- Ex2: Vérifiez si un âge est valide (entre 0 et 120 ans) et affichez un message approprié.
- Ex3 (bonus): Écrivez une fonction `est_majeur(age)` qui retourne True/False.

**QCM**
1) `elif` sert à :
   A) Terminer une boucle
   B) Ajouter une autre condition à vérifier
   C) Définir une fonction
   D) Importer un module

2) `and` signifie :
   A) Ou
   B) Et
   C) Non
   D) Plus

3) `else` s'exécutera si :
   A) Une condition précédente est vraie
   B) Aucune condition précédente n'est vraie
   C) Le programme plante
   D) L'utilisateur appuie sur Entrée

**Devoir**
- Écrivez 5 règles simples (ex: éligibilité à un prêt, type de billet de cinéma, promotion commerciale) et transformez-les en structures conditionnelles.

---

## Cours 4 - Boucles : for et while
**Objectifs**
- Maîtriser les boucles `for` pour parcourir des séquences
- Utiliser les boucles `while` pour répéter selon une condition
- Comprendre et utiliser la fonction `range()`
- Éviter les boucles infinies

**Leçon (30 min - détaillée)**
Les boucles permettent de répéter des actions sans avoir à écrire le même code plusieurs fois. Elles sont essentielles pour traiter des collections de données.

**La boucle for : parcours déterminé**
La boucle `for` est idéale quand vous savez combien de fois vous voulez répéter l'action, ou quand vous voulez parcourir tous les éléments d'une collection.

```python
# Parcourir une liste
fruits = ["pomme", "banane", "orange"]
for fruit in fruits:
    print(f"J'aime les {fruit}s")

# Utiliser range() pour répéter un nombre connu de fois
for i in range(5):  # i prend les valeurs 0, 1, 2, 3, 4
    print(f"Tour numéro {i + 1}")
```

**La fonction range()**
- `range(n)` : génère les nombres de 0 à n-1
- `range(début, fin)` : génère de début à fin-1
- `range(début, fin, pas)` : génère avec un pas personnalisé

**La boucle while : condition d'arrêt**
La boucle `while` continue tant qu'une condition reste vraie. Attention aux boucles infinies !

```python
compteur = 0
while compteur < 5:
    print(f"Compteur : {compteur}")
    compteur += 1  # N'oubliez pas d'incrémenter !
```

**Quand utiliser quoi ?**
- `for` : quand vous savez le nombre d'itérations ou parcourez une collection
- `while` : quand la condition d'arrêt est plus complexe ou inconnue à l'avance

**Erreurs courantes**
- Oublier d'incrémenter le compteur dans une boucle while → boucle infinie
- range(5) donne 0,1,2,3,4 (5 valeurs, de 0 à 4)
- Indentation incorrecte : le code dans la boucle doit être indenté

**Exercices (25 min)**
- Ex1: Affichez les nombres de 1 à N (N demandé à l'utilisateur).
- Ex2: Calculez la somme d'une liste de nombres.
- Ex3: Écrivez un compteur avec `while` qui s'arrête à une valeur cible donnée.

**QCM**
1) `for x in range(5)` génère :
   A) 5 nombres
   B) 6 nombres
   C) Les nombres 0 à 4
   D) Les nombres 1 à 5

2) Une boucle `while` s'arrête si :
   A) Le compteur atteint 100
   B) La condition devient fausse
   C) L'utilisateur appuie sur Échap
   D) Le programme manque de mémoire

3) La boucle sert principalement à :
   A) Créer des variables
   B) Répétition d'actions
   C) Définir des fonctions
   D) Importer des modules

**Devoir**
- Implémentez une fonction `compte_voyelles(texte)` qui utilise une boucle pour compter les voyelles dans un texte.

---

## Cours 5 - Fonctions : réutiliser le code
**Objectifs**
- Écrire des fonctions avec paramètres et valeur de retour
- Comprendre le concept de variables locales
- Organiser le code en petites unités réutilisables
- Améliorer la lisibilité et la maintenabilité

**Leçon (30 min - détaillée)**
Les fonctions sont comme des mini-programmes à l'intérieur de votre programme principal. Elles permettent de décomposer un problème complexe en sous-problèmes plus simples.

**Définir une fonction**
```python
def nom_de_la_fonction(paramètre1, paramètre2):
    # code de la fonction
    return résultat
```

**Les paramètres**
Les paramètres sont les "entrées" de la fonction. Ils permettent de passer des valeurs variables.

```python
def saluer(nom, age):
    return f"Bonjour {nom}, vous avez {age} ans"
```

**La valeur de retour**
Le `return` spécifie ce que la fonction "rend" à celui qui l'appelle. Si pas de return, la fonction retourne `None`.

**Variables locales vs globales**
- **Locales** : existent seulement à l'intérieur de la fonction
- **Globales** : existent dans tout le programme

```python
def calculer_tva(prix_ht):
    taux_tva = 0.20  # variable locale
    return prix_ht * taux_tva

prix = 100  # variable globale
tva = calculer_tva(prix)
```

**Bonnes pratiques**
- Une fonction doit faire une seule chose bien
- Noms descriptifs pour fonctions et paramètres
- Documenter avec des commentaires ce que fait la fonction
- Tester les fonctions séparément

**Exercices (25 min)**
- Ex1: Fonction `moyenne(liste)` → float représentant la moyenne des nombres
- Ex2: Fonction `est_pair(n)` → bool (vrai si n est pair)
- Ex3 (bonus): `format_tache(titre, echeance)` → str formatée

**QCM**
1) `return` sert à :
   A) Arrêter le programme
   B) Donner une valeur de sortie à la fonction
   C) Imprimer à l'écran
   D) Définir une variable

2) Sans `return`, la fonction renvoie :
   A) Une erreur
   B) Rien (None)
   C) La dernière ligne exécutée
   D) Toutes les variables locales

3) Une fonction aide principalement à :
   A) Ralentir le programme
   B) Réutiliser du code
   C) Créer des graphiques
   D) Gérer les fichiers

**Devoir**
- Refactorisez le code du cours 4 en utilisant au moins 2 fonctions supplémentaires.

---

## Cours 6 - Listes et dictionnaires
**Objectifs**
- Manipuler les listes : ajout, suppression, parcours, filtrage
- Comprendre les dictionnaires : paires clé-valeur
- Choisir la bonne structure de données selon le besoin
- Maîtriser les opérations courantes sur ces structures

**Leçon (30 min - détaillée)**
Les structures de données permettent de stocker et organiser plusieurs valeurs ensemble.

**Les listes : collections ordonnées**
Une liste est comme une étagère où chaque élément a une position (index) spécifique.

```python
# Création
taches = ["Faire les courses", "Réviser Python", "Appeler maman"]

# Accès par index (commence à 0)
premiere_tache = taches[0]  # "Faire les courses"
derniere_tache = taches[-1]  # "Appeler maman"

# Ajout
taches.append("Nouveau élément")  # Ajoute à la fin
taches.insert(1, "Urgent")  # Insère à la position 1

# Suppression
taches.remove("Réviser Python")  # Supprime l'élément
tache_finie = taches.pop(0)  # Supprime et retourne l'élément
```

**Les dictionnaires : associations clé-valeur**
Un dictionnaire associe des clés à des valeurs, comme un répertoire téléphonique.

```python
# Création
contact = {
    "nom": "Dupont",
    "prenom": "Jean",
    "telephone": "01 23 45 67 89",
    "email": "jean.dupont@email.com"
}

# Accès
nom = contact["nom"]  # "Dupont"
email = contact.get("email")  # "jean.dupont@email.com"

# Modification
contact["ville"] = "Paris"  # Ajoute une nouvelle clé
contact["telephone"] = "01 98 76 54 32"  # Modifie une valeur

# Parcours
for cle, valeur in contact.items():
    print(f"{cle}: {valeur}")
```

**Quand utiliser quoi ?**
- **Liste** : quand l'ordre importe et que vous accédez par position
- **Dictionnaire** : quand vous accédez par nom/identifiant

**Exercices (25 min)**
- Ex1: Créez une liste de tâches (strings) et affichez-les numérotées.
- Ex2: Créez un dict `contact` avec `nom`, `email`, `ville` et affichez une phrase complète.
- Ex3 (bonus): Dict de statistiques : nombre d'occurrences de chaque mot dans un texte.

**QCM**
1) Dans une `list`, l'ordre est :
   A) Important
   B) Sans importance
   C) Trié automatiquement
   D) Limité à 10 éléments

2) Dans un `dict`, on accède à :
   A) Un index numérique
   B) Une clé
   C) Le premier élément
   D) Une position aléatoire

3) Ajouter à une liste se fait souvent avec :
   A) `add()`
   B) `append()`
   C) `insert()`
   D) `push()`

**Devoir**
- Écrivez `compter_par_mot(texte)` → dict (mot → nombre d'occurrences).

---

## Cours 7 - Chaînes de caractères (str)
**Objectifs**
- Utiliser les méthodes de chaîne : `lower()`, `strip()`, `split()`
- Construire des messages formatés avec f-strings
- Éviter les erreurs de type avec les chaînes
- Nettoyer et valider les entrées utilisateur

**Leçon (30 min - détaillée)**
Les chaînes de caractères sont partout en programmation : noms, messages, données utilisateur...

**Les chaînes sont immuables**
Une fois créée, une chaîne ne peut pas être modifiée. Les "modifications" créent de nouvelles chaînes.

```python
texte = "Bonjour"
texte = texte + " tout le monde"  # Crée une nouvelle chaîne
```

**Méthodes essentielles**
```python
texte = "  BONJOUR TOUT LE MONDE  "

# Nettoyage
propre = texte.strip()  # "BONJOUR TOUT LE MONDE" (espaces supprimés)
minuscules = texte.lower()  # "  bonjour tout le monde  "
majuscules = texte.upper()  # "  BONJOUR TOUT LE MONDE  "

# Découpage
mots = texte.split()  # ["BONJOUR", "TOUT", "LE", "MONDE"]
mots_max = texte.split(" ", 2)  # Découpe max 2 fois

# Recherche
contient = "BONJOUR" in texte  # True
position = texte.find("TOUT")  # 9 (position du début)

# Remplacement
nouveau = texte.replace("BONJOUR", "SALUT")  # Remplace toutes les occurrences
```

**Le formatage avancé : f-strings**
```python
nom = "Alice"
age = 25
taille = 1.68

# Formatage simple
message = f"Bonjour {nom}, vous avez {age} ans"

# Formatage numérique
prix = 19.99
message = f"Le prix est de {prix:.2f} €"  # 19.99 €
pourcentage = 0.856
message = f"Score : {pourcentage:.1%}"  # 85.6%
```

**Erreurs courantes à éviter**
- Concaténer nombres et chaînes sans conversion : `str(age) + " ans"`
- Oublier que les chaînes sont immuables
- Ne pas nettoyer les entrées utilisateur

**Exercices (25 min)**
- Ex1: Nettoyez une entrée (trim + lower) et validez-la.
- Ex2: Comptez les mots d'une phrase donnée.
- Ex3 (bonus): Créez un slug simple (minuscules, espaces → underscore).

**QCM**
1) `strip()` sert à :
   A) Ajouter des espaces
   B) Enlever les espaces au début et à la fin
   C) Compter les espaces
   D) Remplacer les espaces

2) `split()` sert à :
   A) Coller des éléments
   B) Diviser une chaîne en liste
   C) Compter les caractères
   D) Changer la casse

3) `f"{x}"` sert à :
   A) Créer une fonction
   B) Formater une chaîne avec des variables
   C) Définir une classe
   D) Importer un module

**Devoir**
- Écrivez une fonction `nettoie_nom(nom)` → nom propre et valide.

---

## Cours 8 - Fichiers + JSON
**Objectifs**
- Lire et écrire des fichiers texte
- Utiliser JSON pour structurer les données
- Maîtriser `json.dump` et `json.load`
- Comprendre la sérialisation des données

**Leçon (30 min - détaillée)**
Les fichiers permettent de stocker des données de manière persistante, au-delà de l'exécution du programme.

**Les fichiers texte de base**
```python
# Écriture
with open("mon_fichier.txt", "w") as f:
    f.write("Première ligne\n")
    f.write("Deuxième ligne\n")

# Lecture
with open("mon_fichier.txt", "r") as f:
    contenu = f.read()  # Tout le fichier
    lignes = f.readlines()  # Liste des lignes

# Lecture ligne par ligne
with open("mon_fichier.txt", "r") as f:
    for ligne in f:
        print(ligne.strip())  # strip() enlève \n
```

**JSON : JavaScript Object Notation**
JSON est un format texte pour représenter des structures de données complexes.

```python
import json

# Données Python
donnees = {
    "nom": "Alice",
    "age": 25,
    "hobbies": ["lecture", "programmation", "vélo"],
    "actif": True
}

# Sauvegarde en JSON
with open("profil.json", "w") as f:
    json.dump(donnees, f, indent=2)  # indent pour la lisibilité

# Lecture depuis JSON
with open("profil.json", "r") as f:
    charge = json.load(f)

print(charge["nom"])  # Alice
```

**Types JSON supportés**
- Objets → dictionnaires Python
- Tableaux → listes Python
- Chaînes → str
- Nombres → int/float
- Booléens → True/False
- null → None

**Bonnes pratiques**
- Toujours utiliser `with` pour gérer automatiquement la fermeture des fichiers
- Spécifier l'encodage si nécessaire : `encoding="utf-8"`
- Vérifier que le fichier existe avant de le lire
- Gérer les erreurs de fichier (fichier introuvable, permissions, etc.)

**Exercices (25 min)**
- Ex1: Créez `data.json` avec une liste de tâches puis relisez-la.
- Ex2: Sauvegardez des résultats (ex: statistiques du cours 7).
- Ex3 (bonus): `sauvegarde_json(obj, chemin)` fonction générique.

**QCM**
1) `json.load()` s'utilise pour :
   A) Écrire dans un fichier
   B) Lire depuis un fichier JSON
   C) Créer un objet JSON
   D) Supprimer un fichier

2) JSON sert à :
   A) Exécuter du code Python
   B) Représenter des structures de données
   C) Créer des graphiques
   D) Gérer les bases de données

3) Écrire dans un fichier consiste souvent à :
   A) Ouvrir + lire + fermer
   B) Ouvrir + écrire + fermer
   C) Créer + modifier + supprimer
   D) Copier + coller + sauvegarder

**Devoir**
- Ajoutez un champ dans votre JSON : `cree_le` (date sous forme string).

---

## Cours 9 - Exceptions
**Objectifs**
- Comprendre le mécanisme `try/except`
- Savoir quand et comment gérer les erreurs
- Fournir des messages d'erreur utiles aux utilisateurs
- Écrire du code robuste qui ne plante pas

**Leçon (30 min - détaillée)**
Les exceptions sont des erreurs qui interrompent le flux normal du programme. Bien gérées, elles rendent vos programmes plus fiables.

**Le mécanisme try/except**
```python
try:
    # Code qui peut poser problème
    resultat = 10 / 0  # Division par zéro
except ZeroDivisionError:
    # Code exécuté en cas d'erreur spécifique
    print("Division par zéro interdite !")
except Exception as e:
    # Code pour tout autre type d'erreur
    print(f"Erreur inattendue : {e}")
```

**Types d'exceptions courants**
- `ValueError` : valeur inappropriée (int("abc"))
- `TypeError` : opération sur types incompatibles (5 + "hello")
- `FileNotFoundError` : fichier introuvable
- `KeyError` : clé inexistante dans un dictionnaire
- `IndexError` : index hors limites dans une liste

**finally et else**
```python
try:
    f = open("fichier.txt", "r")
    contenu = f.read()
except FileNotFoundError:
    print("Fichier introuvable")
else:
    # Exécuté seulement si pas d'exception
    print("Lecture réussie")
finally:
    # Toujours exécuté, même en cas d'exception
    f.close()
```

**Quand gérer une exception ?**
- **Oui** : erreurs prévisibles (fichier manquant, conversion ratée)
- **Non** : erreurs de programmation (bugs dans votre code)

**Bonnes pratiques**
- Exceptions spécifiques plutôt que générales
- Messages d'erreur clairs et utiles
- Ne pas cacher les vraies erreurs
- Utiliser finally pour le nettoyage (fermeture de fichiers, connexions...)

**Exercices (25 min)**
- Ex1: Demandez un nombre tant que l'utilisateur ne saisit pas un entier valide.
- Ex2: Testez un parse JSON et affichez un message clair en cas d'erreur.
- Ex3 (bonus): Exception personnalisée `ValidationError`.

**QCM**
1) `try` entoure :
   A) Le code le plus rapide
   B) Le code potentiellement problématique
   C) Les variables globales
   D) Les fonctions

2) `except ValueError` attrape par exemple :
   A) Erreurs de calcul mathématique
   B) Erreurs de valeur numérique invalide
   C) Erreurs de fichier
   D) Erreurs de réseau

3) Gérer une exception sert surtout à :
   A) Ralentir le programme
   B) Rendre l'application robuste
   C) Créer des graphiques
   D) Gérer les couleurs

**Devoir**
- Ajoutez un contrôle de type à vos fonctions (ex: liste non vide).

---

## Cours 10 - Classes (bases)
**Objectifs**
- Créer une classe simple avec attributs et méthodes
- Comprendre l'instanciation d'objets
- Utiliser `__init__` pour initialiser les objets
- Organiser le code de manière orientée objet

**Leçon (30 min - détaillée)**
La programmation orientée objet permet de modéliser des concepts du monde réel dans le code.

**Qu'est-ce qu'une classe ?**
Une classe est comme un plan ou un moule pour créer des objets. Par exemple, la classe "Voiture" définit ce qu'est une voiture en général.

**Créer une classe simple**
```python
class Tache:
    def __init__(self, titre, description=""):
        self.titre = titre
        self.description = description
        self.terminee = False
        self.id = None  # Sera défini plus tard

    def marquer_terminee(self):
        self.terminee = True

    def marquer_en_cours(self):
        self.terminee = False

    def __str__(self):
        statut = "✓" if self.terminee else "○"
        return f"{statut} {self.titre}"
```

**Instancier des objets**
```python
# Créer des objets (instances)
tache1 = Tache("Apprendre Python", "Suivre le module 1")
tache2 = Tache("Faire du sport")

# Utiliser les objets
print(tache1)  # Affiche la tâche
tache1.marquer_terminee()
print(tache1)  # Maintenant marquée comme terminée
```

**Le rôle de `self`**
`self` représente l'instance actuelle de la classe. C'est grâce à `self` que chaque objet "sait" qu'il travaille sur lui-même.

**Méthodes spéciales**
- `__init__` : constructeur, appelé lors de la création
- `__str__` : définit comment afficher l'objet avec `print()`
- `__repr__` : représentation technique de l'objet

**Avantages de l'orienté objet**
- Regrouper données et comportements
- Réutiliser le code
- Modéliser des concepts complexes
- Maintenir plus facilement le code

**Exercices (25 min)**
- Ex1: Classe `Tache` avec `id`, `titre`, `terminee`.
- Ex2: Méthode `marquer_terminee()` qui change l'état.
- Ex3 (bonus): `to_dict()` pour la sérialisation.

**QCM**
1) `__init__` sert à :
   A) Terminer une classe
   B) Initialiser les objets lors de leur création
   C) Définir les méthodes
   D) Importer des modules

2) Une méthode est :
   A) Une variable dans une classe
   B) Une fonction dans une classe
   C) Un type de données
   D) Un fichier spécial

3) `self` représente :
   A) La classe elle-même
   B) L'instance actuelle de l'objet
   C) Toutes les instances
   D) Le programme principal

**Devoir**
- Ajoutez `echeance` (optionnel) dans `Tache` et mettez à jour `to_dict()`.

---

## Cours 11 - Web : HTTP + Flask "hello"
**Objectifs**
- Comprendre les bases du protocole HTTP
- Différencier client et serveur web
- Créer une première application Flask
- Configurer une route simple

**Leçon (30 min - détaillée)**
Le web repose sur le protocole HTTP (HyperText Transfer Protocol) qui permet la communication entre navigateurs et serveurs.

**Le modèle client-serveur**
- **Client** : Votre navigateur web (Chrome, Firefox, etc.)
- **Serveur** : L'ordinateur qui héberge le site web
- **HTTP** : Le langage qu'ils utilisent pour communiquer

**Les méthodes HTTP**
- **GET** : Demander une ressource (page, image, données...)
- **POST** : Envoyer des données au serveur (formulaire, upload...)
- **PUT** : Modifier une ressource existante
- **DELETE** : Supprimer une ressource

**URLs et routes**
Une URL (Uniform Resource Locator) identifie une ressource sur le web :
`https://www.exemple.com/articles/python/bases`

- `https` : protocole
- `www.exemple.com` : domaine
- `/articles/python/bases` : chemin/route

**Flask : micro-framework Python**
Flask est léger et facile à apprendre, parfait pour débuter.

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def accueil():
    return 'Bonjour depuis Flask !'

@app.route('/hello/<nom>')
def saluer(nom):
    return f'Bonjour {nom} !'

if __name__ == '__main__':
    app.run(debug=True)
```

**Démarrer un serveur Flask**
```bash
python app.py
# Ou avec flask run
```

Le serveur sera accessible sur `http://localhost:5000`

**Exercices (25 min)**
- Ex1: Installez `flask` dans un environnement virtuel.
- Ex2: Écrivez `app.py` avec `@app.route("/")` qui retourne du texte.
- Ex3 (bonus): Renvoie un status code différent (ex: 404).

**QCM**
1) Le client HTTP c'est :
   A) Le serveur web
   B) Le navigateur web
   C) La base de données
   D) Le pare-feu

2) Une route Flask correspond à :
   A) Une base de données
   B) Une URL spécifique
   C) Un fichier CSS
   D) Un utilisateur

3) `GET` sert surtout à :
   A) Supprimer des données
   B) Demander une ressource
   C) Modifier des données
   D) Créer des comptes

**Devoir**
- Écrivez 5 URL possibles pour votre futur mini-projet (ex: `/tasks`).

---

## Cours 12 - Routage GET/POST + récupérer des données
**Objectifs**
- Utiliser `request` pour accéder aux données envoyées
- Comprendre les formulaires HTML en POST
- Construire une logique serveur complète
- Gérer les données utilisateur de manière sécurisée

**Leçon (30 min - détaillée)**
Maintenant que nous savons créer des routes, apprenons à recevoir et traiter des données du client.

**L'objet `request`**
Flask fournit un objet `request` qui contient toutes les informations envoyées par le client.

```python
from flask import Flask, request

app = Flask(__name__)

@app.route('/recherche')
def rechercher():
    # Récupérer un paramètre GET
    query = request.args.get('q', '')  # '' si pas de paramètre
    return f"Recherche : {query}"

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        nom = request.form.get('nom')
        email = request.form.get('email')
        return f"Merci {nom}, nous vous contacterons à {email}"
    return '''
    <form method="POST">
        <input name="nom" placeholder="Votre nom">
        <input name="email" placeholder="Votre email">
        <button type="submit">Envoyer</button>
    </form>
    '''
```

**GET vs POST**
- **GET** : Données dans l'URL, visibles, pour récupérer des informations
- **POST** : Données dans le corps de la requête, cachées, pour modifier des données

**Sécurité des formulaires**
- Toujours valider les données côté serveur
- Échapper les caractères spéciaux
- Limiter la taille des données
- Utiliser HTTPS en production

**Exercices (25 min)**
- Ex1: Route `/add` (POST) qui reçoit `titre` depuis un formulaire.
- Ex2: Affichez un message de confirmation.
- Ex3 (bonus): Séparez dans `creer_tache(titre)`.

**QCM**
1) Pour lire une donnée envoyée via formulaire :
   A) `request.get()`
   B) `request.form`
   C) `request.data`
   D) `request.json`

2) `POST` est utile quand :
   A) On veut juste afficher une page
   B) On envoie des données au serveur
   C) On télécharge une image
   D) On navigue vers une autre page

3) Une route décide quoi faire pour :
   A) Une base de données
   B) Une URL spécifique
   C) Un fichier CSS
   D) Un utilisateur connecté

**Devoir**
- Créez un formulaire HTML minimal qui envoie vers `/add`.

---

## Cours 13 - Templates Jinja2 : HTML dynamique
**Objectifs**
- Comprendre le rôle des templates dans une application web
- Injecter des variables Python dans du HTML
- Afficher des listes et structures de données
- Séparer la logique métier de la présentation

**Leçon (30 min - détaillée)**
Les templates permettent de générer du HTML dynamique en mélangeant HTML statique et données Python.

**Pourquoi des templates ?**
Sans templates, il faudrait construire le HTML en Python avec des concaténations :
```python
html = "<h1>" + titre + "</h1><ul>"
for item in liste:
    html += "<li>" + item + "</li>"
html += "</ul>"
```

Avec Jinja2, c'est beaucoup plus propre et maintenable.

**Syntaxe de base de Jinja2**
```html
<!-- templates/base.html -->
<!DOCTYPE html>
<html>
<head>
    <title>{{ titre_page }}</title>
</head>
<body>
    <h1>{{ titre_page }}</h1>
    
    {% if utilisateur %}
        <p>Bonjour {{ utilisateur.nom }} !</p>
    {% else %}
        <p>Connectez-vous</p>
    {% endif %}
    
    <ul>
    {% for tache in taches %}
        <li>{{ tache.titre }}</li>
    {% endfor %}
    </ul>
</body>
</html>
```

**Utilisation dans Flask**
```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def accueil():
    return render_template('base.html', 
                         titre_page='Ma Todo List',
                         utilisateur={'nom': 'Alice'},
                         taches=[
                             {'titre': 'Apprendre Python'},
                             {'titre': 'Faire du sport'}
                         ])
```

**Expressions Jinja2**
- `{{ variable }}` : Afficher une variable
- `{% if condition %}` : Condition
- `{% for item in liste %}` : Boucle
- `{% extends "base.html" %}` : Héritage de template

**Exercices (25 min)**
- Ex1: `render_template("tasks.html", tasks=...)`.
- Ex2: Template qui affiche une liste de tâches.
- Ex3 (bonus): Condition dans le template (`{% if ... %}`).

**QCM**
1) Un template sert à :
   A) Stocker des données
   B) Générer du HTML avec variables
   C) Créer des bases de données
   D) Gérer les utilisateurs

2) Jinja utilise :
   A) `{{ }}` et `{% %}`
   B) `<>` et `</>`
   C) `()` et `[]`
   D) `{}` et `[]`

3) Rendre un template se fait avec :
   A) `render()`
   B) `template()`
   C) `render_template(...)`
   D) `html()`

**Devoir**
- Ajoutez un message "Aucune tâche" si la liste est vide.

---

## Cours 14 - Validation + retours utilisateur
**Objectifs**
- Valider les données saisies par l'utilisateur
- Rediriger l'utilisateur après une action
- Afficher des messages d'erreur ou de succès
- Améliorer l'expérience utilisateur

**Leçon (30 min - détaillée)**
Une application web robuste doit valider toutes les données entrantes et guider l'utilisateur.

**Pourquoi valider ?**
- **Sécurité** : Éviter les injections, les attaques
- **Cohérence** : Données valides et utilisables
- **UX** : Messages clairs quand quelque chose ne va pas

**Validation côté serveur**
Toujours valider côté serveur, même si vous validez aussi côté client (JavaScript).

```python
from flask import Flask, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = 'clé_secrète_pour_flash'

@app.route('/add', methods=['POST'])
def ajouter_tache():
    titre = request.form.get('titre', '').strip()
    
    # Validation
    if not titre:
        flash("Le titre ne peut pas être vide", "error")
        return redirect(url_for('liste_taches'))
    
    if len(titre) > 100:
        flash("Le titre est trop long (max 100 caractères)", "error")
        return redirect(url_for('liste_taches'))
    
    # Si valide, traiter
    # ... sauvegarder la tâche ...
    
    flash("Tâche ajoutée avec succès !", "success")
    return redirect(url_for('liste_taches'))
```

**Messages flash**
Les messages flash permettent d'afficher des notifications temporaires à l'utilisateur.

**Redirections**
Après une action POST réussie, redirigez toujours l'utilisateur pour éviter les re-soumissions accidentelles.

**Exercices (25 min)**
- Ex1: Refusez un titre vide.
- Ex2: Si ok, ajoutez la tâche puis redirigez.
- Ex3 (bonus): Affichez un message d'erreur dans le template.

**QCM**
1) Valider en serveur sert à :
   A) Rendre le site plus lent
   B) Protéger l'application
   C) Créer des animations
   D) Gérer les couleurs

2) Une redirection se fait souvent avec :
   A) `redirect(...)`
   B) `render_template(...)`
   C) `url_for(...)`
   D) `flash(...)`

3) Un titre vide est souvent :
   A) Autorisé
   B) Invalide
   C) Recommandé
   D) Ignoré

**Devoir**
- Ajoutez une validation de longueur (ex: 3 à 60 caractères).

---

## Cours 15 - Gestion d'erreurs web (404/500)
**Objectifs**
- Créer des pages d'erreur personnalisées
- Comprendre l'impact des erreurs serveur
- Utiliser les handlers d'erreur et `abort`
- Améliorer la gestion des erreurs utilisateur

**Leçon (30 min - détaillée)**
Les erreurs sont inévitables. Une bonne gestion des erreurs améliore grandement l'expérience utilisateur.

**Erreurs HTTP courantes**
- **404 Not Found** : Ressource introuvable
- **500 Internal Server Error** : Erreur serveur (bug dans votre code)
- **400 Bad Request** : Requête mal formée
- **403 Forbidden** : Accès refusé
- **401 Unauthorized** : Non authentifié

**Handlers d'erreur personnalisés**
```python
from flask import Flask, render_template, abort

app = Flask(__name__)

@app.errorhandler(404)
def page_non_trouvee(error):
    return render_template('404.html'), 404

@app.errorhandler(500)
def erreur_serveur(error):
    return render_template('500.html'), 500

@app.route('/tache/<int:id>')
def detail_tache(id):
    tache = trouver_tache_par_id(id)
    if not tache:
        abort(404)  # Déclenche l'erreur 404
    return render_template('detail_tache.html', tache=tache)
```

**Utiliser `abort()`**
`abort(code)` interrompt immédiatement la requête et déclenche le handler d'erreur approprié.

**Templates d'erreur**
```html
<!-- templates/404.html -->
<h1>Page non trouvée</h1>
<p>Désolé, la page que vous cherchez n'existe pas.</p>
<a href="{{ url_for('accueil') }}">Retour à l'accueil</a>

<!-- templates/500.html -->
<h1>Erreur interne</h1>
<p>Une erreur inattendue s'est produite. Nos équipes ont été notifiées.</p>
```

**Exercices (25 min)**
- Ex1: Gérez une route inconnue (404).
- Ex2: Déclenchez un 500 (cas forcé) pour comprendre.
- Ex3 (bonus): Message utilisateur en cas de mauvais input.

**QCM**
1) 404 signifie :
   A) Erreur de serveur
   B) Ressource introuvable
   C) Accès refusé
   D) Requête mal formée

2) Arrêter une route :
   A) `stop()`
   B) `abort(404)`
   C) `exit()`
   D) `break`

3) Une bonne gestion d'erreur sert à :
   A) Cacher les bugs
   B) Aider et guider l'utilisateur
   C) Ralentir l'application
   D) Créer des animations

**Devoir**
- Ajoutez une page "Erreur" générique pour les erreurs 500.

---

## Cours 16 - Structure de projet + static vs templates
**Objectifs**
- Comprendre la séparation des dossiers `templates/` et `static/`
- Rendre le projet maintenable et évolutif
- Éviter les chemins absolus dans le code
- Organiser le code de manière professionnelle

**Leçon (30 min - détaillée)**
Un projet bien structuré est plus facile à maintenir, déboguer et faire évoluer.

**Structure recommandée pour Flask**
```
mon_projet/
├── app.py                 # Point d'entrée principal
├── config.py             # Configuration
├── models.py             # Classes/modèles de données
├── routes.py             # Définition des routes
├── static/               # Fichiers statiques
│   ├── css/
│   ├── js/
│   └── images/
├── templates/            # Templates HTML
│   ├── base.html
│   ├── tasks.html
│   └── ...
└── requirements.txt      # Dépendances Python
```

**Dossier `templates/`**
- Contient les fichiers HTML générés par le serveur
- Utilisés par `render_template()`
- Peuvent inclure d'autres templates (héritage)
- Variables injectées via Jinja2

**Dossier `static/`**
- Contient les fichiers servis tels quels par le serveur
- CSS, JavaScript, images, polices...
- Accessibles directement via URL : `/static/css/style.css`
- Non traités par Jinja2

**Chemins relatifs vs absolus**
```python
# ❌ Chemin absolu (problématique)
css_path = "C:/Users/Alice/projet/static/css/style.css"

# ✅ Chemin relatif depuis la racine du projet
css_path = "static/css/style.css"
```

**Exercices (25 min)**
- Ex1: Déplacez les HTML dans `templates/`.
- Ex2: Ajoutez un fichier CSS dans `static/`.
- Ex3 (bonus): Factorisez la génération de la liste de tâches.

**QCM**
1) `templates/` contient :
   A) Fichiers servis directement
   B) HTML généré par le serveur
   C) Code Python
   D) Bases de données

2) `static/` contient :
   A) Templates HTML
   B) Fichiers servis tels quels
   C) Code Python
   D) Données utilisateur

3) Une séparation aide à :
   A) Ralentir le développement
   B) Maintenir et relire le code
   C) Créer des bugs
   D) Compliquer la structure

**Devoir**
- Renommez vos fichiers et vérifiez que tout marche sans chemins absolus.

---

## Cours 17 - CRUD en mémoire
**Objectifs**
- Implémenter les opérations CRUD (Create/Read/Update/Delete)
- Définir des routes pour manipuler les tâches
- Comprendre la logique de gestion des données
- Préparer la transition vers une vraie base de données

**Leçon (30 min - détaillée)**
CRUD signifie Create, Read, Update, Delete - les quatre opérations de base sur les données.

**Stockage en mémoire**
Pour commencer, nous stockerons les tâches dans une liste Python simple. Ce n'est pas persistant (perdu au redémarrage), mais c'est parfait pour comprendre la logique.

```python
# Dans app.py ou models.py
taches = []  # Liste globale pour stocker les tâches

def ajouter_tache(titre):
    nouvelle_tache = {
        'id': len(taches) + 1,
        'titre': titre,
        'terminee': False,
        'creee_le': datetime.now()
    }
    taches.append(nouvelle_tache)
    return nouvelle_tache

def trouver_tache_par_id(id_tache):
    for tache in taches:
        if tache['id'] == id_tache:
            return tache
    return None

def supprimer_tache(id_tache):
    global taches
    taches = [t for t in taches if t['id'] != id_tache]
```

**Routes CRUD**
```python
@app.route('/')
def liste_taches():
    return render_template('tasks.html', taches=taches)

@app.route('/add', methods=['POST'])
def ajouter():
    titre = request.form.get('titre')
    if titre:
        ajouter_tache(titre)
    return redirect(url_for('liste_taches'))

@app.route('/delete/<int:id>')
def supprimer(id):
    supprimer_tache(id)
    return redirect(url_for('liste_taches'))

@app.route('/toggle/<int:id>')
def basculer(id):
    tache = trouver_tache_par_id(id)
    if tache:
        tache['terminee'] = not tache['terminee']
    return redirect(url_for('liste_taches'))
```

**Exercices (25 min)**
- Ex1: Stockez les tâches en liste Python au démarrage.
- Ex2: Route `/delete/<id>` (suppression).
- Ex3 (bonus): Route `/edit/<id>` (mise à jour).

**QCM**
1) CRUD signifie :
   A) Create/Read/Update/Delete
   B) Code/Run/Update/Debug
   C) Client/Request/Update/Data
   D) Create/Request/Update/Database

2) En mémoire signifie :
   A) Stocké dans un fichier
   B) Perdu au redémarrage du programme
   C) Sauvegardé automatiquement
   D) Partagé entre utilisateurs

3) `/delete/<id>` sert à :
   A) Créer une tâche
   B) Supprimer une tâche
   C) Modifier une tâche
   D) Afficher une tâche

**Devoir**
- Créez une vue "détails" d'une tâche (lecture par id).

---

## Cours 18 - SQLite : créer le stockage
**Objectifs**
- Comprendre le rôle d'une base de données dans une application
- Créer la table `tasks` avec SQLite
- Insérer des données dans la base
- Configurer la connexion à la base de données

**Leçon (30 min - détaillée)**
SQLite est une base de données légère qui stocke les données dans un fichier local.

**Pourquoi une base de données ?**
- **Persistance** : Les données survivent aux redémarrages
- **Structure** : Données organisées en tables
- **Recherche** : Requêtes complexes possibles
- **Intégrité** : Contraintes et validations

**Créer une base SQLite**
```python
import sqlite3

# Connexion à la base (crée le fichier s'il n'existe pas)
conn = sqlite3.connect('tasks.db')
cursor = conn.cursor()

# Créer la table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titre TEXT NOT NULL,
        description TEXT,
        terminee BOOLEAN DEFAULT FALSE,
        creee_le DATETIME DEFAULT CURRENT_TIMESTAMP
    )
''')

conn.commit()
conn.close()
```

**Insérer des données**
```python
def ajouter_tache_db(titre, description=""):
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    cursor.execute('''
        INSERT INTO tasks (titre, description)
        VALUES (?, ?)
    ''', (titre, description))
    
    task_id = cursor.lastrowid
    conn.commit()
    conn.close()
    
    return task_id
```

**Lire des données**
```python
def lister_taches_db():
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    cursor.execute('SELECT id, titre, description, terminee FROM tasks')
    taches = cursor.fetchall()
    
    conn.close()
    return taches
```

**Exercices (25 min)**
- Ex1: Fichier `db.py` qui initialise la table.
- Ex2: Insérer dans `tasks`.
- Ex3 (bonus): Récupérer une liste depuis la base.

**QCM**
1) SQLite stocke dans :
   A) La mémoire RAM
   B) Un fichier local
   C) Le cloud
   D) Un serveur distant

2) Une table regroupe :
   A) Des fichiers
   B) Des lignes et colonnes
   C) Des fonctions
   D) Des variables

3) Insérer en SQL utilise souvent :
   A) `ADD INTO`
   B) `INSERT INTO`
   C) `CREATE INTO`
   D) `PUT INTO`

**Devoir**
- Ajoutez une colonne `created_at` et l'alimentez (facultatif).

---

## Cours 19 - CRUD SQLite (modèle définitif)
**Objectifs**
- Implémenter toutes les opérations CRUD avec SQL
- Réduire les duplications de code
- Rendre l'interface cohérente
- Optimiser les requêtes SQL

**Leçon (30 min - détaillée)**
Maintenant que nous maîtrisons SQLite, implémentons toutes les opérations CRUD de manière propre.

**Fonctions CRUD complètes**
```python
def creer_tache(titre, description=""):
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    cursor.execute('''
        INSERT INTO tasks (titre, description)
        VALUES (?, ?)
    ''', (titre, description))
    
    task_id = cursor.lastrowid
    conn.commit()
    conn.close()
    
    return task_id

def lire_toutes_les_taches():
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    cursor.execute('SELECT * FROM tasks ORDER BY creee_le DESC')
    taches = cursor.fetchall()
    
    conn.close()
    return taches

def lire_tache_par_id(task_id):
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    cursor.execute('SELECT * FROM tasks WHERE id = ?', (task_id,))
    tache = cursor.fetchone()
    
    conn.close()
    return tache

def mettre_a_jour_tache(task_id, titre=None, description=None, terminee=None):
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    # Construire la requête dynamiquement
    updates = []
    params = []
    
    if titre is not None:
        updates.append('titre = ?')
        params.append(titre)
    
    if description is not None:
        updates.append('description = ?')
        params.append(description)
    
    if terminee is not None:
        updates.append('terminee = ?')
        params.append(terminee)
    
    if updates:
        query = f'UPDATE tasks SET {", ".join(updates)} WHERE id = ?'
        params.append(task_id)
        
        cursor.execute(query, params)
        conn.commit()
    
    conn.close()

def supprimer_tache(task_id):
    conn = sqlite3.connect('tasks.db')
    cursor = conn.cursor()
    
    cursor.execute('DELETE FROM tasks WHERE id = ?', (task_id,))
    conn.commit()
    
    conn.close()
```

**Utilisation dans les routes**
```python
@app.route('/edit/<int:id>', methods=['GET', 'POST'])
def editer_tache(id):
    if request.method == 'POST':
        titre = request.form.get('titre')
        mettre_a_jour_tache(id, titre=titre)
        return redirect(url_for('liste_taches'))
    
    tache = lire_tache_par_id(id)
    return render_template('edit_task.html', tache=tache)
```

**Exercices (25 min)**
- Ex1: Read : `SELECT` + affichage template.
- Ex2: Update : `UPDATE ... WHERE id=?`.
- Ex3: Delete : `DELETE ... WHERE id=?`.
- Ex4 (bonus): Bouton toggle `terminee`.

**QCM**
1) `?` dans SQL protège surtout contre :
   A) Les lenteurs
   B) L'injection SQL
   C) Les erreurs de syntaxe
   D) Les plantages

2) `UPDATE` sert à :
   A) Créer des données
   B) Modifier des données
   C) Supprimer des données
   D) Lire des données

3) `DELETE` sert à :
   A) Créer des données
   B) Modifier des données
   C) Supprimer des données
   D) Lire des données

**Devoir**
- Réfléchissez aux cas limites : id inexistant, titre invalide.

---

## Cours 20 - Organisation du code (propre)
**Objectifs**
- Séparer les routes (web) et le repository (base de données)
- Créer des fichiers lisibles et maintenables
- Utiliser une configuration centralisée
- Appliquer les principes de l'architecture propre

**Leçon (30 min - détaillée)**
Un code bien organisé est plus facile à maintenir, déboguer et faire évoluer.

**Architecture proposée**
```
├── app.py          # Application Flask principale
├── config.py       # Configuration centralisée
├── models.py       # Classes de données (Tache)
├── database.py     # Fonctions d'accès à la base
├── routes.py       # Définition des routes web
└── templates/      # Templates HTML
```

**Séparation des responsabilités**
- **Routes** : Recevoir les requêtes HTTP et orchestrer les réponses
- **Base de données** : Gérer l'accès aux données (CRUD)
- **Modèles** : Représenter les entités métier
- **Configuration** : Paramètres variables selon l'environnement

**Exemple d'organisation**
```python
# config.py
class Config:
    SECRET_KEY = 'dev-secret-key'
    DATABASE = 'tasks.db'
    DEBUG = True

# models.py
class Tache:
    def __init__(self, id=None, titre="", description="", terminee=False):
        self.id = id
        self.titre = titre
        self.description = description
        self.terminee = terminee

# database.py
def creer_tache(titre, description=""):
    # Logique d'insertion en base
    pass

def lister_taches():
    # Logique de récupération
    pass

# routes.py
from flask import Blueprint, render_template, request, redirect, url_for
from .database import creer_tache, lister_taches

bp = Blueprint('tasks', __name__)

@bp.route('/')
def liste():
    taches = lister_taches()
    return render_template('tasks.html', taches=taches)

@bp.route('/add', methods=['POST'])
def ajouter():
    titre = request.form.get('titre')
    if titre:
        creer_tache(titre)
    return redirect(url_for('tasks.liste'))

# app.py
from flask import Flask
from config import Config
from routes import bp

app = Flask(__name__)
app.config.from_object(Config)
app.register_blueprint(bp)

if __name__ == '__main__':
    app.run()
```

**Exercices (25 min)**
- Ex1: Créez des fichiers/routes `routes/tasks_routes.py` ou équivalents.
- Ex2: Repository `TaskRepository` avec méthodes CRUD.
- Ex3 (bonus): Factorisez la validation formulaire.

**QCM**
1) Séparation aide à :
   A) Créer plus de bugs
   B) Éviter la duplication de code
   C) Ralentir le développement
   D) Compliquer la lecture

2) Un repository sert à :
   A) Gérer l'interface utilisateur
   B) Gérer l'accès à la base de données
   C) Créer des routes web
   D) Configurer l'application

3) `app.py` devrait contenir surtout :
   A) Toute la logique métier
   B) Orchestration minimale et configuration
   C) Les templates HTML
   D) Les requêtes SQL

**Devoir**
- Écrivez un mini "schéma" routes → repository → SQL → template.

---

## Cours 21 - Endpoint JSON (API)
**Objectifs**
- Fournir une route `/api/tasks` qui renvoie du JSON
- Convertir des objets tâche en dictionnaires
- Tester l'API dans le navigateur
- Comprendre les principes des API REST

**Leçon (30 min - détaillée)**
Une API (Application Programming Interface) permet à d'autres programmes d'interagir avec votre application.

**API REST**
- **RE**presentational **S**tate **T**ransfer
- Architecture pour les services web
- Utilise HTTP comme protocole de transport
- Données échangées en JSON

**Créer une API JSON**
```python
from flask import jsonify

@app.route('/api/tasks')
def api_lister_taches():
    taches = lister_taches_db()
    
    # Convertir en format JSON
    taches_json = []
    for tache in taches:
        taches_json.append({
            'id': tache[0],
            'titre': tache[1],
            'description': tache[2],
            'terminee': bool(tache[3]),
            'creee_le': tache[4]
        })
    
    return jsonify(taches_json)

@app.route('/api/tasks/<int:id>')
def api_detail_tache(id):
    tache = lire_tache_par_id(id)
    if not tache:
        return jsonify({'error': 'Tâche non trouvée'}), 404
    
    return jsonify({
        'id': tache[0],
        'titre': tache[1],
        'description': tache[2],
        'terminee': bool(tache[3]),
        'creee_le': tache[4]
    })
```

**Tester l'API**
- Dans le navigateur : `http://localhost:5000/api/tasks`
- Avec curl : `curl http://localhost:5000/api/tasks`
- Avec un outil comme Postman ou Insomnia

**Avantages d'une API**
- Séparation front/back
- Réutilisable par d'autres applications
- Format standardisé (JSON)
- Facilite les tests automatisés

**Exercices (25 min)**
- Ex1: Route `/api/tasks` renvoie une liste.
- Ex2: Ajouter `/api/tasks/<id>` (optionnel).
- Ex3 (bonus): Id inexistant → 404.

**QCM**
1) JSON est adapté pour :
   A) Stocker des images
   B) Échange front/back
   C) Créer des animations
   D) Gérer des bases de données

2) Une API doit être :
   A) Complexe à utiliser
   B) Cohérente et documentée
   C) Pleine de bugs
   D) Très lente

3) JSON d'une tâche peut contenir :
   A) Seulement l'id
   B) Id et titre
   C) Toutes les informations pertinentes
   D) Des données secrètes

**Devoir**
- Ajoutez 2 exemples de réponses JSON dans un `README` (1 page).

---

## Cours 22 - Sécurité basique et hygiène web
**Objectifs**
- Éviter les vulnérabilités courantes comme l'injection SQL
- Comprendre l'échappement HTML (XSS)
- Apprendre les bonnes pratiques de validation
- Sécuriser les interactions utilisateur

**Leçon (30 min - détaillée)**
La sécurité web est cruciale. Même une petite application doit suivre des bonnes pratiques.

**Injection SQL**
Problème : Un utilisateur malintentionné peut injecter du code SQL.

```python
# ❌ DANGEREUX - Concaténation
titre = request.form.get('titre')
cursor.execute(f"SELECT * FROM tasks WHERE titre = '{titre}'")

# Si titre = "'; DROP TABLE tasks; --"
# La requête devient : SELECT * FROM tasks WHERE titre = ''; DROP TABLE tasks; --'
```

```python
# ✅ SÉCURISÉ - Paramètres
titre = request.form.get('titre')
cursor.execute("SELECT * FROM tasks WHERE titre = ?", (titre,))
```

**Cross-Site Scripting (XSS)**
Problème : Code JavaScript injecté dans le HTML.

```python
# ❌ DANGEREUX
titre = request.form.get('titre')
return f"<h1>{titre}</h1>"

# Si titre = "<script>alert('XSS!')</script>"
# Le HTML devient : <h1><script>alert('XSS!')</script></h1>
```

```python
# ✅ SÉCURISÉ - Jinja2 échappe automatiquement
return render_template('task.html', titre=titre)
```

**Validation des entrées**
- Vérifier les types de données
- Limiter les longueurs
- Valider les formats (email, URL...)
- Échapper les caractères spéciaux

**Autres bonnes pratiques**
- Utiliser HTTPS en production
- Valider côté serveur (pas seulement côté client)
- Sanitiser les données avant stockage
- Limiter les taux de requêtes (rate limiting)

**Exercices (25 min)**
- Ex1: Vérifiez que SQL utilise des paramètres.
- Ex2: Ne pas injecter du brut dans le template (laissez Jinja échapper).
- Ex3 (bonus): Erreur si titre trop long.

**QCM**
1) Injection SQL arrive souvent quand :
   A) On utilise des paramètres
   B) On concatène des chaînes dans les requêtes
   C) On utilise des transactions
   D) On ferme les connexions

2) Jinja échappe généralement :
   A) Les nombres
   B) Les variables HTML
   C) Les fichiers statiques
   D) Les routes

3) Validation serveur sert aussi à :
   A) Créer des animations
   B) Sécuriser l'application
   C) Ralentir les requêtes
   D) Colorer le code

**Devoir**
- Listez 3 points de sécurité que vous conserverez pour le module 2.

---

## Cours 23 - Tests simples
**Objectifs**
- Écrire des tests pour valider le repository
- Utiliser le module `unittest` de Python
- Comprendre l'importance des tests automatisés
- Créer une suite de tests maintenable

**Leçon (30 min - détaillée)**
Les tests automatisés garantissent que votre code fonctionne correctement et détectent les régressions.

**Pourquoi tester ?**
- **Confiance** : Savoir que le code fonctionne
- **Maintenance** : Détecter les bugs lors des modifications
- **Documentation** : Les tests montrent comment utiliser le code
- **Refactoring** : Modifier le code en toute sécurité

**Module unittest**
```python
import unittest
from database import creer_tache, lister_taches, supprimer_tache

class TestTaches(unittest.TestCase):
    
    def setUp(self):
        # Code exécuté avant chaque test
        # Initialiser une base de test vide
        pass
    
    def tearDown(self):
        # Code exécuté après chaque test
        # Nettoyer la base de test
        pass
    
    def test_creer_tache(self):
        # Test de création d'une tâche
        task_id = creer_tache("Test task")
        self.assertIsNotNone(task_id)
        
        # Vérifier que la tâche existe
        taches = lister_taches()
        self.assertEqual(len(taches), 1)
        self.assertEqual(taches[0][1], "Test task")  # titre
    
    def test_supprimer_tache_inexistante(self):
        # Test de suppression d'une tâche qui n'existe pas
        # Ne devrait pas planter
        supprimer_tache(999)
        
        # Vérifier que rien n'a changé
        taches = lister_taches()
        self.assertEqual(len(taches), 0)

if __name__ == '__main__':
    unittest.main()
```

**Lancer les tests**
```bash
python -m unittest tests.py
# ou
python -m unittest discover
```

**Bonnes pratiques de test**
- Un test = une fonctionnalité
- Noms descriptifs : `test_creer_tache_vide_devrait_echouer`
- Tests indépendants
- Utiliser des assertions appropriées
- Tester les cas nominaux et les cas d'erreur

**Exercices (25 min)**
- Ex1: Testez `create_task` et `list_tasks`.
- Ex2: Testez `update_task` (état terminé).
- Ex3 (bonus): Comportement sur id inexistant.

**QCM**
1) Un test unitaire teste :
   A) L'interface utilisateur
   B) Une petite partie du code
   C) L'ensemble de l'application
   D) Les performances

2) Un test utile doit :
   A) Être rapide à écrire
   B) Vérifier une règle métier
   C) Utiliser beaucoup de données
   D) Tester tous les cas possibles

3) Tester tôt aide à :
   A) Créer plus de bugs
   B) Réduire les surprises
   C) Ralentir le développement
   D) Compliquer le code

**Devoir**
- Ajoutez au moins 2 tests supplémentaires (cas limites).

---

## Cours 24 - HTML/CSS : mise en page
**Objectifs**
- Structurer une page HTML sémantique
- Utiliser CSS pour créer une mise en page attractive
- Comprendre Flexbox et Grid pour les layouts modernes
- Créer une interface utilisateur cohérente

**Leçon (30 min - détaillée)**
Une bonne interface utilisateur améliore l'expérience et la productivité des utilisateurs.

**Structure HTML sémantique**
```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ma Todo List</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}">
</head>
<body>
    <header>
        <h1>Mes Tâches</h1>
        <nav>
            <a href="/">Accueil</a>
            <a href="/add">Ajouter</a>
        </nav>
    </header>
    
    <main>
        <section class="tasks-list">
            <h2>Tâches en cours</h2>
            <!-- Liste des tâches -->
        </section>
    </main>
    
    <footer>
        <p>&copy; 2024 Ma Todo App</p>
    </footer>
</body>
</html>
```

**CSS Flexbox pour les layouts**
```css
/* Layout principal */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

header {
    background-color: #333;
    color: white;
    padding: 1rem;
}

main {
    flex: 1;
    padding: 2rem;
}

footer {
    background-color: #f5f5f5;
    text-align: center;
    padding: 1rem;
}

/* Liste de tâches */
.tasks-list {
    max-width: 800px;
    margin: 0 auto;
}

.task-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    border: 1px solid #ddd;
    margin-bottom: 0.5rem;
    border-radius: 4px;
}

.task-item.completed {
    opacity: 0.6;
    text-decoration: line-through;
}
```

**Responsive Design**
```css
@media (max-width: 768px) {
    .task-item {
        flex-direction: column;
        align-items: flex-start;
    }
    
    main {
        padding: 1rem;
    }
}
```

**Exercices (25 min)**
- Ex1: Créez un layout 2 colonnes (ou une colonne centrée).
- Ex2: Stylisez une liste de tâches.
- Ex3 (bonus): Style "terminée" (barrer le texte).

**QCM**
1) CSS sert à :
   A) Programmer la logique
   B) Présenter et styliser le contenu
   C) Gérer les bases de données
   D) Créer des animations complexes

2) Responsive vise à :
   A) Rendre le site plus lent
   B) S'adapter aux différentes tailles d'écran
   C) Ajouter des publicités
   D) Créer des popups

3) Un bon style rend :
   A) Le site plus lent
   B) Plus clair et agréable à utiliser
   C) Plus difficile à maintenir
   D) Moins accessible

**Devoir**
- Proposez 2 améliorations UI pour votre app.

---

## Cours 25 - Composants UI et ergonomie
**Objectifs**
- Améliorer la navigation dans l'application
- Ajouter des messages de feedback utilisateur
- Rendre l'interface plus accessible
- Optimiser l'expérience utilisateur globale

**Leçon (30 min - détaillée)**
L'ergonomie (UX) détermine si les utilisateurs trouvent votre application agréable et efficace.

**Messages de feedback**
```html
<!-- templates/tasks.html -->
{% with messages = get_flashed_messages(with_categories=true) %}
  {% if messages %}
    {% for category, message in messages %}
      <div class="alert alert-{{ category }}">
        {{ message }}
      </div>
    {% endfor %}
  {% endif %}
{% endwith %}

<form method="POST" action="{{ url_for('add_task') }}">
  <input type="text" name="titre" required minlength="3" maxlength="100">
  <button type="submit">Ajouter la tâche</button>
</form>
```

**Navigation améliorée**
```html
<nav>
  <ul>
    <li><a href="{{ url_for('list_tasks') }}">Toutes les tâches</a></li>
    <li><a href="{{ url_for('list_tasks', filter='pending') }}">En cours</a></li>
    <li><a href="{{ url_for('list_tasks', filter='completed') }}">Terminées</a></li>
  </ul>
</nav>
```

**Accessibilité de base**
- Labels explicites pour les formulaires
- Contraste de couleurs suffisant
- Texte alternatif pour les images
- Navigation au clavier possible
- Messages d'erreur clairs

**Composants réutilisables**
```html
<!-- Bouton d'action -->
<button class="btn btn-primary" type="submit">
  <span class="btn-text">Ajouter</span>
  <span class="btn-icon">➕</span>
</button>

<!-- Carte de tâche -->
<div class="task-card">
  <h3 class="task-title">{{ task.titre }}</h3>
  <p class="task-description">{{ task.description }}</p>
  <div class="task-actions">
    <button class="btn btn-secondary">Modifier</button>
    <button class="btn btn-danger">Supprimer</button>
  </div>
</div>
```

**Exercices (25 min)**
- Ex1: Message de réussite après create/update/delete.
- Ex2: Boutons "Edit" et "Delete" avec style.
- Ex3 (bonus): Ajouter un affichage sous forme de cartes.

**QCM**
1) Un message de confirmation est utile car :
   A) Il ralentit l'utilisateur
   B) Il guide l'utilisateur dans son action
   C) Il cache les erreurs
   D) Il complique l'interface

2) Ergonomie vise :
   A) La vitesse de chargement
   B) La facilité d'utilisation
   C) Le nombre de fonctionnalités
   D) La taille du code

3) Accessibilité basique = :
   A) Labels/texte/contraste
   B) Animations complexes
   C) Beaucoup de couleurs
   D) Texte minuscule

**Devoir**
- Ajoutez un titre de page cohérent à chaque route.

---

## Cours 26 - fetch (AJAX light) pour maj
**Objectifs**
- Appeler une API JSON depuis JavaScript
- Utiliser `fetch` et traiter la réponse
- Mettre à jour l'interface sans recharger la page
- Comprendre les interactions asynchrones

**Leçon (30 min - détaillée)**
AJAX (Asynchronous JavaScript And XML) permet des interactions dynamiques sans rechargement complet de page.

**L'API Fetch**
```javascript
// Appeler l'API pour récupérer les tâches
async function chargerTaches() {
    try {
        const response = await fetch('/api/tasks');
        
        if (!response.ok) {
            throw new Error(`Erreur HTTP: ${response.status}`);
        }
        
        const taches = await response.json();
        
        // Mettre à jour l'interface
        afficherTaches(taches);
        
    } catch (error) {
        console.error('Erreur lors du chargement:', error);
        afficherErreur('Impossible de charger les tâches');
    }
}

// Appeler automatiquement au chargement de la page
document.addEventListener('DOMContentLoaded', chargerTaches);
```

**Mettre à jour l'interface**
```javascript
function afficherTaches(taches) {
    const container = document.getElementById('tasks-container');
    container.innerHTML = ''; // Vider le contenu existant
    
    taches.forEach(tache => {
        const element = document.createElement('div');
        element.className = 'task-item';
        element.innerHTML = `
            <span class="${tache.terminee ? 'completed' : ''}">${tache.titre}</span>
            <button onclick="toggleTache(${tache.id})">Toggle</button>
        `;
        container.appendChild(element);
    });
}
```

**Envoyer des données**
```javascript
async function ajouterTache(titre) {
    try {
        const response = await fetch('/api/tasks', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ titre: titre })
        });
        
        if (response.ok) {
            // Recharger la liste
            await chargerTaches();
            afficherMessage('Tâche ajoutée !');
        } else {
            throw new Error('Erreur lors de l\'ajout');
        }
        
    } catch (error) {
        afficherErreur(error.message);
    }
}
```

**Exercices (25 min)**
- Ex1: Bouton "rafraîchir" qui appelle `/api/tasks` et met à jour la liste.
- Ex2: Gérer un `catch` en cas d'erreur.
- Ex3 (bonus): Filtrer côté client.

**QCM**
1) `fetch(url)` sert à :
   A) Créer des animations
   B) Faire un appel réseau
   C) Modifier le CSS
   D) Gérer les formulaires

2) `response.json()` transforme :
   A) Du texte en HTML
   B) Une réponse en objet JavaScript
   C) Du JSON en XML
   D) Une image en base64

3) `catch` aide à :
   A) Accélérer les requêtes
   B) Gérer les erreurs
   C) Créer des animations
   D) Valider les formulaires

**Devoir**
- Ajoutez un indicateur "chargement..." pendant l'appel fetch.

---

## Cours 27 - Filtres simples et expérience utilisateur
**Objectifs**
- Ajouter des filtres côté client ou serveur
- Comprendre les avantages de chaque approche
- Améliorer la navigation dans l'application
- Optimiser l'expérience utilisateur

**Leçon (30 min - détaillée)**
Les filtres permettent aux utilisateurs de voir seulement les informations qui les intéressent.

**Filtrage côté client**
Avantages :
- Rapide (pas d'appel serveur)
- Fonctionne hors ligne
- Moins de charge serveur

Inconvénients :
- Toutes les données doivent être chargées
- Moins sécurisé (données visibles dans le navigateur)

```javascript
function filtrerTaches(critere) {
    const toutesLesTaches = document.querySelectorAll('.task-item');
    
    toutesLesTaches.forEach(tache => {
        const estTerminee = tache.classList.contains('completed');
        
        switch(critere) {
            case 'all':
                tache.style.display = 'block';
                break;
            case 'pending':
                tache.style.display = estTerminee ? 'none' : 'block';
                break;
            case 'completed':
                tache.style.display = estTerminee ? 'block' : 'none';
                break;
        }
    });
}
```

**Filtrage côté serveur**
Avantages :
- Moins de données transférées
- Plus sécurisé
- Meilleure performance pour gros volumes

Inconvénients :
- Requêtes supplémentaires
- Plus complexe à implémenter

```python
@app.route('/api/tasks')
def api_tasks():
    filtre = request.args.get('status', 'all')
    
    if filtre == 'all':
        taches = lister_toutes_les_taches()
    elif filtre == 'pending':
        taches = lister_taches_en_cours()
    elif filtre == 'completed':
        taches = lister_taches_terminees()
    
    return jsonify([tache.to_dict() for tache in taches])
```

**Interface utilisateur**
```html
<div class="filters">
    <button onclick="filtrer('all')">Toutes</button>
    <button onclick="filtrer('pending')">En cours</button>
    <button onclick="filtrer('completed')">Terminées</button>
</div>
```

**Exercices (25 min)**
- Ex1: Menu select qui filtre la liste.
- Ex2: Option A (côté client) : filtre dans le tableau JS.
- Ex3 (bonus): Option B (côté serveur) : `/api/tasks?done=true`.

**QCM**
1) Un filtre sert à :
   A) Supprimer des données
   B) Restreindre ce qu'on voit
   C) Créer des animations
   D) Valider des formulaires

2) Filtrer côté client signifie :
   A) Calcul côté serveur
   B) Traitement dans le navigateur
   C) Stockage en base
   D) Envoi d'emails

3) Filtrer côté serveur signifie :
   A) Calcul dans le navigateur
   B) Traitement avant envoi des données
   C) Modification du CSS
   D) Création de fichiers

**Devoir**
- Choisissez l'option A ou B et justifiez dans le `README` (1 paragraphe).

---

## Cours 28 - Configuration et variables d'environnement
**Objectifs**
- Comprendre la différence entre développement et production
- Utiliser `os.environ` pour la configuration
- Éviter de coder en dur les paramètres sensibles
- Rendre l'application adaptable à différents environnements

**Leçon (30 min - détaillée)**
Une bonne configuration permet de déployer la même application dans différents environnements sans modification du code.

**Pourquoi des variables d'environnement ?**
- **Sécurité** : Ne pas committer les mots de passe
- **Flexibilité** : Paramètres différents selon l'environnement
- **Maintenance** : Changer la config sans toucher au code

**Utilisation basique**
```python
import os

# Configuration avec valeurs par défaut
DEBUG = os.environ.get('DEBUG', 'False').lower() == 'true'
SECRET_KEY = os.environ.get('SECRET_KEY', 'dev-secret-key')
DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite:///tasks.db')
PORT = int(os.environ.get('PORT', 5000))
```

**Fichier .env pour le développement**
```
# Fichier .env (à ne pas committer)
DEBUG=True
SECRET_KEY=ma-cle-secrete-super-longue
DATABASE_URL=sqlite:///dev.db
```

**Chargement du .env**
```python
from dotenv import load_dotenv
load_dotenv()  # Charge le fichier .env
```

**Configuration structurée**
```python
class Config:
    # Configuration de base
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-key'
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'sqlite:///tasks.db'
    
    # Configuration spécifique à l'environnement
    DEBUG = os.environ.get('DEBUG', 'False').lower() == 'true'
    TESTING = os.environ.get('TESTING', 'False').lower() == 'true'

class ProductionConfig(Config):
    DEBUG = False
    # Configuration production plus stricte

class DevelopmentConfig(Config):
    DEBUG = True
    # Configuration développement plus permissive
```

**Utilisation dans Flask**
```python
app = Flask(__name__)

# Charger la config selon l'environnement
env = os.environ.get('FLASK_ENV', 'development')
if env == 'production':
    app.config.from_object('config.ProductionConfig')
else:
    app.config.from_object('config.DevelopmentConfig')
```

**Exercices (25 min)**
- Ex1: Variable `DB_PATH` utilisée dans `db.py`.
- Ex2: `DEBUG=true` via env.
- Ex3 (bonus): Séparer `config.py` ou constantes.

**QCM**
1) Env sert à :
   A) Stocker le code source
   B) Paramètres externes à l'application
   C) Créer des animations
   D) Gérer les utilisateurs

2) `os.environ["X"]` sert à :
   A) Créer une variable
   B) Lire une variable d'environnement
   C) Supprimer un fichier
   D) Lancer un serveur

3) En production, on évite :
   A) Les variables d'environnement
   B) Coder en dur les chemins et mots de passe
   C) Utiliser des bases de données
   D) Créer des logs

**Devoir**
- Ajoutez un exemple de variables dans `README` (sans secrets).

---

## Cours 29 - Qualité : style, docstrings, README
**Objectifs**
- Suivre les bonnes pratiques de codage Python
- Ajouter des docstrings aux fonctions
- Rédiger un README complet et utile
- Améliorer la qualité globale du projet

**Leçon (30 min - détaillée)**
Un code de qualité est plus facile à maintenir, déboguer et faire évoluer.

**Style de code (PEP 8)**
```python
# ✅ Bon style
def calculer_moyenne(liste_notes):
    """Calcule la moyenne d'une liste de notes.
    
    Args:
        liste_notes (list): Liste de nombres (float ou int)
        
    Returns:
        float: La moyenne des notes
        
    Raises:
        ValueError: Si la liste est vide
    """
    if not liste_notes:
        raise ValueError("La liste ne peut pas être vide")
    
    return sum(liste_notes) / len(liste_notes)

# ❌ Mauvais style
def calc_moy(l):
    if not l: raise ValueError("liste vide")
    return sum(l)/len(l)
```

**Docstrings**
- Expliquent ce que fait la fonction
- Documentent les paramètres et le retour
- Mentionnent les exceptions levées
- Format standard : Google ou NumPy style

**README complet**
```markdown
# Todo App

Application web de gestion de tâches personnelles built avec Flask et SQLite.

## Fonctionnalités

- ✅ Créer, lire, modifier, supprimer des tâches
- 🔄 Marquer les tâches comme terminées
- 📱 Interface responsive
- 🔍 Filtrage des tâches
- 📊 API REST JSON

## Installation

1. Cloner le repository
   ```bash
   git clone https://github.com/username/todo-app.git
   cd todo-app
   ```

2. Créer un environnement virtuel
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/Mac
   # ou
   venv\Scripts\activate     # Windows
   ```

3. Installer les dépendances
   ```bash
   pip install -r requirements.txt
   ```

## Configuration

Créer un fichier `.env` :
```
SECRET_KEY=votre-cle-secrete
DATABASE_URL=sqlite:///tasks.db
DEBUG=True
```

## Utilisation

1. Initialiser la base de données
   ```bash
   python init_db.py
   ```

2. Lancer l'application
   ```bash
   python app.py
   ```

3. Ouvrir http://localhost:5000

## API

### GET /api/tasks
Retourne la liste de toutes les tâches.

### POST /api/tasks
Crée une nouvelle tâche.

Body JSON :
```json
{
  "titre": "Ma nouvelle tâche",
  "description": "Description optionnelle"
}
```

## Tests

```bash
python -m pytest
```

## Structure du projet

```
├── app.py              # Application principale
├── config.py           # Configuration
├── models.py           # Modèles de données
├── database.py         # Accès base de données
├── routes/             # Routes Flask
├── templates/          # Templates HTML
├── static/             # CSS/JS/Images
├── tests/              # Tests unitaires
└── README.md           # Cette documentation
```

## Améliorations possibles

- [ ] Authentification utilisateur
- [ ] Catégorisation des tâches
- [ ] Notifications par email
- [ ] Export en PDF
- [ ] Synchronisation multi-appareils
```

**Exercices (25 min)**
- Ex1: Revoir noms de variables et fonctions.
- Ex2: Ajouter docstrings à 3 fonctions clés.
- Ex3: Écrire un README module 1 complet (installation, exécution, routes, features).

**QCM**
1) Une docstring sert à :
   A) Ralentir l'exécution
   B) Expliquer l'intention de la fonction
   C) Créer des graphiques
   D) Gérer les erreurs

2) Un README utile doit inclure :
   A) Seulement le titre du projet
   B) Comment démarrer l'application
   C) Des photos de l'équipe
   D) L'historique des commits

3) Style cohérent aide à :
   A) Créer plus de bugs
   B) Faciliter la maintenance
   C) Ralentir le développement
   D) Compliquer la lecture

**Devoir**
- Ajouter une section "améliorations possibles" (3 idées).

---

## Cours 30 - Projet final et soutenance
**Objectifs**
- Finaliser l'application de gestion de tâches
- Préparer une démonstration complète
- Réfléchir sur l'apprentissage accompli
- Présenter son travail de manière professionnelle

**Leçon (30 min - détaillée)**
Le projet final est l'aboutissement de tout le module 1. C'est le moment de mettre en pratique toutes les compétences acquises.

**Rappel des fonctionnalités attendues**
- ✅ Interface web complète avec Flask
- ✅ Base de données SQLite fonctionnelle
- ✅ CRUD complet des tâches
- ✅ API REST JSON
- ✅ Interface utilisateur moderne (HTML/CSS)
- ✅ JavaScript pour interactions dynamiques
- ✅ Gestion d'erreurs appropriée
- ✅ Code organisé et documenté
- ✅ Tests automatisés
- ✅ README complet

**Derniers ajustements**
- Vérifier que toutes les fonctionnalités marchent
- Nettoyer le code (supprimer les debug prints)
- Optimiser les performances
- Ajouter les dernières finitions UI/UX

**Préparation de la soutenance**
- Préparer une démonstration de 5-10 minutes
- Montrer les fonctionnalités principales
- Expliquer les choix techniques
- Mentionner les difficultés rencontrées et solutions
- Préparer des questions/réponses

**Structure de la présentation**
1. **Introduction** (1 min)
   - Présentation du projet
   - Technologies utilisées

2. **Démonstration** (5-7 min)
   - Création d'une tâche
   - Modification/Suppression
   - Filtrage des tâches
   - API JSON
   - Interface responsive

3. **Code et architecture** (2-3 min)
   - Structure du projet
   - Choix techniques justifiés
   - Points forts du code

4. **Conclusion** (1 min)
   - Apprentissages
   - Améliorations possibles

**Critères d'évaluation**
- Fonctionnalités complètes et opérationnelles
- Code propre et bien structuré
- Interface utilisateur intuitive
- Gestion d'erreurs appropriée
- Documentation claire
- Présentation convaincante

**Après la soutenance**
- Félicitations ! Vous avez terminé le module 1
- Réfléchissez à ce que vous avez appris
- Préparez-vous pour le module 2 avec ces bases solides

**Exercices (25 min)**
- Finalisez votre application.
- Testez toutes les fonctionnalités.
- Préparez votre démonstration.

**QCM**
1) La soutenance sert à :
   A) Montrer que vous savez coder
   B) Présenter votre travail et expliquer vos choix
   C) Obtenir une bonne note
   D) Terminer le module rapidement

2) Un projet final réussi doit :
   A) Avoir beaucoup de code
   B) Toutes les fonctionnalités demandées opérationnelles
   C) Être parfait
   D) Utiliser les technologies les plus complexes

3) Après le module 1, vous savez :
   A) Créer des sites web basiques
   B) Tous les frameworks Python existants
   C) Les bases solides pour continuer l'apprentissage
   D) Déployer en production

**Devoir**
- Préparez votre soutenance et notez 3 apprentissages clés du module 1.
```</content>
<parameter name="filePath">c:\Users\abdou\Desktop\new\docs\module-1-eleve.md