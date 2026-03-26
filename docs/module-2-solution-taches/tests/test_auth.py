import os
import re
import unittest
from pathlib import Path

from app import create_app


CSRF_RE = re.compile(r'name="csrf_token"\s+value="([^"]+)"')


def extract_csrf_token(html: str) -> str:
    match = CSRF_RE.search(html)
    if not match:
        raise AssertionError("Impossible de trouver le token CSRF dans la reponse HTML.")
    return match.group(1)


class AuthTests(unittest.TestCase):
    def setUp(self):
        self._root = Path(__file__).resolve().parent
        self._db_path = str(self._root / "test_tasks.sqlite")

        os.environ["DB_PATH"] = self._db_path
        os.environ["SECRET_KEY"] = "test-secret-key"
        os.environ["FLASK_DEBUG"] = "false"

        # Nettoyage rapide si un test a ete interrompu
        if os.path.exists(self._db_path):
            os.remove(self._db_path)

        self.app = create_app()
        self.app.config["TESTING"] = True
        self.client = self.app.test_client()

    def tearDown(self):
        if os.path.exists(self._db_path):
            os.remove(self._db_path)

    def test_api_public_get_tasks(self):
        res = self.client.get("/api/tasks")
        self.assertEqual(res.status_code, 200)

    def test_register_login_smoke(self):
        # Register
        res = self.client.get("/register")
        self.assertEqual(res.status_code, 200)
        csrf_token = extract_csrf_token(res.get_data(as_text=True))

        res = self.client.post(
            "/register",
            data={
                "csrf_token": csrf_token,
                "username": "alice",
                "password": "MotDePasse123",
            },
            follow_redirects=False,
        )
        self.assertEqual(res.status_code, 302)  # redirect vers /login

        # Login
        res = self.client.get("/login?next=/")
        self.assertEqual(res.status_code, 200)
        csrf_token = extract_csrf_token(res.get_data(as_text=True))

        res = self.client.post(
            "/login",
            data={
                "csrf_token": csrf_token,
                "next": "/",
                "username": "alice",
                "password": "MotDePasse123",
            },
            follow_redirects=False,
        )
        self.assertEqual(res.status_code, 302)

        # Session active => page index contient le bouton/logout
        res = self.client.get("/")
        body = res.get_data(as_text=True)
        self.assertIn("Bonjour", body)
        self.assertIn("alice", body)

    def test_csrf_rejected_on_login(self):
        res = self.client.get("/login")
        self.assertEqual(res.status_code, 200)
        csrf_token = extract_csrf_token(res.get_data(as_text=True))
        _ = csrf_token

        res = self.client.post(
            "/login",
            data={
                "csrf_token": "bad-token",
                "username": "bob",
                "password": "whatever123",
                "next": "/",
            },
            follow_redirects=False,
        )
        self.assertEqual(res.status_code, 400)

    def test_protected_add_redirects_to_login(self):
        # Sans login, la route add doit rediriger vers /login.
        res = self.client.post("/add", data={"titre": "Test"})
        self.assertEqual(res.status_code, 302)
        self.assertIn("/login", res.headers.get("Location", ""))


if __name__ == "__main__":
    unittest.main()

