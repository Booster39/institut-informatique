"""Domain entities for the Tasks application."""

from dataclasses import dataclass
from datetime import datetime
from typing import Optional
from uuid import UUID, uuid4


@dataclass(frozen=True)
class Task:
    """Task domain entity."""

    id: UUID
    title: str
    description: Optional[str]
    completed: bool
    created_at: datetime
    updated_at: datetime
    user_id: UUID

    @classmethod
    def create(
        cls,
        title: str,
        description: Optional[str],
        user_id: UUID,
    ) -> "Task":
        """Create a new task."""
        now = datetime.utcnow()
        return cls(
            id=uuid4(),
            title=title,
            description=description,
            completed=False,
            created_at=now,
            updated_at=now,
            user_id=user_id,
        )

    def update(
        self,
        title: Optional[str] = None,
        description: Optional[str] = None,
        completed: Optional[bool] = None,
    ) -> "Task":
        """Update task with new values."""
        return Task(
            id=self.id,
            title=title if title is not None else self.title,
            description=description if description is not None else self.description,
            completed=completed if completed is not None else self.completed,
            created_at=self.created_at,
            updated_at=datetime.utcnow(),
            user_id=self.user_id,
        )


@dataclass(frozen=True)
class User:
    """User domain entity."""

    id: UUID
    username: str
    email: str
    created_at: datetime

    @classmethod
    def create(cls, username: str, email: str) -> "User":
        """Create a new user."""
        return cls(
            id=uuid4(),
            username=username,
            email=email,
            created_at=datetime.utcnow(),
        )