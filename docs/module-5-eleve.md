# Deviens developpeur de sites et d'applications en 1 an

![Logo Institut de l'informatique](../frontend/src/assets/institut-logo.png)

## Module 5 (30 cours) - Interface utilisateur moderne et frameworks frontend (Python)

### Résumé
Ce module vous plonge dans l'univers des interfaces utilisateur modernes développées avec Python. Vous découvrirez comment créer des applications web interactives et attrayantes sans avoir à maîtriser JavaScript de manière approfondie. En explorant des frameworks comme Streamlit, Dash, et Gradio, vous apprendrez à concevoir des interfaces utilisateur réactives, des tableaux de bord interactifs, et des applications de visualisation de données. Ce module transforme votre API REST "Tâches" du module précédent en une application complète avec une interface moderne, en intégrant des composants interactifs, des graphiques dynamiques, et une expérience utilisateur fluide. Vous maîtriserez également les concepts de responsive design, d'accessibilité, et de déploiement d'applications web Python.

### Rappel du projet fil rouge (on conserve "Tâches")
Tu vas repartir de l'API REST du Module 4 et créer une interface utilisateur moderne :
1. Créer une interface Streamlit pour gérer les tâches de manière interactive
2. Ajouter des visualisations de données (statistiques des tâches)
3. Implémenter un tableau de bord avec Dash pour une vue d'ensemble
4. Intégrer l'authentification utilisateur dans l'interface
5. Ajouter des fonctionnalités avancées comme le drag & drop, les notifications
6. Déployer l'application complète (backend + frontend) avec Docker

### Hypothèses
- **Python 3.11+** : Pour bénéficier des dernières fonctionnalités des frameworks
- **Streamlit** : Framework principal pour les interfaces rapides
- **Dash** : Pour les applications plus complexes et les tableaux de bord
- **Plotly** : Bibliothèque de visualisation interactive
- **Pandas** : Pour la manipulation des données
- **Requests** : Pour consommer l'API REST
- **Docker** : Pour le déploiement des applications

### Rythme
- **4 cours par semaine** : Rythme adapté à l'apprentissage des frameworks UI
- **30 cours pour ce module** : Environ 7 semaines et demie de création d'interfaces
- **Chaque cours dure 1 heure** : Théorie sur les concepts UI/UX, démonstration pratique de composants, exercices de création d'interfaces, QCM sur les bonnes pratiques, et devoir de développement d'application

---

## Planning (30 cours)
| Cours | Thème principal | Objectif du cours |
|---:|---|---|
| 1 | Introduction aux UI modernes | Concepts d'interface utilisateur moderne |
| 2 | HTML/CSS avec Python | Bases du web avec Python |
| 3 | JavaScript essentials pour Python devs | Intégration JS minimale |
| 4 | Streamlit - Premiers pas | Création d'interfaces simples |
| 5 | Composants Streamlit de base | Widgets et contrôles interactifs |
| 6 | Mise en page Streamlit | Organisation et responsive design |
| 7 | Intégration API avec Streamlit | Connexion à l'API REST |
| 8 | Authentification dans Streamlit | Gestion des sessions utilisateur |
| 9 | Visualisation de données | Graphiques avec Streamlit |
| 10 | Applications multi-pages | Structure avancée Streamlit |
| 11 | Introduction à Dash | Framework pour applications complexes |
| 12 | Composants Dash de base | Layouts et callbacks |
| 13 | Callbacks et réactivité | Programmation réactive avec Dash |
| 14 | Tableaux de bord avec Dash | Création de dashboards interactifs |
| 15 | Intégration API avec Dash | Connexion backend-frontend |
| 16 | Plotly pour la visualisation | Graphiques avancés |
| 17 | Cartes et géolocalisation | Visualisations géographiques |
| 18 | Gradio pour interfaces ML | Interfaces spécialisées |
| 19 | Upload et traitement de fichiers | Gestion des fichiers dans l'UI |
| 20 | Thèmes et personnalisation | Design et branding |
| 21 | Accessibilité web | Interfaces inclusives |
| 22 | Performance et optimisation | Applications fluides |
| 23 | Tests d'interfaces | Tests automatisés des UI |
| 24 | Déploiement Streamlit/Dash | Mise en production |
| 25 | Intégration CI/CD | Automatisation du déploiement |
| 26 | Applications mobiles avec Python | Interfaces adaptatives |
| 27 | WebSockets et temps réel | Fonctionnalités live |
| 28 | Sécurité des interfaces | Protection contre les vulnérabilités |
| 29 | Revue et optimisation finale | Nettoyage et performance |
| 30 | Soutenance module 5 | Démo de l'application complète |

---

## Cours 1 - Introduction aux UI modernes
**Objectifs**
- Comprendre les principes des interfaces utilisateur modernes
- Différencier UI/UX et bonnes pratiques
- Découvrir les frameworks Python pour le frontend

**Leçon (30 min - détaillée)**
Les interfaces utilisateur modernes vont au-delà de simples formulaires web. Elles offrent des expériences interactives, responsives et intuitives.

**Principes des UI modernes**
- **Responsive Design** : Adaptation à tous les écrans
- **Material Design/Design Systems** : Cohérence visuelle
- **Micro-interactions** : Feedbacks utilisateurs subtils
- **Progressive Web Apps** : Fonctionnalités natives web
- **Accessibilité** : Utilisable par tous

**Frameworks Python pour le frontend**
- **Streamlit** : Rapide pour les prototypes et data apps
- **Dash** : Puissant pour les applications complexes
- **Gradio** : Spécialisé ML et interfaces IA
- **Panel** : Pour les visualisations scientifiques
- **FastAPI + Jinja2** : Full-stack traditionnel

**Avantages du développement frontend avec Python**
- Pas besoin d'apprendre JavaScript complexe
- Écosystème data science intégré
- Prototypage rapide
- Maintenance simplifiée

**Démonstration pratique (15 min)**
Installation de Streamlit et première application "Hello World".

**Exercices guidés (10 min)**
1. Créer une page HTML basique avec Python
2. Explorer les différences UI/UX
3. Analyser une bonne vs mauvaise interface

**QCM d'auto-évaluation (3 min)**
1. Quelle est la différence entre UI et UX ?
2. Quel framework pour un prototype rapide ?
3. Qu'est-ce que le responsive design ?

**Devoir**
Analyser l'interface de 3 applications web populaires et identifier les principes UI/UX utilisés.

---

## Cours 2 - HTML/CSS avec Python
**Objectifs**
- Maîtriser les bases HTML/CSS
- Créer des templates avec Python
- Comprendre la structure des pages web

**Leçon (30 min - détaillée)**
Même avec des frameworks Python, comprendre HTML/CSS reste essentiel pour personnaliser les interfaces.

**Structure HTML de base**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Ma Todo App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Mes Tâches</h1>
        <div class="task-list">
            <!-- Contenu dynamique -->
        </div>
    </div>
</body>
</html>
```

**CSS pour le styling**
```css
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

.task-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.task-item {
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background: white;
}
```

**Intégration avec Python**
```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    tasks = ["Apprendre Python", "Créer une API", "Développer l'UI"]
    return render_template('index.html', tasks=tasks)
```

**Démonstration pratique (15 min)**
Création d'un template HTML/CSS basique rendu avec Flask.

**Exercices guidés (10 min)**
1. Créer une page de profil utilisateur
2. Styler une liste de tâches
3. Ajouter du responsive design

**QCM d'auto-évaluation (3 min)**
1. Quelle balise pour un titre principal ?
2. Comment centrer un élément en CSS ?
3. Quelle propriété pour l'espacement ?

**Devoir**
Créer une page HTML/CSS complète pour afficher la liste des tâches avec un design moderne.

---

## Cours 3 - JavaScript essentials pour Python devs
**Objectifs**
- Comprendre les bases JavaScript nécessaires
- Intégrer JS dans les applications Python
- Gérer les interactions utilisateur simples

**Leçon (30 min - détaillée)**
JavaScript reste nécessaire pour certaines interactions, mais les frameworks Python en minimisent l'usage.

**JavaScript fundamentals pour Pythonistas**
```javascript
// Variables (comme Python)
let task = "Apprendre JS";
const MAX_TASKS = 100;

// Fonctions
function addTask(title) {
    console.log(`Ajout: ${title}`);
}

// Événements
document.getElementById('add-btn').addEventListener('click', function() {
    addTask(document.getElementById('task-input').value);
});
```

**Intégration avec Python**
```python
# Dans un template Jinja2
<script>
function updateTasks() {
    fetch('/api/tasks')
        .then(response => response.json())
        .then(data => {
            // Mettre à jour l'interface
            displayTasks(data);
        });
}
</script>
```

**AJAX et Fetch API**
```javascript
// Récupérer des données
fetch('/api/tasks', {
    method: 'GET',
    headers: {
        'Authorization': `Bearer ${token}`
    }
})
.then(response => response.json())
.then(tasks => updateUI(tasks));

// Envoyer des données
fetch('/api/tasks', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify({title: "Nouvelle tâche"})
});
```

**Démonstration pratique (15 min)**
Ajout d'interactions JavaScript simples dans une page Flask.

**Exercices guidés (10 min)**
1. Créer un bouton qui change de couleur au clic
2. Faire un appel AJAX simple
3. Gérer un formulaire avec validation

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour récupérer des données ?
2. Comment déclarer une variable constante ?
3. Quelle méthode pour écouter un événement ?

**Devoir**
Ajouter des interactions JavaScript à la page de tâches créée précédemment.

---

## Cours 4 - Streamlit - Premiers pas
**Objectifs**
- Installer et configurer Streamlit
- Créer une première application
- Comprendre l'architecture Streamlit

**Leçon (30 min - détaillée)**
Streamlit est le framework idéal pour créer rapidement des interfaces web avec Python.

**Installation et démarrage**
```bash
pip install streamlit
streamlit hello  # Application de démonstration
```

**Première application**
```python
import streamlit as st

st.title("Ma Todo App")
st.write("Bienvenue dans votre gestionnaire de tâches")

if st.button("Ajouter une tâche"):
    st.success("Tâche ajoutée !")
```

**Architecture Streamlit**
- **Script-based** : Tout dans un fichier Python
- **Reactive** : Re-exécution automatique à chaque interaction
- **Stateful** : Maintien de l'état entre les rechargements
- **Hot reload** : Modifications visibles instantanément

**Commandes essentielles**
```python
st.title("Titre principal")
st.header("Sous-titre")
st.write("Texte ou données")
st.markdown("**Markdown** supporté")
```

**Démonstration pratique (15 min)**
Création et exécution d'une application Streamlit basique.

**Exercices guidés (10 min)**
1. Créer une page avec titre et description
2. Ajouter différents types de contenu
3. Tester le hot reload

**QCM d'auto-évaluation (3 min)**
1. Quelle commande pour lancer Streamlit ?
2. Quelle fonction pour un titre ?
3. Qu'est-ce que le hot reload ?

**Devoir**
Créer une application Streamlit qui affiche un message de bienvenue personnalisé.

---

## Cours 5 - Composants Streamlit de base
**Objectifs**
- Maîtriser les widgets interactifs
- Gérer les entrées utilisateur
- Afficher des données dynamiquement

**Leçon (30 min - détaillée)**
Streamlit offre une riche collection de composants pour créer des interfaces interactives.

**Widgets d'entrée**
```python
import streamlit as st

# Texte
title = st.text_input("Titre de la tâche", "Nouvelle tâche")

# Zone de texte
description = st.text_area("Description", height=100)

# Sélection
priority = st.selectbox("Priorité", ["Basse", "Moyenne", "Haute"])

# Case à cocher
completed = st.checkbox("Terminée")

# Bouton
if st.button("Ajouter"):
    # Logique d'ajout
    pass
```

**Affichage de données**
```python
import pandas as pd

# DataFrame
df = pd.DataFrame({
    'Tâche': ['Apprendre Python', 'Créer API', 'UI moderne'],
    'Priorité': ['Haute', 'Moyenne', 'Haute'],
    'Statut': ['En cours', 'Terminée', 'En attente']
})
st.dataframe(df)

# Métriques
col1, col2, col3 = st.columns(3)
with col1:
    st.metric("Total", "15")
with col2:
    st.metric("Terminées", "8", "+2")
with col3:
    st.metric("En attente", "7")
```

**Démonstration pratique (15 min)**
Création d'un formulaire interactif avec différents widgets.

**Exercices guidés (10 min)**
1. Créer un formulaire d'ajout de tâche
2. Afficher une liste de tâches dans un tableau
3. Ajouter des métriques de progression

**QCM d'auto-évaluation (3 min)**
1. Quel widget pour une sélection unique ?
2. Quelle fonction pour afficher un DataFrame ?
3. Comment créer des colonnes ?

**Devoir**
Créer un formulaire complet pour ajouter des tâches avec tous les champs nécessaires.

---

## Cours 6 - Mise en page Streamlit
**Objectifs**
- Organiser l'interface efficacement
- Créer des layouts responsives
- Utiliser les conteneurs et colonnes

**Leçon (30 min - détaillée)**
Une bonne mise en page améliore l'expérience utilisateur et l'utilisabilité.

**Colonnes et layout**
```python
import streamlit as st

# Colonnes égales
col1, col2 = st.columns(2)

with col1:
    st.header("Ajouter une tâche")
    title = st.text_input("Titre")
    priority = st.selectbox("Priorité", ["Basse", "Moyenne", "Haute"])

with col2:
    st.header("Statistiques")
    st.metric("Tâches totales", "25")
    st.metric("Terminées", "18")

# Colonnes personnalisées
col1, col2, col3 = st.columns([2, 1, 1])
# col1 prend 2/4 de l'espace, col2 et col3 1/4 chacun
```

**Conteneurs et organisation**
```python
# Sidebar
with st.sidebar:
    st.header("Navigation")
    page = st.radio("Aller à", ["Accueil", "Tâches", "Statistiques"])

# Conteneurs
with st.container():
    st.subheader("Tâches urgentes")
    # Contenu des tâches urgentes

with st.container():
    st.subheader("Tâches normales")
    # Contenu des tâches normales
```

**Expansion et onglets**
```python
# Expander
with st.expander("Voir les détails"):
    st.write("Informations détaillées sur la tâche")

# Onglets
tab1, tab2, tab3 = st.tabs(["À faire", "En cours", "Terminées"])

with tab1:
    st.write("Liste des tâches à faire")

with tab2:
    st.write("Liste des tâches en cours")

with tab3:
    st.write("Liste des tâches terminées")
```

**Démonstration pratique (15 min)**
Réorganisation de l'application avec un layout amélioré.

**Exercices guidés (10 min)**
1. Créer une sidebar de navigation
2. Organiser le contenu en colonnes
3. Ajouter des onglets pour filtrer les tâches

**QCM d'auto-évaluation (3 min)**
1. Comment créer des colonnes égales ?
2. Quelle fonction pour la sidebar ?
3. Comment créer des onglets ?

**Devoir**
Refactoriser l'application avec une mise en page moderne utilisant sidebar, colonnes et onglets.

---

## Cours 7 - Intégration API avec Streamlit
**Objectifs**
- Connecter Streamlit à l'API REST
- Gérer l'authentification
- Synchroniser les données en temps réel

**Leçon (30 min - détaillée)**
Intégrer l'API REST créée dans le module 4 pour une application complète.

**Connexion à l'API**
```python
import streamlit as st
import requests

API_BASE = "http://localhost:5000/api"

def get_tasks(token):
    headers = {"Authorization": f"Bearer {token}"}
    response = requests.get(f"{API_BASE}/tasks", headers=headers)
    return response.json()

def add_task(title, description, token):
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }
    data = {"title": title, "description": description}
    response = requests.post(f"{API_BASE}/tasks", 
                           json=data, headers=headers)
    return response.json()
```

**Gestion de l'état**
```python
# Session state pour stocker le token
if 'token' not in st.session_state:
    st.session_state.token = None

# Fonction de connexion
def login(username, password):
    response = requests.post(f"{API_BASE}/auth/login", 
                           json={"username": username, "password": password})
    if response.status_code == 200:
        st.session_state.token = response.json()["token"]
        st.success("Connexion réussie!")
        st.rerun()

# Vérification d'authentification
if not st.session_state.token:
    st.warning("Veuillez vous connecter")
    # Formulaire de connexion
else:
    # Application principale
    display_main_app()
```

**Synchronisation des données**
```python
@st.cache_data(ttl=300)  # Cache 5 minutes
def load_tasks():
    return get_tasks(st.session_state.token)

# Rafraîchir les données
if st.button("Actualiser"):
    st.cache_data.clear()
    st.rerun()
```

**Démonstration pratique (15 min)**
Connexion de Streamlit à l'API REST avec authentification.

**Exercices guidés (10 min)**
1. Implémenter la connexion utilisateur
2. Récupérer et afficher les tâches depuis l'API
3. Ajouter une nouvelle tâche via l'API

**QCM d'auto-évaluation (3 min)**
1. Comment passer le token JWT ?
2. Quelle fonction pour le cache ?
3. Comment gérer la session utilisateur ?

**Devoir**
Connecter complètement l'application Streamlit à l'API REST avec authentification.

---

## Cours 8 - Authentification dans Streamlit
**Objectifs**
- Implémenter l'authentification utilisateur
- Gérer les sessions et permissions
- Sécuriser l'accès aux fonctionnalités

**Leçon (30 min - détaillée)**
L'authentification dans Streamlit nécessite une gestion soigneuse de l'état.

**Formulaire de connexion**
```python
import streamlit as st
import requests

def login_form():
    st.subheader("Connexion")
    
    with st.form("login_form"):
        username = st.text_input("Nom d'utilisateur")
        password = st.text_input("Mot de passe", type="password")
        submitted = st.form_submit_button("Se connecter")
        
        if submitted:
            try:
                response = requests.post("http://localhost:5000/api/auth/login",
                                       json={"username": username, "password": password})
                
                if response.status_code == 200:
                    data = response.json()
                    st.session_state.token = data["token"]
                    st.session_state.user = data["user"]
                    st.success("Connexion réussie!")
                    st.rerun()
                else:
                    st.error("Identifiants incorrects")
                    
            except Exception as e:
                st.error(f"Erreur de connexion: {e}")

def logout():
    if st.sidebar.button("Déconnexion"):
        st.session_state.token = None
        st.session_state.user = None
        st.success("Déconnexion réussie!")
        st.rerun()
```

**Protection des routes**
```python
def require_auth():
    if 'token' not in st.session_state or not st.session_state.token:
        login_form()
        st.stop()  # Arrête l'exécution
    return st.session_state.token

# Dans la fonction principale
def main():
    token = require_auth()
    
    # Sidebar avec infos utilisateur
    with st.sidebar:
        st.write(f"Connecté: {st.session_state.user['username']}")
        logout()
    
    # Application principale
    display_tasks_app(token)
```

**Gestion des rôles et permissions**
```python
def has_permission(role_required):
    user = st.session_state.get('user', {})
    user_role = user.get('role', 'user')
    
    roles_hierarchy = {
        'admin': 3,
        'moderator': 2, 
        'user': 1
    }
    
    return roles_hierarchy.get(user_role, 0) >= roles_hierarchy.get(role_required, 0)

# Utilisation
if has_permission('admin'):
    st.button("Supprimer toutes les tâches")
```

**Démonstration pratique (15 min)**
Implémentation complète du système d'authentification.

**Exercices guidés (10 min)**
1. Créer le formulaire de connexion
2. Protéger l'accès à l'application
3. Ajouter la fonctionnalité de déconnexion

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour arrêter l'exécution ?
2. Comment stocker le token ?
3. Comment vérifier les permissions ?

**Devoir**
Implémenter un système d'authentification complet avec gestion des rôles.

---

## Cours 9 - Visualisation de données
**Objectifs**
- Créer des graphiques interactifs
- Visualiser les statistiques des tâches
- Intégrer Plotly avec Streamlit

**Leçon (30 min - détaillée)**
La visualisation de données rend l'application plus informative et engageante.

**Graphiques de base avec Streamlit**
```python
import streamlit as st
import pandas as pd
import plotly.express as px

# Données d'exemple
tasks_data = pd.DataFrame({
    'status': ['completed', 'pending', 'in_progress', 'completed', 'pending'],
    'priority': ['high', 'medium', 'high', 'low', 'high'],
    'created_date': pd.date_range('2024-01-01', periods=5)
})

# Graphique en barres
status_counts = tasks_data['status'].value_counts()
st.bar_chart(status_counts)

# Graphique circulaire
fig = px.pie(tasks_data, names='priority', title='Répartition par priorité')
st.plotly_chart(fig)
```

**Graphiques temporels**
```python
# Évolution des tâches dans le temps
daily_tasks = tasks_data.groupby('created_date').size()
st.line_chart(daily_tasks)

# Graphique en aires
fig = px.area(daily_tasks, title='Création de tâches par jour')
st.plotly_chart(fig)
```

**Tableaux de bord interactifs**
```python
# Filtres interactifs
status_filter = st.multiselect("Filtrer par statut", 
                              options=tasks_data['status'].unique(),
                              default=tasks_data['status'].unique())

priority_filter = st.selectbox("Priorité", 
                              ["Toutes"] + list(tasks_data['priority'].unique()))

# Application des filtres
filtered_data = tasks_data.copy()
if status_filter:
    filtered_data = filtered_data[filtered_data['status'].isin(status_filter)]
if priority_filter != "Toutes":
    filtered_data = filtered_data[filtered_data['priority'] == priority_filter]

# Affichage des résultats filtrés
st.dataframe(filtered_data)
```

**Métriques avancées**
```python
col1, col2, col3, col4 = st.columns(4)

with col1:
    total_tasks = len(tasks_data)
    st.metric("Total tâches", total_tasks)

with col2:
    completed = len(tasks_data[tasks_data['status'] == 'completed'])
    completion_rate = completed / total_tasks * 100
    st.metric("Taux completion", f"{completion_rate:.1f}%")

with col3:
    high_priority = len(tasks_data[tasks_data['priority'] == 'high'])
    st.metric("Priorité haute", high_priority)

with col4:
    avg_completion_time = 2.5  # jours
    st.metric("Temps moyen", f"{avg_completion_time}j")
```

**Démonstration pratique (15 min)**
Création d'un tableau de bord avec graphiques interactifs.

**Exercices guidés (10 min)**
1. Créer un graphique de répartition des tâches
2. Ajouter des métriques importantes
3. Implémenter des filtres interactifs

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour un graphique Plotly ?
2. Comment créer des métriques ?
3. Quelle fonction pour filtrer les données ?

**Devoir**
Créer un tableau de bord complet avec statistiques et visualisations des tâches.

---

## Cours 10 - Applications multi-pages
**Objectifs**
- Structurer des applications complexes
- Naviguer entre différentes pages
- Partager l'état entre les pages

**Leçon (30 min - détaillée)**
Pour les applications plus complexes, une structure multi-pages améliore l'organisation.

**Structure de base**
```
my_app/
├── pages/
│   ├── 1_Accueil.py
│   ├── 2_Tâches.py
│   ├── 3_Statistiques.py
│   └── 4_Profil.py
└── main.py
```

**Navigation automatique**
```python
# pages/1_Accueil.py
import streamlit as st

st.title("Accueil - Gestion des Tâches")
st.write("Bienvenue dans votre application de gestion de tâches")

col1, col2 = st.columns(2)

with col1:
    st.subheader("Raccourcis")
    if st.button("Voir toutes les tâches"):
        st.switch_page("pages/2_Tâches.py")
    
    if st.button("Voir les statistiques"):
        st.switch_page("pages/3_Statistiques.py")

with col2:
    st.subheader("Résumé")
    st.metric("Tâches actives", "12")
    st.metric("Terminées aujourd'hui", "3")
```

**Partage d'état entre pages**
```python
# Dans chaque page, accès au session_state
if 'token' not in st.session_state:
    st.error("Veuillez vous connecter d'abord")
    st.stop()

token = st.session_state.token

# Fonctions utilitaires partagées
def api_call(endpoint, method='GET', data=None):
    headers = {"Authorization": f"Bearer {token}"}
    url = f"http://localhost:5000/api/{endpoint}"
    
    if method == 'GET':
        response = requests.get(url, headers=headers)
    elif method == 'POST':
        response = requests.post(url, json=data, headers=headers)
    
    return response.json()
```

**Page de tâches**
```python
# pages/2_Tâches.py
import streamlit as st
import requests

st.title("Gestion des Tâches")

# Récupération des tâches
tasks = api_call('tasks')

if tasks:
    for task in tasks:
        with st.container():
            col1, col2, col3 = st.columns([3, 1, 1])
            
            with col1:
                st.write(f"**{task['title']}**")
                if task.get('description'):
                    st.write(task['description'])
            
            with col2:
                status = task.get('completed', False)
                if st.checkbox("Terminée", value=status, key=f"task_{task['id']}"):
                    # Marquer comme terminée
                    pass
            
            with col3:
                if st.button("Modifier", key=f"edit_{task['id']}"):
                    st.session_state.editing_task = task['id']
```

**Démonstration pratique (15 min)**
Création d'une application multi-pages basique.

**Exercices guidés (10 min)**
1. Créer une page d'accueil
2. Ajouter une page de gestion des tâches
3. Implémenter la navigation entre pages

**QCM d'auto-évaluation (3 min)**
1. Où placer les pages dans Streamlit ?
2. Quelle fonction pour changer de page ?
3. Comment partager l'état ?

**Devoir**
Structurer l'application en plusieurs pages organisées logiquement.

---

## Cours 11 - Introduction à Dash
**Objectifs**
- Comprendre les concepts de Dash
- Créer une première application Dash
- Différencier Dash de Streamlit

**Leçon (30 min - détaillée)**
Dash est un framework plus flexible pour des applications web complexes.

**Installation et concepts**
```bash
pip install dash
```

**Première application Dash**
```python
from dash import Dash, html, dcc

app = Dash(__name__)

app.layout = html.Div([
    html.H1("Ma Todo App avec Dash"),
    html.Div("Bienvenue dans votre gestionnaire de tâches"),
    dcc.Input(id='task-input', type='text', placeholder='Nouvelle tâche'),
    html.Button('Ajouter', id='add-button'),
    html.Ul(id='task-list')
])

if __name__ == '__main__':
    app.run_server(debug=True)
```

**Architecture Dash**
- **Layout** : Structure HTML déclarative
- **Callbacks** : Fonctions Python pour la réactivité
- **Components** : Bibliothèque de composants UI
- **States** : Gestion de l'état entre callbacks

**Comparaison Streamlit vs Dash**
| Aspect | Streamlit | Dash |
|--------|-----------|------|
| Complexité | Simple | Plus complexe |
| Personnalisation | Limitée | Très flexible |
| Performance | Bonne | Excellente |
| Courbe d'apprentissage | Facile | Plus steep |

**Démonstration pratique (15 min)**
Création et exécution d'une application Dash basique.

**Exercices guidés (10 min)**
1. Installer Dash et créer une app basique
2. Ajouter des composants HTML simples
3. Comprendre la structure d'une app Dash

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction définit le layout ?
2. Comment lancer un serveur Dash ?
3. Quelle différence principale avec Streamlit ?

**Devoir**
Créer une application Dash qui affiche un message de bienvenue avec du HTML stylisé.

---

## Cours 12 - Composants Dash de base
**Objectifs**
- Maîtriser les composants HTML et CSS
- Utiliser les composants Dash
- Créer des layouts structurés

**Leçon (30 min - détaillée)**
Dash offre une riche bibliothèque de composants pour construire des interfaces.

**Composants HTML de base**
```python
from dash import html

layout = html.Div([
    # En-têtes
    html.H1("Gestion des Tâches", style={'color': 'blue'}),
    html.H2("Tableau de bord"),
    
    # Conteneurs
    html.Div([
        html.P("Liste des tâches actives:"),
        html.Ul([
            html.Li("Apprendre Python"),
            html.Li("Créer une API"),
            html.Li("Développer l'UI")
        ])
    ], style={'border': '1px solid #ddd', 'padding': '10px'}),
    
    # Liens et boutons
    html.A("Voir la documentation", href="https://dash.plotly.com"),
    html.Br(),
    html.Button("Actualiser", id="refresh-btn", 
               style={'backgroundColor': 'green', 'color': 'white'})
])
```

**Composants Dash (dcc)**
```python
from dash import dcc

layout_composants = html.Div([
    # Entrée de texte
    dcc.Input(id='task-title', type='text', placeholder='Titre de la tâche'),
    
    # Zone de texte
    dcc.Textarea(id='task-desc', placeholder='Description'),
    
    # Sélection
    dcc.Dropdown(
        id='priority',
        options=[
            {'label': 'Basse', 'value': 'low'},
            {'label': 'Moyenne', 'value': 'medium'},
            {'label': 'Haute', 'value': 'high'}
        ],
        value='medium'
    ),
    
    # Cases à cocher
    dcc.Checklist(
        id='categories',
        options=[
            {'label': 'Travail', 'value': 'work'},
            {'label': 'Personnel', 'value': 'personal'},
            {'label': 'Urgent', 'value': 'urgent'}
        ],
        value=['work']
    ),
    
    # Bouton radio
    dcc.RadioItems(
        id='status',
        options=[
            {'label': 'À faire', 'value': 'todo'},
            {'label': 'En cours', 'value': 'in_progress'},
            {'label': 'Terminée', 'value': 'done'}
        ],
        value='todo'
    )
])
```

**Layouts avec Bootstrap**
```python
app = Dash(__name__, external_stylesheets=['https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'])

layout_bootstrap = html.Div([
    html.Div([
        html.Div([
            html.H3("Colonne 1"),
            html.P("Contenu de la première colonne")
        ], className="col-md-6"),
        
        html.Div([
            html.H3("Colonne 2"), 
            html.P("Contenu de la deuxième colonne")
        ], className="col-md-6")
    ], className="row")
], className="container")
```

**Démonstration pratique (15 min)**
Création d'un formulaire avec différents composants Dash.

**Exercices guidés (10 min)**
1. Créer un layout avec des colonnes
2. Ajouter différents types de composants
3. Styler les composants avec CSS

**QCM d'auto-évaluation (3 min)**
1. Quelle bibliothèque pour les composants avancés ?
2. Comment créer une liste déroulante ?
3. Quelle classe pour les colonnes Bootstrap ?

**Devoir**
Créer un formulaire d'ajout de tâche avec tous les composants nécessaires.

---

## Cours 13 - Callbacks et réactivité
**Objectifs**
- Comprendre le système de callbacks
- Créer des interactions dynamiques
- Gérer l'état et les événements

**Leçon (30 min - détaillée)**
Les callbacks sont au cœur de la réactivité dans Dash.

**Principe des callbacks**
```python
from dash import Input, Output, State
from dash.exceptions import PreventUpdate

@app.callback(
    Output('task-list', 'children'),  # Sortie: met à jour la liste
    Input('add-button', 'n_clicks'),  # Entrée: clic sur le bouton
    State('task-input', 'value')      # État: valeur du champ texte
)
def add_task(n_clicks, task_title):
    if not n_clicks or not task_title:
        raise PreventUpdate
    
    # Logique d'ajout
    new_task = html.Li(task_title)
    
    # Récupérer les tâches existantes et ajouter la nouvelle
    current_tasks = []  # En pratique, stockées en session ou base
    current_tasks.append(new_task)
    
    return current_tasks
```

**Callbacks multiples**
```python
# Callback pour compter les tâches
@app.callback(
    Output('task-count', 'children'),
    Input('task-list', 'children')
)
def update_count(task_list):
    if task_list:
        count = len(task_list)
        return f"Total: {count} tâche(s)"
    return "Total: 0 tâche(s)"

# Callback pour filtrer les tâches
@app.callback(
    Output('filtered-list', 'children'),
    Input('status-filter', 'value'),
    Input('task-list', 'children')
)
def filter_tasks(selected_status, task_list):
    if not task_list or not selected_status:
        return task_list
    
    # Logique de filtrage
    filtered = [task for task in task_list if matches_status(task, selected_status)]
    return filtered
```

**Gestion d'état avancée**
```python
# Stockage en mémoire (pour démo - utiliser une base en prod)
if 'tasks' not in app.server.session_interface:
    app.server.session_interface = {}

@app.callback(
    Output('task-store', 'data'),
    Input('add-button', 'n_clicks'),
    State('task-input', 'value'),
    State('task-store', 'data')
)
def update_task_store(n_clicks, new_task, current_tasks):
    if not current_tasks:
        current_tasks = []
    
    if n_clicks and new_task:
        current_tasks.append({
            'id': len(current_tasks) + 1,
            'title': new_task,
            'completed': False,
            'created': datetime.now().isoformat()
        })
    
    return current_tasks
```

**Démonstration pratique (15 min)**
Implémentation d'un callback simple pour ajouter des tâches.

**Exercices guidés (10 min)**
1. Créer un callback d'ajout d'élément
2. Ajouter un callback de comptage
3. Implémenter un système de filtrage

**QCM d'auto-évaluation (3 min)**
1. Quels sont les 3 types de paramètres callback ?
2. Quand utiliser PreventUpdate ?
3. Comment stocker l'état entre callbacks ?

**Devoir**
Implémenter un système complet d'ajout, suppression et filtrage de tâches avec callbacks.

---

## Cours 14 - Tableaux de bord avec Dash
**Objectifs**
- Créer des dashboards interactifs
- Intégrer des graphiques Plotly
- Organiser l'information efficacement

**Leçon (30 min - détaillée)**
Les tableaux de bord Dash permettent de visualiser et analyser les données.

**Structure d'un dashboard**
```python
import dash_bootstrap_components as dbc
from dash import Dash, html, dcc

app = Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

app.layout = dbc.Container([
    dbc.Row([
        dbc.Col([
            html.H1("Tableau de Bord Tâches"),
            html.Hr()
        ], width=12)
    ]),
    
    dbc.Row([
        dbc.Col([
            dbc.Card([
                dbc.CardHeader("Métriques Clés"),
                dbc.CardBody([
                    html.H4("15", className="card-title"),
                    html.P("Tâches totales", className="card-text")
                ])
            ])
        ], width=3),
        
        dbc.Col([
            dbc.Card([
                dbc.CardHeader("Progression"),
                dbc.CardBody([
                    dcc.Graph(id='progress-chart')
                ])
            ])
        ], width=9)
    ]),
    
    dbc.Row([
        dbc.Col([
            html.H3("Filtres"),
            dcc.Dropdown(id='status-filter', 
                        options=['Toutes', 'À faire', 'En cours', 'Terminées']),
            dcc.DatePickerRange(id='date-filter')
        ], width=12)
    ]),
    
    dbc.Row([
        dbc.Col([
            html.H3("Liste des Tâches"),
            html.Div(id='task-table')
        ], width=12)
    ])
], fluid=True)
```

**Graphiques intégrés**
```python
import plotly.graph_objects as go
import pandas as pd

@app.callback(
    Output('progress-chart', 'figure'),
    Input('status-filter', 'value')
)
def update_progress_chart(status_filter):
    # Données d'exemple
    data = pd.DataFrame({
        'status': ['todo', 'in_progress', 'completed', 'todo', 'completed'],
        'count': [5, 3, 7, 2, 4]
    })
    
    if status_filter and status_filter != 'Toutes':
        data = data[data['status'] == status_filter]
    
    fig = go.Figure(data=[
        go.Bar(x=data['status'], y=data['count'])
    ])
    
    fig.update_layout(title="Répartition des tâches par statut")
    return fig
```

**Tables interactives**
```python
@app.callback(
    Output('task-table', 'children'),
    Input('status-filter', 'value'),
    Input('date-filter', 'start_date'),
    Input('date-filter', 'end_date')
)
def update_task_table(status_filter, start_date, end_date):
    # Récupération des tâches filtrées
    tasks = get_filtered_tasks(status_filter, start_date, end_date)
    
    table = dbc.Table([
        html.Thead([
            html.Tr([html.Th("Titre"), html.Th("Statut"), html.Th("Date"), html.Th("Actions")])
        ]),
        html.Tbody([
            html.Tr([
                html.Td(task['title']),
                html.Td(task['status']),
                html.Td(task['created_date']),
                html.Td([
                    dbc.Button("Modifier", color="primary", size="sm"),
                    dbc.Button("Supprimer", color="danger", size="sm", className="ml-2")
                ])
            ]) for task in tasks
        ])
    ], striped=True, hover=True, responsive=True)
    
    return table
```

**Démonstration pratique (15 min)**
Création d'un tableau de bord basique avec métriques et graphiques.

**Exercices guidés (10 min)**
1. Créer un layout de dashboard avec Bootstrap
2. Ajouter des cartes de métriques
3. Intégrer un graphique Plotly

**QCM d'auto-évaluation (3 min)**
1. Quelle bibliothèque pour les composants Bootstrap ?
2. Comment créer une carte métrique ?
3. Quelle fonction pour mettre à jour un graphique ?

**Devoir**
Créer un tableau de bord complet pour visualiser les statistiques des tâches.

---

## Cours 15 - Intégration API avec Dash
**Objectifs**
- Connecter Dash à l'API REST
- Gérer l'authentification
- Synchroniser les données en temps réel

**Leçon (30 min - détaillée)**
Intégrer l'API REST dans une application Dash pour une solution complète.

**Configuration de l'API**
```python
import requests
import dash
from dash import html, dcc, Input, Output, State

# Configuration
API_BASE = "http://localhost:5000/api"

# Store pour les données
app = dash.Dash(__name__)

# Fonctions API
def api_request(endpoint, method='GET', data=None, token=None):
    url = f"{API_BASE}/{endpoint}"
    headers = {'Content-Type': 'application/json'}
    
    if token:
        headers['Authorization'] = f'Bearer {token}'
    
    try:
        if method == 'GET':
            response = requests.get(url, headers=headers)
        elif method == 'POST':
            response = requests.post(url, json=data, headers=headers)
        elif method == 'PUT':
            response = requests.put(url, json=data, headers=headers)
        elif method == 'DELETE':
            response = requests.delete(url, headers=headers)
        
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erreur API: {e}")
        return None
```

**Authentification dans Dash**
```python
app.layout = html.Div([
    dcc.Store(id='auth-store', storage_type='session'),
    
    html.Div(id='auth-container', children=[
        html.H2("Connexion"),
        dcc.Input(id='username', type='text', placeholder='Utilisateur'),
        dcc.Input(id='password', type='password', placeholder='Mot de passe'),
        html.Button('Se connecter', id='login-btn'),
        html.Div(id='login-message')
    ]),
    
    html.Div(id='main-app', style={'display': 'none'}, children=[
        # Application principale
        html.H1("Gestion des Tâches"),
        html.Div(id='task-list'),
        dcc.Input(id='new-task', type='text', placeholder='Nouvelle tâche'),
        html.Button('Ajouter', id='add-task-btn')
    ])
])

@app.callback(
    [Output('auth-store', 'data'), Output('login-message', 'children'), 
     Output('auth-container', 'style'), Output('main-app', 'style')],
    Input('login-btn', 'n_clicks'),
    State('username', 'value'),
    State('password', 'value'),
    prevent_initial_call=True
)
def login(n_clicks, username, password):
    if not username or not password:
        return dash.no_update, "Veuillez saisir vos identifiants", {'display': 'block'}, {'display': 'none'}
    
    auth_data = api_request('auth/login', 'POST', 
                          {'username': username, 'password': password})
    
    if auth_data and 'token' in auth_data:
        return (auth_data, "Connexion réussie!", 
                {'display': 'none'}, {'display': 'block'})
    else:
        return (None, "Identifiants incorrects", 
                {'display': 'block'}, {'display': 'none'})
```

**Gestion des tâches**
```python
@app.callback(
    Output('task-list', 'children'),
    Input('add-task-btn', 'n_clicks'),
    Input('auth-store', 'data'),
    State('new-task', 'value'),
    State('task-list', 'children')
)
def manage_tasks(add_clicks, auth_data, new_task_title, current_tasks):
    if not auth_data or not auth_data.get('token'):
        return "Veuillez vous connecter"
    
    token = auth_data['token']
    
    # Récupération des tâches existantes
    if not current_tasks or add_clicks:
        tasks = api_request('tasks', 'GET', token=token)
        if tasks:
            task_elements = []
            for task in tasks:
                task_elements.append(html.Div([
                    html.Span(task['title']),
                    html.Button('✓', id=f'complete-{task["id"]}'),
                    html.Button('✗', id=f'delete-{task["id"]}')
                ]))
            return task_elements
    
    # Ajout d'une nouvelle tâche
    if add_clicks and new_task_title:
        new_task = api_request('tasks', 'POST', 
                             {'title': new_task_title}, token)
        if new_task:
            # Actualiser la liste
            return manage_tasks(None, auth_data, None, None)
    
    return current_tasks or []
```

**Démonstration pratique (15 min)**
Connexion de Dash à l'API REST avec authentification.

**Exercices guidés (10 min)**
1. Implémenter la connexion utilisateur
2. Récupérer et afficher les tâches
3. Ajouter la fonctionnalité d'ajout de tâches

**QCM d'auto-évaluation (3 min)**
1. Comment passer le token dans les headers ?
2. Quelle fonction pour les requêtes API ?
3. Comment gérer l'état d'authentification ?

**Devoir**
Connecter complètement l'application Dash à l'API REST avec toutes les fonctionnalités CRUD.

---

## Cours 16 - Plotly pour la visualisation
**Objectifs**
- Maîtriser Plotly pour les graphiques
- Créer des visualisations interactives
- Intégrer les graphiques dans les applications

**Leçon (30 min - détaillée)**
Plotly offre des graphiques interactifs de haute qualité pour les applications Python.

**Graphiques de base**
```python
import plotly.express as px
import pandas as pd

# Données d'exemple
tasks_df = pd.DataFrame({
    'date': pd.date_range('2024-01-01', periods=30),
    'created': [2, 1, 3, 2, 1, 0, 2, 3, 1, 2] * 3,
    'completed': [1, 2, 1, 3, 2, 1, 0, 2, 1, 1] * 3
})

# Graphique en lignes
fig = px.line(tasks_df, x='date', y=['created', 'completed'],
              title='Évolution des tâches')
fig.show()
```

**Graphiques statistiques**
```python
# Histogramme
fig = px.histogram(tasks_df, x='created', nbins=10,
                  title='Distribution des tâches créées par jour')

# Box plot
fig = px.box(tasks_df, y='completed', 
            title='Distribution des tâches terminées')

# Scatter plot
fig = px.scatter(tasks_df, x='created', y='completed',
                title='Corrélation création/completion')
```

**Graphiques avancés**
```python
# Graphique en barres groupées
priority_data = pd.DataFrame({
    'priorité': ['Haute', 'Moyenne', 'Basse'] * 4,
    'statut': ['À faire', 'En cours', 'Terminée'] * 4,
    'count': [5, 3, 2, 2, 4, 1, 1, 2, 3, 3, 1, 2]
})

fig = px.bar(priority_data, x='priorité', y='count', color='statut',
            title='Tâches par priorité et statut', barmode='group')
```

**Graphiques interactifs**
```python
# Sunburst chart
fig = px.sunburst(
    names=["Tâches", "À faire", "En cours", "Terminée", "Haute", "Moyenne", "Basse"],
    parents=["", "Tâches", "Tâches", "Tâches", "À faire", "À faire", "À faire"],
    values=[20, 8, 5, 7, 3, 3, 2],
    title="Répartition hiérarchique des tâches"
)

# Graphique 3D
fig = px.scatter_3d(tasks_df, x='created', y='completed', z='date',
                   title='Visualisation 3D des tâches')
```

**Intégration dans Streamlit/Dash**
```python
# Dans Streamlit
st.plotly_chart(fig)

# Dans Dash
dcc.Graph(figure=fig)
```

**Démonstration pratique (15 min)**
Création de différents types de graphiques avec Plotly.

**Exercices guidés (10 min)**
1. Créer un graphique en lignes pour l'évolution
2. Faire un histogramme des priorités
3. Créer un graphique circulaire

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour un graphique en lignes ?
2. Comment créer un histogramme ?
3. Quelle fonction pour intégrer dans Dash ?

**Devoir**
Créer un ensemble de visualisations pour analyser les statistiques des tâches.

---

## Cours 17 - Cartes et géolocalisation
**Objectifs**
- Intégrer des cartes interactives
- Gérer la géolocalisation
- Visualiser des données géographiques

**Leçon (30 min - détaillée)**
Les cartes permettent de visualiser des données avec un contexte géographique.

**Cartes de base avec Plotly**
```python
import plotly.express as px
import pandas as pd

# Données avec coordonnées
locations_df = pd.DataFrame({
    'task': ['Réunion Paris', 'Formation Lyon', 'Déploiement Marseille'],
    'lat': [48.8566, 45.7640, 43.2965],
    'lon': [2.3522, 4.8357, 5.3698],
    'priority': ['Haute', 'Moyenne', 'Haute'],
    'status': ['En cours', 'Terminée', 'À faire']
})

# Carte scatter
fig = px.scatter_mapbox(
    locations_df, 
    lat='lat', 
    lon='lon',
    hover_name='task',
    hover_data=['priority', 'status'],
    color='priority',
    zoom=5,
    title='Tâches géolocalisées'
)

fig.update_layout(mapbox_style="open-street-map")
```

**Carte de densité**
```python
# Données de densité
density_data = pd.DataFrame({
    'lat': [48.8, 45.7, 43.3, 47.2, 44.8],
    'lon': [2.3, 4.8, 5.4, 1.5, 0.2],
    'weight': [10, 8, 6, 4, 3]
})

fig = px.density_mapbox(
    density_data, 
    lat='lat', 
    lon='lon', 
    z='weight',
    radius=20,
    title='Densité des tâches par région'
)
```

**Intégration avec Streamlit**
```python
import streamlit as st
import folium
from streamlit_folium import st_folium

# Carte Folium
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajout de marqueurs
for _, task in locations_df.iterrows():
    folium.Marker(
        location=[task['lat'], task['lon']],
        popup=task['task'],
        icon=folium.Icon(color='red' if task['priority'] == 'Haute' else 'blue')
    ).add_to(m)

# Affichage dans Streamlit
st_folium(m, width=700, height=500)
```

**Géolocalisation utilisateur**
```python
# Dans le navigateur (JavaScript)
geoloc_script = """
<script>
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
}

function showPosition(position) {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    
    // Envoyer au serveur Python
    fetch('/api/location', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({lat: lat, lon: lon})
    });
}
</script>
"""

# Intégration dans l'app
st.components.v1.html(geoloc_script)
if st.button("Obtenir ma position"):
    st.write("Cliquez sur 'Autoriser' dans votre navigateur")
```

**Démonstration pratique (15 min)**
Création d'une carte interactive avec des marqueurs de tâches.

**Exercices guidés (10 min)**
1. Créer une carte avec des points
2. Ajouter des informations au survol
3. Intégrer une carte Folium

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour une carte scatter ?
2. Comment ajouter des marqueurs Folium ?
3. Quelle API pour la géolocalisation ?

**Devoir**
Créer une visualisation cartographique des tâches avec géolocalisation.

---

## Cours 18 - Gradio pour interfaces ML
**Objectifs**
- Découvrir Gradio pour les interfaces IA
- Créer des interfaces pour modèles ML
- Intégrer l'IA dans les applications

**Leçon (30 min - détaillée)**
Gradio est spécialisé dans les interfaces pour l'intelligence artificielle et le ML.

**Installation et concepts**
```bash
pip install gradio
```

**Interface basique**
```python
import gradio as gr

def greet(name):
    return f"Hello {name}!"

# Interface simple
iface = gr.Interface(
    fn=greet,
    inputs="text",
    outputs="text",
    title="Greeting App",
    description="Entrez votre nom pour un salut personnalisé"
)

iface.launch()
```

**Interface pour tâches**
```python
import gradio as gr
import requests

def analyze_task_description(description):
    """Analyse une description de tâche avec de l'IA simulée"""
    # Simulation d'analyse IA
    if "urgent" in description.lower():
        priority = "Haute"
        analysis = "Cette tâche semble urgente"
    elif "important" in description.lower():
        priority = "Moyenne"
        analysis = "Tâche importante mais pas critique"
    else:
        priority = "Basse"
        analysis = "Tâche standard"
    
    return priority, analysis

def create_task_with_ai(title, description):
    """Crée une tâche avec analyse IA"""
    priority, analysis = analyze_task_description(description)
    
    # Création de la tâche via API
    task_data = {
        "title": title,
        "description": description,
        "priority": priority.lower(),
        "ai_analysis": analysis
    }
    
    # Simulation d'appel API
    return f"Tâche créée: {title}\nPriorité suggérée: {priority}\nAnalyse: {analysis}"

# Interface Gradio
with gr.Blocks(title="Créateur de Tâches IA") as iface:
    gr.Markdown("# Créateur de Tâches avec IA")
    
    with gr.Row():
        title_input = gr.Textbox(label="Titre de la tâche")
        desc_input = gr.Textbox(label="Description", lines=3)
    
    analyze_btn = gr.Button("Analyser avec IA")
    create_btn = gr.Button("Créer la tâche")
    
    with gr.Row():
        priority_output = gr.Textbox(label="Priorité suggérée", interactive=False)
        analysis_output = gr.Textbox(label="Analyse IA", interactive=False)
    
    result_output = gr.Textbox(label="Résultat", interactive=False)
    
    # Callbacks
    analyze_btn.click(
        analyze_task_description,
        inputs=desc_input,
        outputs=[priority_output, analysis_output]
    )
    
    create_btn.click(
        create_task_with_ai,
        inputs=[title_input, desc_input],
        outputs=result_output
    )

iface.launch()
```

**Interfaces avancées**
```python
# Interface avec fichiers
def process_image(image):
    # Simulation de traitement d'image
    return "Image traitée avec succès"

image_iface = gr.Interface(
    fn=process_image,
    inputs=gr.Image(type="pil"),
    outputs="text",
    title="Traitement d'images"
)

# Interface chat
def chat_response(message, history):
    # Simulation de chatbot
    responses = {
        "priorité": "Je peux vous aider à déterminer la priorité de vos tâches",
        "statut": "Voulez-vous voir le statut de vos tâches ?",
        "créer": "Je peux vous aider à créer une nouvelle tâche"
    }
    
    for key, response in responses.items():
        if key in message.lower():
            return response
    
    return "Comment puis-je vous aider avec vos tâches ?"

chat_iface = gr.ChatInterface(
    fn=chat_response,
    title="Assistant Tâches IA"
)
```

**Démonstration pratique (15 min)**
Création d'une interface Gradio basique pour l'analyse de tâches.

**Exercices guidés (10 min)**
1. Créer une interface de saisie simple
2. Ajouter une fonction d'analyse
3. Créer une interface chat

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour créer une interface ?
2. Comment gérer les fichiers ?
3. Quelle classe pour un chat ?

**Devoir**
Créer une interface Gradio complète pour la gestion assistée par IA des tâches.

---

## Cours 19 - Upload et traitement de fichiers
**Objectifs**
- Gérer l'upload de fichiers
- Traiter différents types de fichiers
- Stocker et servir les fichiers

**Leçon (30 min - détaillée)**
La gestion de fichiers est essentielle pour de nombreuses applications.

**Upload dans Streamlit**
```python
import streamlit as st
import pandas as pd
import os

st.title("Import/Export de Tâches")

# Upload de fichier
uploaded_file = st.file_uploader("Choisir un fichier CSV", type=['csv'])

if uploaded_file is not None:
    # Lecture du fichier
    df = pd.read_csv(uploaded_file)
    st.write("Aperçu des données:")
    st.dataframe(df.head())
    
    # Traitement des données
    if st.button("Importer les tâches"):
        tasks_imported = 0
        for _, row in df.iterrows():
            # Création de tâche via API
            task_data = {
                "title": row['title'],
                "description": row.get('description', ''),
                "priority": row.get('priority', 'medium')
            }
            # api_call('tasks', 'POST', task_data)
            tasks_imported += 1
        
        st.success(f"{tasks_imported} tâches importées avec succès!")

# Export de données
if st.button("Exporter les tâches"):
    # Récupération des tâches
    tasks = []  # api_call('tasks')
    
    # Création du DataFrame
    df_export = pd.DataFrame(tasks)
    
    # Téléchargement
    csv = df_export.to_csv(index=False)
    st.download_button(
        label="Télécharger CSV",
        data=csv,
        file_name="taches.csv",
        mime="text/csv"
    )
```

**Upload dans Dash**
```python
from dash import dcc, html, Input, Output, State
import base64
import io

app.layout = html.Div([
    dcc.Upload(
        id='upload-data',
        children=html.Div(['Glissez-déposez ou cliquez pour sélectionner un fichier']),
        style={
            'width': '100%',
            'height': '60px',
            'lineHeight': '60px',
            'borderWidth': '1px',
            'borderStyle': 'dashed',
            'borderRadius': '5px',
            'textAlign': 'center',
            'margin': '10px'
        },
        multiple=False
    ),
    html.Div(id='output-data-upload')
])

@app.callback(
    Output('output-data-upload', 'children'),
    Input('upload-data', 'contents'),
    State('upload-data', 'filename'),
    State('upload-data', 'last_modified')
)
def update_output(contents, filename, last_modified):
    if contents is not None:
        # Décodage du fichier
        content_type, content_string = contents.split(',')
        decoded = base64.b64decode(content_string)
        
        try:
            if 'csv' in filename:
                # Traitement CSV
                df = pd.read_csv(io.StringIO(decoded.decode('utf-8')))
                return html.Div([
                    html.H5(f'Fichier: {filename}'),
                    html.H6(f'Dernière modification: {last_modified}'),
                    dcc.Graph(
                        figure=px.histogram(df, x=df.columns[0])
                    )
                ])
        except Exception as e:
            return html.H5(f'Erreur lors du traitement: {e}')
    
    return html.Div()
```

**Gestion avancée des fichiers**
```python
# Validation et sécurité
def validate_file(file):
    # Vérification de la taille
    if len(file) > 10 * 1024 * 1024:  # 10MB max
        return False, "Fichier trop volumineux"
    
    # Vérification du type
    allowed_types = ['text/csv', 'application/json', 'image/jpeg']
    if file.type not in allowed_types:
        return False, "Type de fichier non autorisé"
    
    return True, "Fichier valide"

# Stockage sécurisé
def save_uploaded_file(uploaded_file, destination):
    """Sauvegarde sécurisée d'un fichier uploadé"""
    filename = secure_filename(uploaded_file.filename)
    file_path = os.path.join(destination, filename)
    
    # Création du dossier si nécessaire
    os.makedirs(destination, exist_ok=True)
    
    # Sauvegarde
    with open(file_path, 'wb') as f:
        f.write(uploaded_file.read())
    
    return file_path

# Traitement d'images
from PIL import Image

def process_image_file(image_file):
    """Traitement d'une image uploadée"""
    image = Image.open(image_file)
    
    # Redimensionnement
    image.thumbnail((800, 600))
    
    # Conversion format
    output = io.BytesIO()
    image.save(output, format='JPEG', quality=85)
    output.seek(0)
    
    return output
```

**Démonstration pratique (15 min)**
Implémentation d'un système d'upload de fichiers CSV.

**Exercices guidés (10 min)**
1. Créer un composant d'upload
2. Traiter un fichier CSV
3. Ajouter la validation de fichiers

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour l'upload Streamlit ?
2. Comment décoder un fichier base64 ?
3. Quelle validation pour la taille ?

**Devoir**
Implémenter un système complet d'import/export de tâches via fichiers.

---

## Cours 20 - Thèmes et personnalisation
**Objectifs**
- Personnaliser l'apparence des applications
- Créer des thèmes cohérents
- Améliorer l'expérience utilisateur

**Leçon (30 min - détaillée)**
Un design soigné améliore significativement l'adoption des applications.

**Thèmes Streamlit**
```python
import streamlit as st

# Configuration du thème
st.set_page_config(
    page_title="Gestion des Tâches",
    page_icon="✅",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Thème personnalisé via CSS
st.markdown("""
<style>
    .main {
        background-color: #f5f5f5;
    }
    .stButton>button {
        background-color: #4CAF50;
        color: white;
        border-radius: 8px;
        border: none;
        padding: 10px 20px;
    }
    .task-card {
        background: white;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin: 10px 0;
    }
</style>
""", unsafe_allow_html=True)

# Application avec thème
def main():
    st.title("✅ Gestion des Tâches")
    
    with st.sidebar:
        st.header("Navigation")
        page = st.selectbox("Aller à", ["Accueil", "Tâches", "Statistiques"])
    
    if page == "Accueil":
        st.markdown('<div class="task-card">', unsafe_allow_html=True)
        st.subheader("Bienvenue!")
        st.write("Votre application de gestion de tâches moderne.")
        st.markdown('</div>', unsafe_allow_html=True)
```

**Thèmes Dash avec CSS**
```python
# styles.css
"""
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fa;
}

.task-card {
    background: white;
    border-radius: 12px;
    padding: 20px;
    margin: 10px 0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
    transition: transform 0.2s;
}

.task-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.priority-high {
    border-left: 4px solid #dc3545;
}

.priority-medium {
    border-left: 4px solid #ffc107;
}

.priority-low {
    border-left: 4px solid #28a745;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    border-radius: 6px;
}

.btn-success {
    background-color: #28a745;
    border-color: #28a745;
    border-radius: 6px;
}
"""

# Application Dash avec thème
app = dash.Dash(__name__, external_stylesheets=['styles.css'])

def create_task_card(task):
    priority_class = f"priority-{task['priority']}"
    return html.Div([
        html.Div([
            html.H4(task['title']),
            html.P(task['description']),
            html.Small(f"Créée le {task['created_date']}")
        ], className=f"task-card {priority_class}")
    ])

# Layout avec thème
app.layout = html.Div([
    html.Nav([
        html.Div("Gestion des Tâches", className="navbar-brand")
    ], className="navbar navbar-expand-lg navbar-dark bg-primary"),
    
    html.Div([
        html.Div(id="task-container", className="container-fluid")
    ], className="main-content")
])
```

**Mode sombre/clair**
```python
# Streamlit - mode sombre
dark_mode = st.sidebar.checkbox("Mode sombre")

if dark_mode:
    st.markdown("""
    <style>
        .main {
            background-color: #1e1e1e;
            color: #ffffff;
        }
        .stTextInput>div>div>input {
            background-color: #3d3d3d;
            color: #ffffff;
        }
    </style>
    """, unsafe_allow_html=True)

# Dash - thème dynamique
@app.callback(
    Output('theme-store', 'data'),
    Input('theme-toggle', 'value')
)
def update_theme(theme):
    if theme == 'dark':
        return {'background': '#1e1e1e', 'color': '#ffffff'}
    else:
        return {'background': '#ffffff', 'color': '#000000'}
```

**Démonstration pratique (15 min)**
Application d'un thème personnalisé à une application Streamlit.

**Exercices guidés (10 min)**
1. Créer un thème CSS personnalisé
2. Appliquer des styles aux composants
3. Ajouter un mode sombre/clair

**QCM d'auto-évaluation (3 min)**
1. Comment appliquer du CSS dans Streamlit ?
2. Quelle classe pour les cartes ?
3. Comment créer un mode sombre ?

**Devoir**
Créer un thème complet et cohérent pour l'application de tâches.

---

## Cours 21 - Accessibilité web
**Objectifs**
- Comprendre l'importance de l'accessibilité
- Implémenter des pratiques d'accessibilité
- Rendre les applications utilisables par tous

**Leçon (30 min - détaillée)**
L'accessibilité web garantit que les applications sont utilisables par tous, y compris les personnes en situation de handicap.

**Principes d'accessibilité (WCAG)**
- **Perceptible** : L'information doit être présentée de manière perceptible
- **Utilisable** : Les composants d'interface doivent être utilisables
- **Compréhensible** : L'information et l'utilisation doivent être compréhensibles
- **Robuste** : Le contenu doit être suffisamment robuste

**Labels et descriptions**
```python
# Streamlit - labels accessibles
st.text_input(
    "Titre de la tâche",
    key="task_title",
    help="Entrez un titre descriptif pour votre tâche",
    placeholder="Ex: Préparer la réunion client"
)

# Descriptions détaillées
with st.expander("Aide - Création de tâches"):
    st.write("""
    Pour créer une tâche:
    1. Choisissez un titre clair et descriptif
    2. Ajoutez une description détaillée
    3. Sélectionnez la priorité appropriée
    4. Cliquez sur 'Créer'
    """)
```

**Navigation au clavier**
```python
# Focus visible
st.markdown("""
<style>
    .stButton>button:focus {
        outline: 2px solid #4A90E2;
        outline-offset: 2px;
    }
    
    .stTextInput>div>div>input:focus {
        outline: 2px solid #4A90E2;
        outline-offset: 2px;
    }
</style>
""", unsafe_allow_html=True)

# Raccourcis clavier
st.sidebar.markdown("### Raccourcis clavier")
st.sidebar.code("""
Ctrl+N : Nouvelle tâche
Ctrl+S : Sauvegarder
Ctrl+F : Rechercher
""")
```

**Contraste et lisibilité**
```python
# Thème haute contraste
high_contrast = st.sidebar.checkbox("Contraste élevé")

if high_contrast:
    st.markdown("""
    <style>
        body {
            background-color: #000000 !important;
            color: #ffffff !important;
        }
        .stButton>button {
            background-color: #ffffff !important;
            color: #000000 !important;
            border: 2px solid #ffffff !important;
        }
    </style>
    """, unsafe_allow_html=True)
```

**Support des lecteurs d'écran**
```python
# ARIA labels dans Dash
html.Button(
    "Ajouter tâche",
    id="add-task-btn",
    **{"aria-label": "Ajouter une nouvelle tâche à la liste"}
)

# Descriptions détaillées
html.Div([
    html.Label("Titre de la tâche", htmlFor="task-title"),
    dcc.Input(
        id="task-title",
        type="text",
        **{"aria-describedby": "title-help"}
    ),
    html.Div(
        "Le titre doit être clair et descriptif",
        id="title-help",
        style={"fontSize": "0.8em", "color": "#666"}
    )
])
```

**Taille de police ajustable**
```python
# Contrôle de la taille de police
font_size = st.sidebar.slider(
    "Taille de police",
    min_value=12,
    max_value=24,
    value=16,
    step=2
)

st.markdown(f"""
<style>
    body {{
        font-size: {font_size}px !important;
    }}
    .stMarkdown p {{
        font-size: {font_size}px !important;
    }}
</style>
""", unsafe_allow_html=True)
```

**Démonstration pratique (15 min)**
Ajout de fonctionnalités d'accessibilité à une interface existante.

**Exercices guidés (10 min)**
1. Ajouter des labels descriptifs
2. Implémenter la navigation au clavier
3. Créer un mode haute contraste

**QCM d'auto-évaluation (3 min)**
1. Que signifie WCAG ?
2. Quelle balise pour les labels ?
3. Comment améliorer le contraste ?

**Devoir**
Auditer et améliorer l'accessibilité d'une interface existante.

---

## Cours 22 - Performance et optimisation
**Objectifs**
- Optimiser les performances des applications
- Gérer le cache efficacement
- Améliorer la réactivité

**Leçon (30 min - détaillée)**
Des applications performantes offrent une meilleure expérience utilisateur.

**Cache dans Streamlit**
```python
import streamlit as st
import time

@st.cache_data(ttl=3600)  # Cache 1 heure
def load_tasks_from_api():
    """Charge les tâches depuis l'API avec cache"""
    # Simulation d'appel API lent
    time.sleep(2)
    return [
        {"id": 1, "title": "Tâche 1", "completed": False},
        {"id": 2, "title": "Tâche 2", "completed": True}
    ]

@st.cache_data
def process_task_data(tasks):
    """Traite les données des tâches"""
    completed = [t for t in tasks if t["completed"]]
    pending = [t for t in tasks if not t["completed"]]
    return {
        "total": len(tasks),
        "completed": len(completed),
        "pending": len(pending),
        "completion_rate": len(completed) / len(tasks) * 100
    }

# Utilisation
tasks = load_tasks_from_api()
stats = process_task_data(tasks)

# Bouton pour invalider le cache
if st.button("Actualiser les données"):
    st.cache_data.clear()
    st.rerun()
```

**Optimisation Dash**
```python
from dash import DiskcacheManager, CeleryManager
import diskcache

# Cache disque pour les callbacks
cache = diskcache.Cache("./cache")
background_manager = DiskcacheManager(cache)

app = dash.Dash(__name__, background_manager=background_manager)

@app.callback(
    Output('task-table', 'data'),
    Input('refresh-btn', 'n_clicks'),
    background=True,  # Exécution en arrière-plan
    manager=background_manager
)
def update_table(n_clicks):
    # Traitement potentiellement long
    time.sleep(5)  # Simulation
    return load_heavy_data()
```

**Lazy loading et pagination**
```python
# Pagination dans Streamlit
def display_tasks_paginated(tasks, page_size=10):
    total_pages = (len(tasks) + page_size - 1) // page_size
    
    page = st.number_input(
        "Page",
        min_value=1,
        max_value=total_pages,
        value=1
    )
    
    start_idx = (page - 1) * page_size
    end_idx = start_idx + page_size
    
    page_tasks = tasks[start_idx:end_idx]
    
    for task in page_tasks:
        st.write(f"- {task['title']}")
    
    st.write(f"Page {page} sur {total_pages}")

# Chargement progressif
@st.cache_data
def load_tasks_page(page, page_size):
    """Charge une page spécifique de tâches"""
    offset = (page - 1) * page_size
    # API call with pagination
    return api_call(f"tasks?page={page}&limit={page_size}")
```

**Optimisation des requêtes**
```python
# Regroupement de requêtes
@st.cache_data(ttl=300)
def load_dashboard_data():
    """Charge toutes les données du dashboard en une fois"""
    return {
        "tasks": api_call("tasks"),
        "stats": api_call("tasks/stats"),
        "categories": api_call("categories")
    }

# Utilisation
data = load_dashboard_data()
st.metric("Total tâches", data["stats"]["total"])
# ... autres utilisations des données
```

**Monitoring des performances**
```python
import time
import logging

def time_function(func):
    """Décorateur pour mesurer le temps d'exécution"""
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        logging.info(f"{func.__name__} took {end - start:.2f} seconds")
        return result
    return wrapper

@time_function
@st.cache_data
def slow_api_call():
    time.sleep(2)
    return "result"
```

**Démonstration pratique (15 min)**
Implémentation du cache et optimisation d'une application lente.

**Exercices guidés (10 min)**
1. Ajouter du cache aux fonctions lentes
2. Implémenter la pagination
3. Mesurer les performances

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour le cache Streamlit ?
2. Comment créer un décorateur de timing ?
3. Quelle stratégie pour la pagination ?

**Devoir**
Optimiser les performances d'une application existante avec cache et pagination.

---

## Cours 23 - Tests d'interfaces
**Objectifs**
- Tester les interfaces utilisateur
- Automatiser les tests d'UI
- Valider le comportement des applications

**Leçon (30 min - détaillée)**
Les tests garantissent la qualité et la fiabilité des interfaces.

**Tests Streamlit**
```python
# tests/test_app.py
import pytest
from streamlit.testing.v1 import AppTest

class TestTaskApp:
    def test_app_renders(self):
        """Test que l'application se charge correctement"""
        at = AppTest.from_file("app.py")
        at.run()
        
        assert not at.exception
        assert "Gestion des Tâches" in at.title[0].value

    def test_add_task(self):
        """Test l'ajout d'une tâche"""
        at = AppTest.from_file("app.py")
        at.run()
        
        # Remplir le formulaire
        at.text_input[0].input("Nouvelle tâche").run()
        at.button[0].click().run()
        
        # Vérifier que la tâche apparaît
        assert "Nouvelle tâche" in str(at)

    def test_task_filtering(self):
        """Test le filtrage des tâches"""
        at = AppTest.from_file("app.py")
        at.run()
        
        # Sélectionner un filtre
        at.selectbox[0].select("Terminée").run()
        
        # Vérifier que seules les tâches terminées sont affichées
        # (Logique dépendante de l'implémentation)
```

**Tests Dash**
```python
# tests/test_dash_app.py
import pytest
from dash.testing.application_runners import import_app

def test_app_layout(dash_duo):
    """Test la structure de l'application"""
    app = import_app("app")
    dash_duo.start_server(app)
    
    # Vérifier la présence d'éléments
    assert dash_duo.find_element("#task-input")
    assert dash_duo.find_element("#add-button")
    
    dash_duo.wait_for_text_to_equal("#task-count", "0")

def test_add_task(dash_duo):
    """Test l'ajout interactif d'une tâche"""
    app = import_app("app")
    dash_duo.start_server(app)
    
    # Saisir une tâche
    task_input = dash_duo.find_element("#task-input")
    task_input.send_keys("Test task")
    
    # Cliquer sur ajouter
    add_button = dash_duo.find_element("#add-button")
    add_button.click()
    
    # Vérifier que la tâche apparaît
    dash_duo.wait_for_text_to_equal("#task-count", "1")

def test_callback_updates(dash_duo):
    """Test les callbacks et mises à jour"""
    app = import_app("app")
    dash_duo.start_server(app)
    
    # Déclencher un callback
    dash_duo.find_element("#refresh-btn").click()
    
    # Attendre la mise à jour
    dash_duo.wait_for_element("#task-list")
```

**Tests d'intégration**
```python
# tests/test_integration.py
import requests
from streamlit.testing.v1 import AppTest

def test_full_workflow():
    """Test du workflow complet"""
    # Démarrer l'API (supposé déjà lancé)
    
    # Tester l'application Streamlit
    at = AppTest.from_file("app.py")
    at.run()
    
    # Simuler l'ajout d'une tâche
    at.text_input[0].input("Tâche de test").run()
    at.button[0].click().run()
    
    # Vérifier dans l'API
    response = requests.get("http://localhost:5000/api/tasks")
    tasks = response.json()
    
    assert any(task["title"] == "Tâche de test" for task in tasks)

# Tests de performance
def test_ui_performance(dash_duo):
    """Test des performances de l'interface"""
    app = import_app("app")
    start_time = time.time()
    
    dash_duo.start_server(app)
    
    # Mesurer le temps de chargement
    load_time = time.time() - start_time
    assert load_time < 5.0  # Moins de 5 secondes
```

**Tests d'accessibilité**
```python
# tests/test_accessibility.py
def test_accessibility(dash_duo):
    """Test d'accessibilité basique"""
    app = import_app("app")
    dash_duo.start_server(app)
    
    # Vérifier les labels
    inputs = dash_duo.find_elements("input")
    for input_elem in inputs:
        assert input_elem.get_attribute("aria-label") or input_elem.get_attribute("aria-labelledby")
    
    # Vérifier le contraste (nécessite des outils spécialisés)
    # ...
```

**CI/CD pour les tests**
```yaml
# .github/workflows/test-ui.yml
name: Test UI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install pytest pytest-dash streamlit
      
      - name: Run API
        run: python -m uvicorn api:app --host 0.0.0.0 --port 8000 &
      
      - name: Run UI tests
        run: pytest tests/ -v
```

**Démonstration pratique (15 min)**
Écriture et exécution de tests pour une interface Streamlit.

**Exercices guidés (10 min)**
1. Créer un test de rendu d'application
2. Tester un formulaire interactif
3. Écrire un test d'intégration

**QCM d'auto-évaluation (3 min)**
1. Quelle bibliothèque pour tester Streamlit ?
2. Comment tester un callback Dash ?
3. Quelle commande pour les tests ?

**Devoir**
Créer une suite de tests complète pour une application d'interface.

---

## Cours 24 - Déploiement Streamlit/Dash
**Objectifs**
- Déployer des applications Streamlit en production
- Configurer Dash pour le déploiement
- Gérer les environnements de production

**Leçon (30 min - détaillée)**
Le déploiement transforme une application de développement en service accessible.

**Déploiement Streamlit Cloud**
```python
# requirements.txt
streamlit==1.25.0
requests==2.31.0
pandas==2.0.3
plotly==5.15.0

# package.json (optionnel pour Node.js dependencies)
{
  "name": "task-app",
  "version": "1.0.0",
  "dependencies": {}
}
```

**Configuration Streamlit**
```python
# .streamlit/config.toml
[server]
headless = true
port = 8501

[browser]
gatherUsageStats = false

[theme]
primaryColor = "#F63366"
backgroundColor = "#FFFFFF"
secondaryBackgroundColor = "#F0F2F6"
textColor = "#262730"
```

**Déploiement sur Streamlit Cloud**
1. Pousser le code sur GitHub
2. Se connecter à share.streamlit.io
3. Sélectionner le repository
4. Configurer les secrets si nécessaire
5. Déployer

**Déploiement Dash sur Heroku**
```python
# app.py (modifié pour Heroku)
import os

app = dash.Dash(__name__)

# Configuration pour Heroku
server = app.server

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8050))
    app.run_server(host='0.0.0.0', port=port, debug=False)
```

**Procfile pour Heroku**
```
web: gunicorn app:server
```

**requirements.txt pour Heroku**
```
dash==2.11.1
gunicorn==20.1.0
pandas==2.0.3
plotly==5.15.0
```

**Déploiement sur Railway**
```yaml
# railway.toml
[build]
builder = "python"

[deploy]
startCommand = "streamlit run app.py --server.port $PORT --server.headless true"
```

**Docker pour Streamlit**
```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port", "8501", "--server.headless", "true"]
```

**Sécurité en production**
```python
# Configuration sécurisée
import os

# Variables d'environnement
API_BASE = os.getenv('API_BASE', 'http://localhost:5000/api')
SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key')

# Validation des entrées
def validate_input(text):
    if not text or len(text.strip()) == 0:
        raise ValueError("Le texte ne peut pas être vide")
    if len(text) > 200:
        raise ValueError("Le texte est trop long")
    return text.strip()

# Rate limiting
from streamlit_caching import cache_with_expiration

@cache_with_expiration(60)  # 1 minute cache
def expensive_operation():
    # Opération coûteuse
    pass
```

**Monitoring en production**
```python
# Intégration avec Sentry
import sentry_sdk
from sentry_sdk.integrations.streamlit import StreamlitIntegration

sentry_sdk.init(
    dsn="your-dsn-here",
    integrations=[StreamlitIntegration()],
    traces_sample_rate=1.0
)

# Logs structurés
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_user_action(action, user_id=None):
    logger.info(f"User action: {action}", extra={'user_id': user_id})
```

**Démonstration pratique (15 min)**
Configuration et déploiement d'une application Streamlit sur Streamlit Cloud.

**Exercices guidés (10 min)**
1. Créer un fichier requirements.txt
2. Configurer l'application pour le déploiement
3. Tester localement le déploiement

**QCM d'auto-évaluation (3 min)**
1. Quel port pour Streamlit en production ?
2. Quelle commande Heroku ?
3. Comment sécuriser les secrets ?

**Devoir**
Déployer une application Streamlit en production avec configuration appropriée.

---

## Cours 25 - Intégration CI/CD
**Objectifs**
- Automatiser le déploiement
- Intégrer les tests dans le pipeline
- Gérer les environnements multiples

**Leçon (30 min - détaillée)**
L'intégration continue assure la qualité et accélère le développement.

**GitHub Actions pour Streamlit**
```yaml
# .github/workflows/deploy.yml
name: Deploy Streamlit App

on:
  push:
    branches: [ main ]
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
          python-version: '3.9'
      
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt
      
      - name: Run tests
        run: |
          pip install pytest streamlit
          pytest tests/ -v
      
      - name: Check code quality
        run: |
          pip install flake8
          flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
          flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics

  deploy:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to Streamlit Cloud
        run: |
          pip install streamlit
          streamlit run app.py --server.headless true --server.port 8501 &
          sleep 10
          curl -f http://localhost:8501 || exit 1
```

**Pipeline pour Dash**
```yaml
# .github/workflows/dash-deploy.yml
name: Deploy Dash App

on:
  push:
    branches: [ main ]

jobs:
  test-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
      
      - name: Install dependencies
        run: pip install -r requirements.txt
      
      - name: Run tests
        run: pytest tests/ -v --tb=short
      
      - name: Build Docker image
        run: docker build -t task-app .
      
      - name: Test Docker image
        run: |
          docker run -d -p 8050:8050 --name test-app task-app
          sleep 10
          curl -f http://localhost:8050 || exit 1
          docker stop test-app
      
      - name: Deploy to Railway
        if: success()
        run: |
          # Utiliser Railway CLI ou API
          echo "Deployment to Railway would happen here"
```

**Tests automatisés**
```python
# tests/test_ci.py
import subprocess
import sys

def test_app_imports():
    """Test que toutes les dépendances s'importent"""
    try:
        import streamlit as st
        import pandas as pd
        import plotly.express as px
        import requests
        print("✓ All imports successful")
    except ImportError as e:
        print(f"✗ Import failed: {e}")
        sys.exit(1)

def test_app_runs():
    """Test que l'application démarre"""
    try:
        # Démarrer l'app en arrière-plan
        process = subprocess.Popen([
            sys.executable, "-m", "streamlit", "run", "app.py",
            "--server.headless", "true", "--server.port", "8501"
        ])
        
        # Attendre un peu
        import time
        time.sleep(5)
        
        # Tester la connectivité
        import requests
        response = requests.get("http://localhost:8501")
        if response.status_code == 200:
            print("✓ App started successfully")
        else:
            print(f"✗ App returned status {response.status_code}")
            sys.exit(1)
            
    except Exception as e:
        print(f"✗ App failed to start: {e}")
        sys.exit(1)
    finally:
        process.terminate()
        process.wait()

if __name__ == "__main__":
    test_app_imports()
    test_app_runs()
    print("✓ All CI tests passed")
```

**Environnements multiples**
```yaml
# .github/workflows/deploy-staging.yml
name: Deploy to Staging

on:
  push:
    branches: [ develop ]

jobs:
  deploy-staging:
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to staging environment
        run: |
          echo "Deploying to staging"
          # Configuration spécifique au staging
          export API_BASE=https://api-staging.example.com
          export ENVIRONMENT=staging
          
          # Déploiement...
```

**Déploiement bleu-vert**
```python
# scripts/deploy.py
import boto3
import time

def blue_green_deploy():
    """Déploiement bleu-vert sur AWS"""
    elb_client = boto3.client('elbv2')
    
    # Identifier les groupes cibles
    blue_target_group = 'arn:aws:elasticloadbalancing:.../blue'
    green_target_group = 'arn:aws:elasticloadbalancing:.../green'
    
    # Basculer le trafic
    elb_client.modify_listener(
        ListenerArn='arn:aws:elasticloadbalancing:.../listener',
        DefaultActions=[
            {
                'Type': 'forward',
                'TargetGroupArn': green_target_group
            }
        ]
    )
    
    # Attendre que le nouveau déploiement soit prêt
    time.sleep(60)
    
    # Vérifier la santé
    health = elb_client.describe_target_health(
        TargetGroupArn=green_target_group
    )
    
    healthy_count = sum(1 for target in health['TargetHealthDescriptions'] 
                       if target['TargetHealth']['State'] == 'healthy')
    
    if healthy_count == len(health['TargetHealthDescriptions']):
        print("✓ Blue-green deployment successful")
        # Mettre à jour les références bleu/vert pour le prochain déploiement
    else:
        print("✗ Health check failed, rolling back")
        # Rollback automatique
```

**Démonstration pratique (15 min)**
Configuration d'un pipeline CI/CD basique pour une application Streamlit.

**Exercices guidés (10 min)**
1. Créer un workflow GitHub Actions
2. Ajouter des tests automatisés
3. Configurer le déploiement automatique

**QCM d'auto-évaluation (3 min)**
1. Quel événement déclenche le déploiement ?
2. Quelle commande pour les tests ?
3. Comment gérer les environnements ?

**Devoir**
Mettre en place un pipeline CI/CD complet pour une application d'interface.

---

## Cours 26 - Applications mobiles avec Python
**Objectifs**
- Créer des interfaces adaptatives
- Optimiser pour les appareils mobiles
- Gérer les interactions tactiles

**Leçon (30 min - détaillée)**
Les applications modernes doivent fonctionner sur tous les appareils.

**Responsive design dans Streamlit**
```python
import streamlit as st

# Détection du device
def get_device_type():
    """Détecte le type d'appareil (simple)"""
    try:
        from streamlit.web.server.server_util import get_current_session_info
        user_agent = get_current_session_info().user_agent
        if 'Mobile' in user_agent:
            return 'mobile'
        elif 'Tablet' in user_agent:
            return 'tablet'
        else:
            return 'desktop'
    except:
        return 'desktop'

device = get_device_type()

# Layout adaptatif
if device == 'mobile':
    # Layout compact pour mobile
    st.title("📱 Tâches")
    
    # Formulaire compact
    with st.form("quick_add"):
        title = st.text_input("Titre", key="mobile_title")
        submitted = st.form_submit_button("➕")
        if submitted and title:
            st.success(f"✓ {title}")
    
    # Liste compacte
    tasks = ["Réunion", "Courses", "Sport"]
    for task in tasks:
        col1, col2 = st.columns([4, 1])
        with col1:
            st.write(f"• {task}")
        with col2:
            if st.button("✓", key=f"complete_{task}"):
                st.success(f"Terminé: {task}")

elif device == 'tablet':
    # Layout intermédiaire
    col1, col2 = st.columns(2)
    with col1:
        st.subheader("Ajouter")
        # Formulaire
    with col2:
        st.subheader("Liste")
        # Liste des tâches

else:
    # Layout desktop complet
    col1, col2, col3 = st.columns([1, 2, 1])
    with col1:
        st.subheader("Navigation")
    with col2:
        st.subheader("Contenu principal")
    with col3:
        st.subheader("Actions")
```

**CSS responsive**
```python
# CSS pour mobile
mobile_css = """
<style>
@media (max-width: 768px) {
    .main .block-container {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    
    .stButton>button {
        width: 100%;
        margin: 0.25rem 0;
    }
    
    .stTextInput>div>div>input {
        font-size: 16px; /* Empêche zoom iOS */
    }
}

@media (max-width: 480px) {
    .stMarkdown h1 {
        font-size: 1.5rem;
    }
    
    .stMarkdown h2 {
        font-size: 1.25rem;
    }
}
</style>
"""

st.markdown(mobile_css, unsafe_allow_html=True)
```

**Interactions tactiles**
```python
# Gestion des gestes tactiles (limité dans Streamlit)
st.markdown("""
<script>
document.addEventListener('touchstart', function(e) {
    // Gestion du touch
});

document.addEventListener('touchmove', function(e) {
    // Gestion du swipe
});

document.addEventListener('touchend', function(e) {
    // Fin du touch
});
</script>
""", unsafe_allow_html=True)

# Boutons adaptés mobile
if device == 'mobile':
    # Boutons plus grands
    st.markdown("""
    <style>
        .stButton>button {
            height: 3rem;
            font-size: 1.2rem;
        }
    </style>
    """, unsafe_allow_html=True)
```

**PWA features**
```python
# Manifest pour PWA
manifest = {
    "name": "Gestion des Tâches",
    "short_name": "Tâches",
    "description": "Application de gestion de tâches",
    "start_url": "/",
    "display": "standalone",
    "background_color": "#ffffff",
    "theme_color": "#4CAF50",
    "icons": [
        {
            "src": "/static/icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        }
    ]
}

# Service Worker basique
service_worker = """
self.addEventListener('install', function(e) {
    console.log('Service Worker installing');
});

self.addEventListener('fetch', function(e) {
    // Cache strategy
});
"""

# Sauvegarder les fichiers PWA
import json
with open('static/manifest.json', 'w') as f:
    json.dump(manifest, f)

with open('static/sw.js', 'w') as f:
    f.write(service_worker)
```

**Dash mobile**
```python
# Dash avec composants mobiles
import dash_bootstrap_components as dbc

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Layout mobile-first
app.layout = dbc.Container([
    dbc.Row([
        dbc.Col([
            html.H1("Tâches", className="text-center mb-4"),
            
            # Formulaire d'ajout
            dbc.Card([
                dbc.CardBody([
                    dbc.InputGroup([
                        dbc.Input(id="task-input", placeholder="Nouvelle tâche..."),
                        dbc.Button("Ajouter", id="add-btn", color="primary")
                    ], className="mb-3"),
                    
                    # Liste des tâches
                    html.Div(id="task-list", className="mt-3")
                ])
            ])
        ], width=12, lg=8, className="mx-auto")
    ])
], fluid=True, className="p-3")

# Callbacks adaptés mobile
@app.callback(
    Output("task-list", "children"),
    Input("add-btn", "n_clicks"),
    State("task-input", "value"),
    State("task-list", "children")
)
def add_task(n_clicks, task_title, current_tasks):
    if n_clicks and task_title:
        new_task = dbc.ListGroupItem([
            dbc.Row([
                dbc.Col(task_title, width=8),
                dbc.Col([
                    dbc.Button("✓", color="success", size="sm", className="me-2"),
                    dbc.Button("✗", color="danger", size="sm")
                ], width=4, className="text-end")
            ])
        ], className="mb-2")
        
        if current_tasks:
            return current_tasks + [new_task]
        else:
            return [new_task]
    
    return current_tasks or []
```

**Démonstration pratique (15 min)**
Adaptation d'une interface Streamlit pour les appareils mobiles.

**Exercices guidés (10 min)**
1. Créer un layout responsive
2. Ajouter du CSS mobile
3. Tester sur différents appareils

**QCM d'auto-évaluation (3 min)**
1. Quelle media query pour mobile ?
2. Comment détecter le device ?
3. Quelle classe Bootstrap pour mobile ?

**Devoir**
Rendre une application existante entièrement responsive et mobile-friendly.

---

## Cours 27 - WebSockets et temps réel
**Objectifs**
- Implémenter des communications temps réel
- Gérer les WebSockets
- Créer des interfaces live

**Leçon (30 min - détaillée)**
Les applications modernes nécessitent souvent des mises à jour en temps réel.

**WebSockets avec Streamlit**
```python
import streamlit as st
import websocket
import json
import threading
import time

# Gestionnaire WebSocket
class WSHandler:
    def __init__(self):
        self.ws = None
        self.connected = False
        self.messages = []
        
    def connect(self, url):
        def on_message(ws, message):
            data = json.loads(message)
            self.messages.append(data)
            
        def on_error(ws, error):
            st.error(f"WebSocket error: {error}")
            
        def on_close(ws, close_status_code, close_msg):
            self.connected = False
            
        def on_open(ws):
            self.connected = True
            st.success("Connecté au serveur temps réel")
        
        self.ws = websocket.WebSocketApp(url,
                                        on_message=on_message,
                                        on_error=on_error,
                                        on_close=on_close,
                                        on_open=on_open)
        
        # Démarrer dans un thread
        wst = threading.Thread(target=self.ws.run_forever)
        wst.daemon = True
        wst.start()
    
    def send(self, message):
        if self.connected and self.ws:
            self.ws.send(json.dumps(message))

# Interface Streamlit temps réel
st.title("🔔 Notifications Temps Réel")

if 'ws_handler' not in st.session_state:
    st.session_state.ws_handler = WSHandler()

ws_handler = st.session_state.ws_handler

# Connexion
if not ws_handler.connected:
    if st.button("Se connecter"):
        ws_handler.connect("ws://localhost:8765")
        time.sleep(1)  # Attendre la connexion

# Affichage des messages
if ws_handler.messages:
    st.subheader("Messages reçus:")
    for msg in reversed(ws_handler.messages[-10:]):  # Derniers 10
        with st.container():
            st.write(f"**{msg.get('type', 'Message')}:** {msg.get('content', '')}")
            st.caption(f"Reçu à {msg.get('timestamp', 'maintenant')}")

# Envoi de messages
with st.form("send_message"):
    message = st.text_input("Message à envoyer")
    submitted = st.form_submit_button("Envoyer")
    
    if submitted and message:
        ws_handler.send({
            "type": "message",
            "content": message,
            "timestamp": time.time()
        })
        st.success("Message envoyé!")
```

**WebSockets avec Dash**
```python
import dash
from dash import html, dcc, Input, Output, State
from dash_extensions import WebSocket

app = dash.Dash(__name__)

app.layout = html.Div([
    dcc.Store(id='messages-store', data=[]),
    
    html.H1("Chat Temps Réel"),
    
    WebSocket(id="ws", url="ws://localhost:8765"),
    
    html.Div(id="messages-container", 
            style={"height": "300px", "overflowY": "scroll", "border": "1px solid #ddd", "padding": "10px"}),
    
    dcc.Input(id="message-input", type="text", placeholder="Tapez votre message..."),
    html.Button("Envoyer", id="send-btn")
])

@app.callback(
    Output("messages-store", "data"),
    Input("ws", "message"),
    State("messages-store", "data")
)
def update_messages(message, current_messages):
    if message:
        data = json.loads(message["data"])
        current_messages.append(data)
        return current_messages[-50:]  # Garder les 50 derniers
    return current_messages

@app.callback(
    Output("messages-container", "children"),
    Input("messages-store", "data")
)
def display_messages(messages):
    return [
        html.Div([
            html.Strong(f"{msg['user']}: "),
            html.Span(msg['content']),
            html.Small(f" {msg['timestamp']}", style={"color": "#666"})
        ], style={"margin": "5px 0"})
        for msg in messages
    ]

@app.callback(
    Output("ws", "send"),
    Input("send-btn", "n_clicks"),
    State("message-input", "value"),
    State("ws", "state")
)
def send_message(n_clicks, message, ws_state):
    if n_clicks and message and ws_state.get("readyState") == 1:  # OPEN
        return json.dumps({
            "user": "Utilisateur",
            "content": message,
            "timestamp": time.strftime("%H:%M:%S")
        })
    return dash.no_update
```

**Serveur WebSocket simple**
```python
# websocket_server.py
import asyncio
import websockets
import json
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

connected_clients = set()

async def handler(websocket, path):
    # Ajouter le client
    connected_clients.add(websocket)
    logger.info(f"Nouveau client connecté. Total: {len(connected_clients)}")
    
    try:
        # Diffuser un message de bienvenue
        welcome_msg = {
            "type": "system",
            "content": "Bienvenue dans le chat!",
            "timestamp": "maintenant"
        }
        await websocket.send(json.dumps(welcome_msg))
        
        async for message in websocket:
            data = json.loads(message)
            logger.info(f"Message reçu: {data}")
            
            # Diffuser à tous les clients
            for client in connected_clients:
                if client != websocket:  # Ne pas renvoyer à l'expéditeur
                    try:
                        await client.send(message)
                    except:
                        pass  # Client déconnecté
    
    except websockets.exceptions.ConnectionClosed:
        logger.info("Client déconnecté")
    finally:
        connected_clients.remove(websocket)

async def main():
    server = await websockets.serve(handler, "localhost", 8765)
    logger.info("Serveur WebSocket démarré sur ws://localhost:8765")
    await server.wait_closed()

if __name__ == "__main__":
    asyncio.run(main())
```

**Notifications temps réel**
```python
# notifications.py
import asyncio
import websockets
import json

async def notification_service():
    """Service de notifications temps réel"""
    uri = "ws://localhost:8765"
    
    async with websockets.connect(uri) as websocket:
        # S'abonner aux notifications
        await websocket.send(json.dumps({
            "type": "subscribe",
            "channel": "notifications"
        }))
        
        async for message in websocket:
            data = json.loads(message)
            
            if data["type"] == "task_due":
                # Afficher une notification
                print(f"🚨 Tâche à échéance: {data['task_title']}")
            
            elif data["type"] == "task_completed":
                print(f"✅ Tâche terminée: {data['task_title']}")

# Intégration dans Streamlit
def show_notifications():
    """Afficher les notifications dans Streamlit"""
    if 'notifications' not in st.session_state:
        st.session_state.notifications = []
    
    # Placeholder pour les notifications
    notification_placeholder = st.empty()
    
    # Simuler la réception de notifications
    if st.button("Simuler notification"):
        st.session_state.notifications.append({
            "message": "Nouvelle tâche assignée!",
            "timestamp": time.time()
        })
    
    # Afficher les notifications
    with notification_placeholder.container():
        if st.session_state.notifications:
            st.subheader("🔔 Notifications")
            for notif in reversed(st.session_state.notifications[-5:]):
                st.info(f"{notif['message']} - {time.strftime('%H:%M', time.localtime(notif['timestamp']))}")
```

**Démonstration pratique (15 min)**
Création d'une interface de chat temps réel avec WebSockets.

**Exercices guidés (10 min)**
1. Configurer un serveur WebSocket
2. Créer un client WebSocket
3. Implémenter un système de notifications

**QCM d'auto-évaluation (3 min)**
1. Quel port standard pour WebSocket ?
2. Comment gérer les connexions ?
3. Quelle bibliothèque pour WebSocket en Python ?

**Devoir**
Implémenter un système de notifications temps réel dans une application existante.

---

## Cours 28 - Sécurité des interfaces
**Objectifs**
- Sécuriser les applications web
- Protéger contre les attaques courantes
- Implémenter l'authentification sécurisée

**Leçon (30 min - détaillée)**
La sécurité est cruciale pour les applications web exposées.

**Protection XSS**
```python
import streamlit as st
import html

# Échapper le HTML automatiquement (Streamlit le fait par défaut)
user_input = st.text_input("Commentaire")

# Affichage sécurisé
st.write(f"Commentaire: {user_input}")  # Streamlit échappe automatiquement

# Pour du HTML personnalisé, utiliser html.escape
safe_html = f"<p>{html.escape(user_input)}</p>"
st.markdown(safe_html, unsafe_allow_html=True)

# Validation d'entrée
def validate_comment(comment):
    if len(comment) > 500:
        raise ValueError("Commentaire trop long")
    
    # Liste de mots interdits
    forbidden_words = ['spam', 'inappropriate']
    for word in forbidden_words:
        if word.lower() in comment.lower():
            raise ValueError("Contenu inapproprié")
    
    return comment

try:
    safe_comment = validate_comment(user_input)
    st.write(f"Commentaire validé: {safe_comment}")
except ValueError as e:
    st.error(f"Erreur de validation: {e}")
```

**Protection CSRF**
```python
# Dans Dash, utiliser des tokens CSRF
import secrets

app = dash.Dash(__name__)

# Générer un token CSRF par session
@app.server.before_request
def csrf_protect():
    if request.method == "POST":
        token = session.get('csrf_token')
        if not token or token != request.form.get('csrf_token'):
            abort(403)

@app.callback(
    Output("csrf-token-store", "data"),
    Input("page-load", "children")
)
def generate_csrf_token(_):
    if 'csrf_token' not in session:
        session['csrf_token'] = secrets.token_urlsafe(32)
    return session['csrf_token']

# Inclure le token dans les formulaires
app.layout = html.Div([
    dcc.Store(id="csrf-token-store"),
    html.Form([
        dcc.Input(type="hidden", id="csrf-token-input"),
        # Autres champs...
    ])
])

@app.callback(
    Output("csrf-token-input", "value"),
    Input("csrf-token-store", "data")
)
def set_csrf_token(token):
    return token
```

**Sécurisation des uploads**
```python
import os
import magic
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
MAX_FILE_SIZE = 2 * 1024 * 1024  # 2MB

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def validate_file_content(file_path):
    """Valider le type MIME réel du fichier"""
    mime = magic.Magic(mime=True)
    file_type = mime.from_file(file_path)
    
    allowed_mimes = ['image/png', 'image/jpeg', 'image/gif']
    return file_type in allowed_mimes

@app.callback(
    Output("upload-status", "children"),
    Input("file-upload", "contents"),
    State("file-upload", "filename"),
    State("file-upload", "last_modified")
)
def handle_upload(contents, filename, last_modified):
    if not contents or not filename:
        return "Aucun fichier sélectionné"
    
    # Validation du nom de fichier
    if not allowed_file(filename):
        return "Type de fichier non autorisé"
    
    # Sauvegarde temporaire pour validation
    content_type, content_string = contents.split(',')
    decoded = base64.b64decode(content_string)
    
    temp_path = os.path.join(UPLOAD_FOLDER, f"temp_{filename}")
    with open(temp_path, 'wb') as f:
        f.write(decoded)
    
    # Validation du contenu
    if not validate_file_content(temp_path):
        os.remove(temp_path)
        return "Contenu du fichier invalide"
    
    # Renommage sécurisé
    safe_filename = secure_filename(filename)
    final_path = os.path.join(UPLOAD_FOLDER, safe_filename)
    os.rename(temp_path, final_path)
    
    return f"Fichier uploadé avec succès: {safe_filename}"
```

**Rate limiting**
```python
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

# Configuration du rate limiting
limiter = Limiter(
    app=app.server,
    key_func=get_remote_address,
    default_limits=["200 per day", "50 per hour"]
)

# Limites spécifiques
@app.server.route('/api/tasks', methods=['POST'])
@limiter.limit("10 per minute")
def create_task():
    # Logique de création
    pass

# Limites par utilisateur (avec authentification)
@limiter.limit("100 per day", key_func=lambda: current_user.id if current_user else get_remote_address())
def user_specific_limit():
    pass
```

**Headers de sécurité**
```python
# Configuration des headers de sécurité
@app.server.after_request
def add_security_headers(response):
    response.headers['X-Content-Type-Options'] = 'nosniff'
    response.headers['X-Frame-Options'] = 'DENY'
    response.headers['X-XSS-Protection'] = '1; mode=block'
    response.headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'
    response.headers['Content-Security-Policy'] = "default-src 'self'"
    response.headers['Referrer-Policy'] = 'strict-origin-when-cross-origin'
    return response

# Content Security Policy détaillée
CSP = {
    'default-src': "'self'",
    'script-src': ["'self'", "'unsafe-inline'", "https://code.jquery.com"],
    'style-src': ["'self'", "'unsafe-inline'", "https://stackpath.bootstrapcdn.com"],
    'img-src': ["'self'", "data:", "https:"],
    'font-src': ["'self'", "https://fonts.gstatic.com"],
    'connect-src': ["'self'", "https://api.example.com"]
}

csp_string = '; '.join([f"{k} {' '.join(v) if isinstance(v, list) else v}" for k, v in CSP.items()])
response.headers['Content-Security-Policy'] = csp_string
```

**Audit et logging**
```python
import logging
from datetime import datetime

# Configuration du logging de sécurité
security_logger = logging.getLogger('security')
security_logger.setLevel(logging.INFO)

handler = logging.FileHandler('security.log')
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
security_logger.addHandler(handler)

def log_security_event(event_type, user=None, ip=None, details=None):
    """Logger les événements de sécurité"""
    message = f"{event_type}"
    if user:
        message += f" - User: {user}"
    if ip:
        message += f" - IP: {ip}"
    if details:
        message += f" - Details: {details}"
    
    security_logger.info(message)

# Utilisation
@app.server.before_request
def log_request():
    if request.endpoint and 'api' in request.endpoint:
        log_security_event(
            'API_ACCESS',
            user=getattr(current_user, 'username', None) if 'current_user' in globals() else None,
            ip=request.remote_addr,
            details=f"{request.method} {request.path}"
        )

# Détection d'attaques
suspicious_patterns = [
    r'<script',  # XSS attempts
    r'union.*select',  # SQL injection
    r'\.\./',  # Path traversal
]

@app.server.before_request
def detect_attacks():
    for pattern in suspicious_patterns:
        if re.search(pattern, request.url + str(request.data), re.IGNORECASE):
            log_security_event(
                'ATTACK_DETECTED',
                ip=request.remote_addr,
                details=f"Pattern: {pattern}"
            )
            abort(403)
```

**Démonstration pratique (15 min)**
Implémentation de mesures de sécurité dans une application Streamlit.

**Exercices guidés (10 min)**
1. Ajouter la validation d'entrée
2. Implémenter le rate limiting
3. Configurer les headers de sécurité

**QCM d'auto-évaluation (3 min)**
1. Quelle attaque prévient le CSRF ?
2. Comment limiter les requêtes ?
3. Quelle header pour XSS ?

**Devoir**
Sécuriser complètement une application web contre les attaques courantes.

---

## Cours 29 - Revue et optimisation finale
**Objectifs**
- Auditer le code et les performances
- Optimiser l'application complète
- Préparer pour la production

**Leçon (30 min - détaillée)**
Une revue finale assure la qualité avant le déploiement.

**Checklist de revue**
```python
def code_review_checklist():
    """Checklist pour la revue de code"""
    checks = {
        'security': {
            'input_validation': False,
            'auth_implemented': False,
            'https_enabled': False,
            'secrets_not_hardcoded': False
        },
        'performance': {
            'caching_implemented': False,
            'images_optimized': False,
            'lazy_loading': False,
            'database_queries_optimized': False
        },
        'usability': {
            'responsive_design': False,
            'accessibility_compliant': False,
            'error_messages_clear': False,
            'loading_states': False
        },
        'code_quality': {
            'tests_written': False,
            'documentation_complete': False,
            'code_formatted': False,
            'no_hardcoded_values': False
        }
    }
    return checks

# Outil de revue automatisé
def run_automated_review():
    """Exécute des vérifications automatiques"""
    issues = []
    
    # Vérifier les imports
    try:
        import streamlit
        import requests
    except ImportError as e:
        issues.append(f"Missing dependency: {e}")
    
    # Vérifier la structure des dossiers
    required_files = ['app.py', 'requirements.txt', 'README.md']
    for file in required_files:
        if not os.path.exists(file):
            issues.append(f"Missing file: {file}")
    
    # Vérifier les secrets
    with open('app.py', 'r') as f:
        content = f.read()
        if 'password' in content.lower() and 'os.environ' not in content:
            issues.append("Potential hardcoded password found")
    
    return issues
```

**Optimisation des performances**
```python
# Profilage de l'application
import cProfile
import pstats
from io import StringIO

def profile_app():
    """Profiler les performances de l'application"""
    pr = cProfile.Profile()
    pr.enable()
    
    # Code à profiler
    run_app_simulation()
    
    pr.disable()
    s = StringIO()
    sortby = 'cumulative'
    ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
    ps.print_stats()
    
    with open('profile_results.txt', 'w') as f:
        f.write(s.getvalue())

# Optimisation mémoire
import gc
import psutil

def memory_usage():
    """Surveiller l'usage mémoire"""
    process = psutil.Process(os.getpid())
    return process.memory_info().rss / 1024 / 1024  # MB

def optimize_memory():
    """Optimisations mémoire"""
    # Forcer le garbage collection
    gc.collect()
    
    # Utiliser des générateurs au lieu des listes
    def get_large_dataset():
        for i in range(1000000):
            yield i  # Pas de stockage en mémoire
    
    # Libérer les références inutiles
    large_variable = None
    
    print(f"Mémoire utilisée: {memory_usage():.2f} MB")

# Cache intelligent
from functools import lru_cache
import time

@lru_cache(maxsize=128)
def expensive_computation(param):
    """Fonction coûteuse avec cache"""
    time.sleep(1)  # Simulation
    return param * 2

# Cache avec expiration personnalisée
class TimedCache:
    def __init__(self, ttl_seconds=300):
        self.cache = {}
        self.ttl = ttl_seconds
    
    def get(self, key):
        if key in self.cache:
            value, timestamp = self.cache[key]
            if time.time() - timestamp < self.ttl:
                return value
            else:
                del self.cache[key]
        return None
    
    def set(self, key, value):
        self.cache[key] = (value, time.time())

cache = TimedCache(ttl_seconds=600)  # 10 minutes
```

**Tests de charge**
```python
# Tests de performance
import locust

class TaskAppUser(locust.HttpUser):
    wait_time = locust.between(1, 5)
    
    @locust.task
    def view_tasks(self):
        self.client.get("/api/tasks")
    
    @locust.task(3)  # 3x plus fréquent
    def create_task(self):
        self.client.post("/api/tasks", json={
            "title": "Test task",
            "description": "Load test task"
        })

# Exécution: locust -f load_test.py --host=http://localhost:8501

# Monitoring des métriques
def performance_metrics():
    """Collecter les métriques de performance"""
    metrics = {
        'response_time_avg': 0,
        'error_rate': 0,
        'memory_usage': memory_usage(),
        'cpu_usage': psutil.cpu_percent(),
        'active_users': 0
    }
    
    # Simulation de collecte
    return metrics

# Dashboard de monitoring
def monitoring_dashboard():
    """Interface de monitoring"""
    st.title("📊 Monitoring de Performance")
    
    # Métriques en temps réel
    col1, col2, col3 = st.columns(3)
    
    with col1:
        st.metric("Utilisation CPU", f"{psutil.cpu_percent()}%")
    
    with col2:
        st.metric("Mémoire", f"{memory_usage():.1f} MB")
    
    with col3:
        st.metric("Utilisateurs actifs", "42")
    
    # Graphiques de tendance
    # ... graphiques Plotly ...
    
    # Alertes
    if psutil.cpu_percent() > 80:
        st.error("⚠️ CPU élevé!")
    
    if memory_usage() > 500:
        st.warning("⚠️ Mémoire élevée!")
```

**Préparation production**
```python
# Configuration production
production_config = {
    'debug': False,
    'testing': False,
    'secret_key': os.environ.get('SECRET_KEY'),
    'database_url': os.environ.get('DATABASE_URL'),
    'redis_url': os.environ.get('REDIS_URL'),
    'email_config': {
        'smtp_server': os.environ.get('SMTP_SERVER'),
        'smtp_port': int(os.environ.get('SMTP_PORT', 587)),
        'username': os.environ.get('SMTP_USERNAME'),
        'password': os.environ.get('SMTP_PASSWORD')
    },
    'logging': {
        'level': 'INFO',
        'file': 'app.log',
        'max_size': 10 * 1024 * 1024,  # 10MB
        'backup_count': 5
    }
}

def setup_production():
    """Configuration pour la production"""
    # Logging
    logging.basicConfig(
        filename=production_config['logging']['file'],
        level=getattr(logging, production_config['logging']['level']),
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )
    
    # Rotation des logs
    from logging.handlers import RotatingFileHandler
    handler = RotatingFileHandler(
        production_config['logging']['file'],
        maxBytes=production_config['logging']['max_size'],
        backupCount=production_config['logging']['backup_count']
    )
    logging.getLogger().addHandler(handler)
    
    # Variables d'environnement
    required_env_vars = [
        'SECRET_KEY', 'DATABASE_URL', 'SMTP_USERNAME', 'SMTP_PASSWORD'
    ]
    
    missing_vars = [var for var in required_env_vars if not os.environ.get(var)]
    if missing_vars:
        raise EnvironmentError(f"Variables d'environnement manquantes: {missing_vars}")
    
    logging.info("Configuration production chargée avec succès")

# Health checks
@app.server.route('/health')
def health_check():
    """Endpoint de health check"""
    return {
        'status': 'healthy',
        'timestamp': datetime.utcnow().isoformat(),
        'version': '1.0.0'
    }

@app.server.route('/ready')
def readiness_check():
    """Endpoint de readiness"""
    # Vérifier la connexion DB, etc.
    try:
        # db.connection.test()
        return {'status': 'ready'}
    except:
        return {'status': 'not ready'}, 503
```

**Démonstration pratique (15 min)**
Réalisation d'une revue de code et optimisation d'une application.

**Exercices guidés (10 min)**
1. Créer une checklist de revue
2. Identifier les problèmes de performance
3. Implémenter des optimisations

**QCM d'auto-évaluation (3 min)**
1. Quelle fonction pour le profilage ?
2. Comment surveiller la mémoire ?
3. Quelle configuration pour la production ?

**Devoir**
Effectuer une revue complète et optimiser une application pour la production.

---

## Cours 30 - Soutenance module 5
**Objectifs**
- Présenter l'application complète
- Démontrer les fonctionnalités
- Répondre aux questions techniques

**Leçon (30 min - détaillée)**
La soutenance valide la maîtrise des concepts du module.

**Préparation de la soutenance**
```python
def prepare_presentation():
    """Préparer le contenu de la soutenance"""
    presentation = {
        'introduction': {
            'contexte': "Module 5 - Interfaces utilisateur modernes avec Python",
            'objectifs': "Créer une application web complète avec interface moderne",
            'démarche': "Évolution du projet Tâches avec API REST + Interface moderne"
        },
        'architecture': {
            'backend': "API REST Flask/SQLAlchemy/JWT",
            'frontend': "Streamlit/Dash pour l'interface",
            'base_donnees': "PostgreSQL avec migrations",
            'déploiement': "Docker + services cloud"
        },
        'fonctionnalités': [
            "Authentification utilisateur",
            "CRUD complet des tâches",
            "Visualisations et statistiques",
            "Interface responsive",
            "Sécurité et performance"
        ],
        'technologies': {
            'frameworks': ['Streamlit', 'Dash', 'Plotly'],
            'sécurité': ['JWT', 'Rate limiting', 'CSP'],
            'performance': ['Cache', 'Lazy loading', 'CDN'],
            'tests': ['Unit tests', 'Integration tests', 'E2E']
        }
    }
    return presentation

# Démo scriptée
def demo_script():
    """Script pour la démonstration"""
    steps = [
        {
            'action': 'Connexion',
            'description': 'Démonstration de l\'authentification',
            'points_clefs': ['JWT tokens', 'Session management', 'Sécurité']
        },
        {
            'action': 'CRUD Tâches',
            'description': 'Création, lecture, mise à jour, suppression',
            'points_clefs': ['API REST', 'Validation', 'Feedback utilisateur']
        },
        {
            'action': 'Visualisations',
            'description': 'Tableaux de bord et graphiques',
            'points_clefs': ['Plotly', 'Données temps réel', 'Interactivité']
        },
        {
            'action': 'Responsive',
            'description': 'Adaptation mobile/desktop',
            'points_clefs': ['CSS media queries', 'Composants adaptatifs']
        },
        {
            'action': 'Performance',
            'description': 'Cache et optimisations',
            'points_clefs': ['Lazy loading', 'CDN', 'Monitoring']
        }
    ]
    return steps
```

**Points de démonstration**
```python
# Application de démonstration
def demo_app():
    """Application simplifiée pour la soutenance"""
    st.title("🎯 Démo - Gestion des Tâches")
    st.markdown("---")
    
    # Sidebar de navigation
    with st.sidebar:
        st.header("Navigation Démo")
        page = st.radio("Section:", 
                       ["Accueil", "Authentification", "CRUD", "Visualisations", "Performance"])
    
    if page == "Accueil":
        st.header("Bienvenue dans la démo")
        st.write("""
        Cette application démontre les concepts appris dans le Module 5:
        - Interfaces modernes avec Python
        - Intégration API REST
        - Sécurité et performance
        - Design responsive
        """)
        
        col1, col2 = st.columns(2)
        with col1:
            st.metric("Tâches actives", "12")
            st.metric("Utilisateurs", "5")
        with col2:
            st.metric("Tâches terminées", "47")
            st.metric("Temps de réponse", "0.3s")
    
    elif page == "Authentification":
        st.header("🔐 Authentification")
        
        with st.form("login_demo"):
            username = st.text_input("Utilisateur")
            password = st.text_input("Mot de passe", type="password")
            submitted = st.form_submit_button("Se connecter")
            
            if submitted:
                if username == "demo" and password == "demo":
                    st.success("✅ Connexion réussie!")
                    st.info("**Concepts démontrés:** JWT, sessions, sécurité")
                else:
                    st.error("❌ Identifiants incorrects")
        
        st.markdown("""
        **Points techniques:**
        - Tokens JWT pour l'authentification
        - Gestion des sessions utilisateur
        - Protection CSRF
        - Rate limiting
        """)
    
    elif page == "CRUD":
        st.header("📝 Opérations CRUD")
        
        # Simulation de tâches
        if 'demo_tasks' not in st.session_state:
            st.session_state.demo_tasks = [
                {"id": 1, "title": "Apprendre Streamlit", "completed": False},
                {"id": 2, "title": "Créer API REST", "completed": True},
                {"id": 3, "title": "Déployer application", "completed": False}
            ]
        
        # Formulaire d'ajout
        with st.form("add_task_demo"):
            new_task = st.text_input("Nouvelle tâche")
            add_submitted = st.form_submit_button("Ajouter")
            
            if add_submitted and new_task:
                st.session_state.demo_tasks.append({
                    "id": len(st.session_state.demo_tasks) + 1,
                    "title": new_task,
                    "completed": False
                })
                st.success(f"✅ Tâche ajoutée: {new_task}")
                st.rerun()
        
        # Liste des tâches
        st.subheader("Liste des tâches")
        for task in st.session_state.demo_tasks:
            col1, col2, col3 = st.columns([3, 1, 1])
            with col1:
                st.write(f"{'✅' if task['completed'] else '⬜'} {task['title']}")
            with col2:
                if st.button("Terminer", key=f"complete_{task['id']}"):
                    task['completed'] = True
                    st.rerun()
            with col3:
                if st.button("Supprimer", key=f"delete_{task['id']}"):
                    st.session_state.demo_tasks.remove(task)
                    st.rerun()
        
        st.markdown("""
        **Points techniques:**
        - Endpoints REST (GET, POST, PUT, DELETE)
        - Validation des données
        - Gestion d'état
        - Feedback utilisateur
        """)
    
    elif page == "Visualisations":
        st.header("📊 Visualisations et Tableaux de bord")
        
        # Données de démonstration
        import pandas as pd
        import plotly.express as px
        
        tasks_data = pd.DataFrame({
            'Statut': ['À faire', 'En cours', 'Terminée', 'À faire', 'Terminée'],
            'Priorité': ['Haute', 'Moyenne', 'Haute', 'Basse', 'Moyenne'],
            'Temps': [2, 1, 3, 1, 2]
        })
        
        col1, col2 = st.columns(2)
        
        with col1:
            # Graphique en barres
            status_counts = tasks_data['Statut'].value_counts()
            fig1 = px.bar(status_counts, title="Tâches par statut")
            st.plotly_chart(fig1, use_container_width=True)
        
        with col2:
            # Graphique circulaire
            priority_counts = tasks_data['Priorité'].value_counts()
            fig2 = px.pie(priority_counts, title="Répartition par priorité", 
                         names=priority_counts.index, values=priority_counts.values)
            st.plotly_chart(fig2, use_container_width=True)
        
        # Métriques
        total_tasks = len(tasks_data)
        completed = len(tasks_data[tasks_data['Statut'] == 'Terminée'])
        avg_time = tasks_data['Temps'].mean()
        
        col1, col2, col3 = st.columns(3)
        with col1:
            st.metric("Total tâches", total_tasks)
        with col2:
            st.metric("Terminées", completed, f"{completed/total_tasks*100:.1f}%")
        with col3:
            st.metric("Temps moyen", f"{avg_time:.1f}h")
        
        st.markdown("""
        **Points techniques:**
        - Intégration Plotly
        - Graphiques interactifs
        - Métriques en temps réel
        - Design responsive
        """)
    
    elif page == "Performance":
        st.header("⚡ Performance et Optimisation")
        
        # Simulation de métriques
        import time
        import random
        
        col1, col2, col3 = st.columns(3)
        with col1:
            cpu = random.randint(10, 30)
            st.metric("CPU", f"{cpu}%", 
                     delta=f"{'+' if random.choice([True, False]) else '-'}{random.randint(1,5)}%")
        
        with col2:
            memory = random.randint(100, 200)
            st.metric("Mémoire", f"{memory} MB")
        
        with col3:
            response_time = round(random.uniform(0.1, 0.5), 2)
            st.metric("Temps de réponse", f"{response_time}s")
        
        # Test de performance
        if st.button("Test de charge simulé"):
            with st.spinner("Exécution du test..."):
                time.sleep(2)
                st.success("✅ Test passé! Performance optimale.")
        
        # Cache demonstration
        @st.cache_data
        def slow_computation():
            time.sleep(2)
            return "Données calculées"
        
        if st.button("Calcul avec cache"):
            start_time = time.time()
            result = slow_computation()
            end_time = time.time()
            
            if end_time - start_time < 0.1:  # Cache hit
                st.success(f"⚡ Résultat instantané: {result} (cache)")
            else:
                st.info(f"🐌 Résultat calculé: {result} ({end_time-start_time:.1f}s)")
        
        st.markdown("""
        **Points techniques:**
        - Mise en cache intelligente
        - Optimisation des requêtes
        - Monitoring en temps réel
        - Gestion des ressources
        """)

# Pied de page
st.markdown("---")
st.markdown("*Démo du Module 5 - Interfaces utilisateur modernes avec Python*")
```

**FAQ et réponses**
```python
def prepare_faq():
    """Préparer les réponses aux questions fréquentes"""
    faq = {
        'architecture': {
            'question': "Pourquoi avoir choisi Streamlit plutôt que React ?",
            'réponse': """
            Streamlit permet de créer des interfaces rapidement sans JavaScript.
            Avantages:
            - Prototypage ultra-rapide
            - Écosystème Python intégré
            - Moins de complexité pour les développeurs backend
            - Parfait pour les applications data
            """
        },
        
        'sécurité': {
            'question': "Comment sécuriser une application Streamlit ?",
            'réponse': """
            Mesures implémentées:
            - Authentification JWT
            - Validation des entrées
            - Headers de sécurité (CSP, HSTS)
            - Rate limiting
            - Audit logging
            """
        },
        
        'performance': {
            'question': "Quelles optimisations de performance ?",
            'réponse': """
            Optimisations appliquées:
            - Cache des données (@st.cache_data)
            - Lazy loading des composants
            - Pagination des listes
            - Compression des réponses
            - CDN pour les assets statiques
            """
        },
        
        'responsive': {
            'question': "Comment gérer le responsive design ?",
            'réponse': """
            Approches utilisées:
            - Media queries CSS
            - Composants adaptatifs
            - Détection de device
            - Layouts fluides
            - Optimisation mobile-first
            """
        },
        
        'déploiement': {
            'question': "Quelle stratégie de déploiement ?",
            'réponse': """
            Stratégie adoptée:
            - Conteneurisation Docker
            - Déploiement cloud (Streamlit Cloud, Railway)
            - CI/CD avec GitHub Actions
            - Monitoring et logging
            - Rollback automatique
            """
        }
    }
    return faq
```

**Démonstration pratique (15 min)**
Préparation et exécution d'une soutenance complète du module.

**Exercices guidés (10 min)**
1. Préparer le script de démonstration
2. Anticiper les questions
3. Pratiquer la présentation

**QCM d'auto-évaluation (3 min)**
1. Quel est l'objectif de la soutenance ?
2. Combien de temps pour la démo ?
3. Que faut-il préparer à l'avance ?

**Devoir**
Préparer et réaliser la soutenance complète du Module 5 avec démonstration de l'application finale.

---

**Félicitations !** 🎉

Vous venez de terminer le **Module 5** sur les **interfaces utilisateur modernes et frameworks frontend (Python)**.

**Ce que vous maîtrisez maintenant :**
- ✅ Création d'interfaces web avec Streamlit et Dash
- ✅ Intégration avec APIs REST
- ✅ Authentification et sécurité des interfaces
- ✅ Visualisations de données interactives
- ✅ Design responsive et accessibilité
- ✅ Performance et optimisation
- ✅ Tests et déploiement d'applications web

**Prochaines étapes :**
Le projet "Tâches" a maintenant une **interface utilisateur moderne et complète** qui communique avec votre API REST. Vous pouvez continuer à l'enrichir ou passer au prochain module !

**Ressources recommandées :**
- [Documentation Streamlit](https://docs.streamlit.io)
- [Documentation Dash](https://dash.plotly.com)
- [Plotly pour Python](https://plotly.com/python)
- [WebSockets en Python](https://websockets.readthedocs.io)

N'hésitez pas à continuer vos apprentissages et à créer de nouvelles applications ! 🚀
```</content>
</xai:function_callname>create_file