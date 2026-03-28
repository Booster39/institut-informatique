from __future__ import annotations

import pytest
from uuid import uuid4

from tasks.domain.entities.task import Task
from tasks.infrastructure.repositories.sqlalchemy_repository import SQLAlchemyTaskRepository
from tasks.config.settings import AsyncSessionLocal


@pytest.mark.asyncio
async def test_create_get_delete_task():
    async with AsyncSessionLocal() as session:
        repository = SQLAlchemyTaskRepository(session)

        user_id = uuid4()
        task = Task.create("Test DB", "Integration test for repository", user_id)

        await repository.save(task)
        fetched = await repository.find_by_id(task.id)

        assert fetched is not None
        assert fetched.id == task.id

        tasks_by_user = await repository.find_by_user_id(user_id)
        assert len(tasks_by_user) > 0

        await repository.delete(task.id)
        deleted = await repository.find_by_id(task.id)
        assert deleted is None
