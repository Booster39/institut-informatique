from __future__ import annotations

import secrets
from functools import wraps

from flask import abort, flash, jsonify, redirect, render_template, request, session, url_for

from db import create_task, create_user, delete_task, get_task, get_user_by_username, init_db, list_tasks, toggle_task, update_task, validate_title, validate_username
from security import hash_password, verify_password


def _ensure_csrf_token() -> str:
    token = session.get("csrf_token")
    if not token:
        token = secrets.token_urlsafe(32)
        session["csrf_token"] = token
    return token


def _csrf_valid(form_token: str | None) -> bool:
    if not form_token:
        return False
    return form_token == session.get("csrf_token")


def csrf_protect_post() -> None:
    # Protection : pour tous les POST du projet, on exige un token CSRF.
    # (Didactique : tu peux ensuite étendre/raffiner selon le besoin.)
    if request.method != "POST":
        return
    token = request.form.get("csrf_token")
    if not _csrf_valid(token):
        abort(400, description="CSRF token invalide.")


def _parse_done_param(raw: str | None) -> bool | None:
    if raw is None:
        return None
    value = raw.strip().lower()
    if value in {"all", ""}:
        return None
    if value in {"true", "1", "done", "terminee"}:
        return True
    if value in {"false", "0", "en_cours", "encours"}:
        return False
    return None


def login_required(view_func):
    @wraps(view_func)
    def wrapped(*args, **kwargs):
        if not session.get("user_id"):
            # next permet de revenir a la page demandee apres login
            next_url = request.path
            return redirect(url_for("login", next=next_url))
        return view_func(*args, **kwargs)

    return wrapped


def init_routes(app) -> None:
    init_db()

    @app.context_processor
    def inject_csrf_token():
        return {"csrf_token": _ensure_csrf_token()}

    @app.errorhandler(400)
    def bad_request(e):
        # En didactique, on garde un message simple.
        return render_template("error_400.html", message=getattr(e, "description", None) or "Requete invalide."), 400

    @app.errorhandler(404)
    def not_found(_e):
        return render_template("error_404.html"), 404

    @app.route("/", methods=["GET"])
    def index():
        done = _parse_done_param(request.args.get("done"))
        tasks = list_tasks(done=done)
        done_param = request.args.get("done", "all")
        return render_template("tasks.html", tasks=tasks, done_param=done_param)

    @app.route("/register", methods=["GET", "POST"])
    def register():
        if request.method == "GET":
            return render_template("register.html", error=None)

        csrf_protect_post()

        username = request.form.get("username", "")
        password = request.form.get("password", "")

        try:
            validate_username(username)
            password = (password or "").strip()
            if len(password) < 8:
                raise ValueError("Mot de passe doit contenir au moins 8 caracteres.")
            if any(c.isspace() for c in password):
                raise ValueError("Mot de passe ne doit pas contenir d'espace.")

            existing = get_user_by_username(username)
            if existing is not None:
                raise ValueError("Ce username existe deja.")

            password_hash = hash_password(password)
            create_user(username, password_hash)
        except ValueError as e:
            return render_template("register.html", error=str(e)), 400

        flash("Compte cree. Tu peux te connecter.", "success")
        return redirect(url_for("login"))

    @app.route("/login", methods=["GET", "POST"])
    def login():
        if request.method == "GET":
            next_url = request.args.get("next", "/")
            return render_template("login.html", error=None, next_url=next_url)

        csrf_protect_post()

        username = request.form.get("username", "")
        password = request.form.get("password", "")

        # On evite de reveler si username existe : message identique.
        error_msg = "Identifiants invalides."
        user = get_user_by_username(username)
        if user is None or not verify_password(password, user["password_hash"]):
            return render_template("login.html", error=error_msg, next_url=request.form.get("next", "/")), 401

        session.clear()
        session["user_id"] = user["id"]
        session["username"] = user["username"]

        next_url = request.form.get("next", "/")
        return redirect(next_url or "/")

    @app.route("/logout", methods=["POST"])
    def logout():
        csrf_protect_post()
        session.clear()
        flash("Deconnexion effectuee.", "success")
        return redirect(url_for("login"))

    @app.route("/profile", methods=["GET"])
    def profile():
        if not session.get("user_id"):
            return redirect(url_for("login"))
        return render_template("profile.html", username=session.get("username"))

    @app.route("/add", methods=["GET", "POST"])
    @login_required
    def add():
        if request.method == "GET":
            return render_template("add_task.html", error=None)

        csrf_protect_post()

        titre = request.form.get("titre", "")
        echeance = request.form.get("echeance", "")
        try:
            validate_title(titre)
            create_task(titre, echeance)
        except ValueError as e:
            return render_template("add_task.html", error=str(e)), 400

        flash("Tache ajoutee.", "success")
        return redirect(url_for("index"))

    @app.route("/toggle/<int:task_id>", methods=["POST"])
    @login_required
    def toggle(task_id: int):
        csrf_protect_post()
        toggle_task(task_id)
        flash("Etat mis a jour.", "success")
        return redirect(url_for("index"))

    @app.route("/delete/<int:task_id>", methods=["POST"])
    @login_required
    def delete(task_id: int):
        csrf_protect_post()
        delete_task(task_id)
        flash("Tache supprimee.", "success")
        return redirect(url_for("index"))

    @app.route("/edit/<int:task_id>", methods=["GET", "POST"])
    @login_required
    def edit(task_id: int):
        if request.method == "GET":
            task = get_task(task_id)
            if task is None:
                abort(404)
            return render_template("edit_task.html", task=task, error=None)

        csrf_protect_post()

        task = get_task(task_id)
        if task is None:
            abort(404)

        titre = request.form.get("titre", "")
        echeance = request.form.get("echeance", "")
        try:
            update_task(task_id, titre, echeance)
        except ValueError as e:
            return render_template("edit_task.html", task=task, error=str(e)), 400

        flash("Tache mise a jour.", "success")
        return redirect(url_for("index"))

    # API JSON GET uniquement (publique)
    @app.route("/api/tasks", methods=["GET"])
    def api_tasks():
        done = _parse_done_param(request.args.get("done"))
        tasks = list_tasks(done=done)
        return jsonify(tasks)

