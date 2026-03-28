"""APIMODEL schemas for request and response validation."""

from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, EmailStr, Field


class TaskCreateSchema(BaseModel):
    title: str = Field(..., min_length=1, max_length=255)
    description: str | None = Field(None, max_length=1000)


class TaskResponseSchema(BaseModel):
    id: UUID
    title: str
    description: str | None
    completed: bool
    created_at: datetime
    updated_at: datetime
    user_id: UUID


class UserCreateSchema(BaseModel):
    username: str = Field(..., min_length=3, max_length=50)
    email: EmailStr


class UserResponseSchema(BaseModel):
    id: UUID
    username: str
    email: EmailStr
    created_at: datetime