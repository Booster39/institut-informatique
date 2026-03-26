from __future__ import annotations

from flask import abort, jsonify, redirect, render_template, request, url_for

from db import create_task, delete_task, get_task, init_db, list_tasks, toggle_task, update_task, validate_title


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


def init_routes(app) -> None:
    init_db()

    @app.errorhandler(404)
    def not_found(_e):
        return render_template("error_404.html"), 404

    @app.route("/", methods=["GET"])
    def index():
        done = _parse_done_param(request.args.get("done"))
        tasks = list_tasks(done=done)
        done_param = request.args.get("done", "all")
        return render_template("tasks.html", tasks=tasks, done_param=done_param)

    @app.route("/add", methods=["GET", "POST"])
    def add():
        if request.method == "GET":
            return render_template("add_task.html", error=None)

        titre = request.form.get("titre", "")
        echeance = request.form.get("echeance", "")

        try:
            # validate_title leve ValueError si invalide
            validate_title(titre)
        except ValueError as e:
            return render_template("add_task.html", error=str(e)), 400

        # create_task refait la validation et insere en base
        create_task(titre, echeance)
        return redirect(url_for("index"))

    @app.route("/toggle/<int:task_id>", methods=["POST"])
    def toggle(task_id: int):
        toggle_task(task_id)
        return redirect(url_for("index"))

    @app.route("/delete/<int:task_id>", methods=["POST"])
    def delete(task_id: int):
        delete_task(task_id)
        return redirect(url_for("index"))

    @app.route("/edit/<int:task_id>", methods=["GET", "POST"])
    def edit(task_id: int):
        task = get_task(task_id)
        if task is None:
            abort(404)

        if request.method == "GET":
            return render_template("edit_task.html", task=task, error=None)

        titre = request.form.get("titre", "")
        echeance = request.form.get("echeance", "")

        try:
            # validation + mise a jour
            update_task(task_id, titre, echeance)
        except ValueError as e:
            return render_template("edit_task.html", task=task, error=str(e)), 400

        return redirect(url_for("index"))

    # API JSON GET uniquement (le filtre done est optionnel)
    @app.route("/api/tasks", methods=["GET"])
    def api_tasks():
        done = _parse_done_param(request.args.get("done"))
        tasks = list_tasks(done=done)
        return jsonify(tasks)

