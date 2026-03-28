"""Repository interfaces for domain layer."""

from abc import ABC, abstractmethod
from typing import List, Optional
from uuid import UUID

from tasks.domain.entities.task import Task, User


class TaskRepository(ABC):
    """Abstract repository for Task entities."""

    @abstractmethod
    async def save(self, task: Task) -> None:
        """Save a task."""
        pass

    @abstractmethod
    async def find_by_id(self, task_id: UUID) -> Optional[Task]:
        """Find a task by ID."""
        pass

    @abstractmethod
    async def find_by_user_id(self, user_id: UUID) -> List[Task]:
        """Find all tasks for a user."""
        pass

    @abstractmethod
    async def delete(self, task_id: UUID) -> None:
        """Delete a task by ID."""
        pass


class UserRepository(ABC):
    """Abstract repository for User entities."""

    @abstractmethod
    async def save(self, user: User) -> None:
        """Save a user."""
        pass

    @abstractmethod
    async def find_by_id(self, user_id: UUID) -> Optional[User]:
        """Find a user by ID."""
        pass

    @abstractmethod
    async def find_by_username(self, username: str) -> Optional[User]:
        """Find a user by username."""
        pass