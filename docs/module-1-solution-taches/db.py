import os
import sqlite3
from typing import Any


def get_db_path() -> str:
    return os.getenv("DB_PATH", "./data/tasks.sqlite")


def _ensure_db_dir(db_path: str) -> None:
    directory = os.path.dirname(db_path)
    if directory:
        os.makedirs(directory, exist_ok=True)


def get_conn() -> sqlite3.Connection:
    db_path = get_db_path()
    _ensure_db_dir(db_path)

    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn


def init_db() -> None:
    with get_conn() as conn:
        conn.execute(
            """
            CREATE TABLE IF NOT EXISTS tasks (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                titre TEXT NOT NULL,
                terminee INTEGER NOT NULL DEFAULT 0,
                echeance TEXT,
                created_at TEXT NOT NULL
            );
            """
        )
        conn.commit()


def _row_to_task(row: sqlite3.Row) -> dict[str, Any]:
    return {
        "id": int(row["id"]),
        "titre": row["titre"],
        "terminee": bool(row["terminee"]),
        "echeance": row["echeance"],
        "created_at": row["created_at"],
    }


def validate_title(titre: str) -> str:
    titre = (titre or "").strip()
    if not (3 <= len(titre) <= 60):
        raise ValueError("Le titre doit contenir entre 3 et 60 caracteres.")
    return titre


def create_task(titre: str, echeance: str | None = None) -> int:
    titre = validate_title(titre)
    echeance = (echeance or "").strip() or None

    # created_at en texte pour garder SQLite simple (pas de conversion de type)
    # (ISO date) : 2026-03-26 12:34:56
    import datetime

    created_at = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    with get_conn() as conn:
        cur = conn.execute(
            """
            INSERT INTO tasks (titre, terminee, echeance, created_at)
            VALUES (?, 0, ?, ?)
            """,
            (titre, echeance, created_at),
        )
        conn.commit()
        return int(cur.lastrowid)


def list_tasks(done: bool | None = None) -> list[dict[str, Any]]:
    with get_conn() as conn:
        if done is None:
            rows = conn.execute(
                "SELECT * FROM tasks ORDER BY id DESC"
            ).fetchall()
        else:
            terminee_val = 1 if done else 0
            rows = conn.execute(
                "SELECT * FROM tasks WHERE terminee = ? ORDER BY id DESC",
                (terminee_val,),
            ).fetchall()

        return [_row_to_task(row) for row in rows]


def get_task(task_id: int) -> dict[str, Any] | None:
    with get_conn() as conn:
        row = conn.execute(
            "SELECT * FROM tasks WHERE id = ?",
            (task_id,),
        ).fetchone()
        if row is None:
            return None
        return _row_to_task(row)


def delete_task(task_id: int) -> None:
    with get_conn() as conn:
        conn.execute("DELETE FROM tasks WHERE id = ?", (task_id,))
        conn.commit()


def toggle_task(task_id: int) -> None:
    # On bascule terminee (0 <-> 1) sur la tache (si elle existe).
    with get_conn() as conn:
        conn.execute(
            """
            UPDATE tasks
            SET terminee = CASE WHEN terminee = 1 THEN 0 ELSE 1 END
            WHERE id = ?
            """,
            (task_id,),
        )
        conn.commit()


def update_task(task_id: int, titre: str, echeance: str | None = None) -> None:
    titre = validate_title(titre)
    echeance = (echeance or "").strip() or None

    with get_conn() as conn:
        conn.execute(
            """
            UPDATE tasks
            SET titre = ?, echeance = ?
            WHERE id = ?
            """,
            (titre, echeance, task_id),
        )
        conn.commit()

