from __future__ import annotations

import pytest
from uuid import uuid4

from tasks.domain.entities.task import Task


def test_task_create():
    user_id = uuid4()
    task = Task.create("Write tests", "Write complete pytest coverage", user_id)

    assert task.title == "Write tests"
    assert task.description == "Write complete pytest coverage"
    assert task.completed is False
    assert task.user_id == user_id


def test_task_update():
    user_id = uuid4()
    task = Task.create("Refactor code", "Refactor tasks module", user_id)

    updated = task.update(description="Refactor with Clean Architecture", completed=True)
    assert updated.description == "Refactor with Clean Architecture"
    assert updated.completed is True
