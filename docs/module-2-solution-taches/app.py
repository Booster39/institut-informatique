import os

from flask import Flask

from config import get_db_path, get_secret_key
from routes import init_routes


def create_app() -> Flask:
    app = Flask(__name__)

    # Sessions Flask : SECRET_KEY obligatoire.
    app.config["SECRET_KEY"] = get_secret_key()
    app.config["SESSION_COOKIE_HTTPONLY"] = True
    app.config["SESSION_COOKIE_SAMESITE"] = "Lax"

    init_routes(app)
    return app


if __name__ == "__main__":
    flask_debug = os.getenv("FLASK_DEBUG", "false").lower() in {"1", "true", "yes", "y"}
    _ = get_db_path()  # force la lecture env pour un feedback clair
    app = create_app()
    app.run(host="127.0.0.1", port=5000, debug=flask_debug)

