"""Infrastructure implementation for repositories using SQLAlchemy."""

from __future__ import annotations

from typing import List, Optional
from uuid import UUID

from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

from tasks.domain.entities.task import Task as DomainTask
from tasks.domain.entities.task import User as DomainUser
from tasks.domain.repositories.task_repository import TaskRepository
from tasks.infrastructure.models import Task as DBTask, User as DBUser


class SQLAlchemyTaskRepository(TaskRepository):
    """SQLAlchemy implementation of TaskRepository."""

    def __init__(self, session: AsyncSession):
        self.session = session

    async def save(self, task: DomainTask) -> None:
        db_task = DBTask(
            id=task.id,
            title=task.title,
            description=task.description,
            completed=task.completed,
            created_at=task.created_at,
            updated_at=task.updated_at,
            user_id=task.user_id,
        )
        self.session.add(db_task)
        await self.session.commit()

    async def find_by_id(self, task_id: UUID) -> Optional[DomainTask]:
        statement = select(DBTask).filter_by(id=task_id)
        result = await self.session.execute(statement)
        db_task = result.scalar_one_or_none()
        if not db_task:
            return None
        return DomainTask(
            id=db_task.id,
            title=db_task.title,
            description=db_task.description,
            completed=db_task.completed,
            created_at=db_task.created_at,
            updated_at=db_task.updated_at,
            user_id=db_task.user_id,
        )

    async def find_by_user_id(self, user_id: UUID) -> List[DomainTask]:
        statement = select(DBTask).filter_by(user_id=user_id)
        result = await self.session.execute(statement)
        tasks = result.scalars().all()
        return [
            DomainTask(
                id=t.id,
                title=t.title,
                description=t.description,
                completed=t.completed,
                created_at=t.created_at,
                updated_at=t.updated_at,
                user_id=t.user_id,
            )
            for t in tasks
        ]

    async def delete(self, task_id: UUID) -> None:
        statement = select(DBTask).filter_by(id=task_id)
        result = await self.session.execute(statement)
        db_task = result.scalar_one_or_none()
        if db_task:
            await self.session.delete(db_task)
            await self.session.commit()


class SQLAlchemyUserRepository(UserRepository):
    """SQLAlchemy implementation of UserRepository."""

    def __init__(self, session: AsyncSession):
        self.session = session

    async def save(self, user: DomainUser) -> None:
        db_user = DBUser(
            id=user.id,
            username=user.username,
            email=user.email,
            created_at=user.created_at,
        )
        self.session.add(db_user)
        await self.session.commit()

    async def find_by_id(self, user_id: UUID) -> Optional[DomainUser]:
        statement = select(DBUser).filter_by(id=user_id)
        result = await self.session.execute(statement)
        db_user = result.scalar_one_or_none()
        if not db_user:
            return None
        return DomainUser(
            id=db_user.id,
            username=db_user.username,
            email=db_user.email,
            created_at=db_user.created_at,
        )

    async def find_by_username(self, username: str) -> Optional[DomainUser]:
        statement = select(DBUser).filter_by(username=username)
        result = await self.session.execute(statement)
        db_user = result.scalar_one_or_none()
        if not db_user:
            return None
        return DomainUser(
            id=db_user.id,
            username=db_user.username,
            email=db_user.email,
            created_at=db_user.created_at,
        )