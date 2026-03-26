# Taches - Flask + SQLite (API GET uniquement)

Un mini-projet propre et didactique pour le **Module 1**.

## Fonctionnalites
- Page web : lister, creer, supprimer, basculer "terminee"
- Filtre "toutes / terminees / en cours"
- API JSON **GET uniquement** : `GET /api/tasks`

## Prerequis
- Python
- Package `flask`

## Installation
Dans ce dossier :
```bash
pip install flask
```

## Variables d'environnement (optionnel)
`DB_PATH` : chemin du fichier SQLite.

Exemple :
```env
DB_PATH=./data/tasks.sqlite
FLASK_DEBUG=true
```

## Lancer l'application
```bash
python app.py
```

Ouvre :
- `http://127.0.0.1:5000/`
- `http://127.0.0.1:5000/api/tasks`

## Structure des fichiers
- `app.py` : point d'entree
- `routes.py` : toutes les routes web + API GET
- `db.py` : initialisation SQLite + CRUD
- `templates/` : Jinja2
- `static/` : CSS + petit script JS

