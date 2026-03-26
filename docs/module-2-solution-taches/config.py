import os


def get_secret_key() -> str:
    # Pour un vrai projet prod, tu mettras SECRET_KEY dans une vraie variable d'environnement.
    # Par défaut, on garde une valeur “debug-friendly” pour que le module tourne en local.
    return os.getenv("SECRET_KEY", "dev-change-me")


def get_db_path() -> str:
    return os.getenv("DB_PATH", "./data/tasks.sqlite")

