from __future__ import annotations

import logging

from flask import Flask
from raven.contrib.flask import Sentry

from tasks.config.config import Config
from tasks.presentation.api.app import create_app


def init_app() -> Flask:
    app = create_app()

    # Sentry integration
    sentry_dsn = Config.SENTRY_DSN if hasattr(Config, "SENTRY_DSN") else None
    if sentry_dsn:
        sentry = Sentry(app, dsn=sentry_dsn)

    logger = logging.getLogger("tasks")
    logger.setLevel(logging.INFO)

    return app
