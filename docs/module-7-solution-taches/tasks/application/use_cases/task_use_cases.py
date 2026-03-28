"""Use cases for task management."""

from typing import List
from uuid import UUID

from tasks.domain.entities.task import Task
from tasks.domain.repositories.task_repository import TaskRepository


class CreateTaskUseCase:
    """Use case for creating a new task."""

    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository

    async def execute(
        self,
        title: str,
        description: str | None,
        user_id: UUID,
    ) -> Task:
        """Execute the use case."""
        task = Task.create(title, description, user_id)
        await self.task_repository.save(task)
        return task


class GetTasksUseCase:
    """Use case for retrieving user tasks."""

    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository

    async def execute(self, user_id: UUID) -> List[Task]:
        """Execute the use case."""
        return await self.task_repository.find_by_user_id(user_id)


class UpdateTaskUseCase:
    """Use case for updating a task."""

    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository

    async def execute(
        self,
        task_id: UUID,
        title: str | None = None,
        description: str | None = None,
        completed: bool | None = None,
    ) -> Task | None:
        """Execute the use case."""
        task = await self.task_repository.find_by_id(task_id)
        if not task:
            return None

        updated_task = task.update(title, description, completed)
        await self.task_repository.save(updated_task)
        return updated_task


class DeleteTaskUseCase:
    """Use case for deleting a task."""

    def __init__(self, task_repository: TaskRepository):
        self.task_repository = task_repository

    async def execute(self, task_id: UUID) -> bool:
        """Execute the use case."""
        task = await self.task_repository.find_by_id(task_id)
        if not task:
            return False

        await self.task_repository.delete(task_id)
        return True