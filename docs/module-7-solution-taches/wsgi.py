"""Entry point for launching the fast Flask application."""

from tasks.presentation.api.app import create_app

app = create_app()
