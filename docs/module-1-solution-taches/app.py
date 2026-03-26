import os

from flask import Flask

from routes import init_routes


def create_app() -> Flask:
    app = Flask(__name__)
    init_routes(app)
    return app


if __name__ == "__main__":
    flask_debug = os.getenv("FLASK_DEBUG", "false").lower() in {"1", "true", "yes", "y"}
    app = create_app()
    app.run(host="127.0.0.1", port=5000, debug=flask_debug)

