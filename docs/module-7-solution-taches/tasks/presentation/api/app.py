"""Main Flask application based on Clean Architecture."""

from __future__ import annotations

import logging
from uuid import UUID

from flask import Flask, jsonify, request
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity
from flask_cors import CORS
from sqlalchemy.ext.asyncio import AsyncSession

from tasks.application.use_cases.task_use_cases import (
    CreateTaskUseCase,
    GetTasksUseCase,
    UpdateTaskUseCase,
    DeleteTaskUseCase,
)
from tasks.config.settings import JWT_SECRET_KEY, get_session
from tasks.domain.entities.task import User
from tasks.domain.repositories.task_repository import TaskRepository
from tasks.infrastructure.models import Base
from tasks.infrastructure.repositories.sqlalchemy_repository import (
    SQLAlchemyTaskRepository,
    SQLAlchemyUserRepository,
)
from tasks.presentation.schemas.schemas import TaskCreateSchema, TaskResponseSchema, UserCreateSchema, UserResponseSchema


def create_app() -> Flask:
    app = Flask(__name__)
    app.config["JWT_SECRET_KEY"] = JWT_SECRET_KEY

    CORS(app)
    JWTManager(app)

    # Logging
    logging.basicConfig(level=logging.INFO)

    @app.route("/health", methods=["GET"])
    def health() -> tuple[dict, int]:
        return {"status": "ok"}, 200

    @app.route("/register", methods=["POST"])
    async def register() -> tuple[dict, int]:
        data = request.get_json() or {}
        request_model = UserCreateSchema(**data)

        async for session in get_session():
            user_repo = SQLAlchemyUserRepository(session)
            existing_user = await user_repo.find_by_username(request_model.username)
            if existing_user:
                return {"message": "Username already exists"}, 409

            user = User.create(request_model.username, request_model.email)
            await user_repo.save(user)
            return UserResponseSchema.from_orm(user).dict(), 201

    @app.route("/login", methods=["POST"])
    async def login() -> tuple[dict, int]:
        data = request.get_json() or {}
        request_model = UserCreateSchema(**data)

        async for session in get_session():
            user_repo = SQLAlchemyUserRepository(session)
            user = await user_repo.find_by_username(request_model.username)
            if not user:
                return {"message": "Invalid credentials"}, 401

            access_token = create_access_token(identity=str(user.id))
            return {"access_token": access_token}, 200

    @app.route("/tasks", methods=["GET"])
    @jwt_required()
    async def get_tasks() -> tuple[list[dict], int]:
        current_user_id = UUID(get_jwt_identity())

        async for session in get_session():
            repository = SQLAlchemyTaskRepository(session)
            use_case = GetTasksUseCase(repository)
            tasks = await use_case.execute(current_user_id)
            response = [TaskResponseSchema.from_orm(task).dict() for task in tasks]
            return jsonify(response), 200

    @app.route("/tasks", methods=["POST"])
    @jwt_required()
    async def create_task() -> tuple[dict, int]:
        current_user_id = UUID(get_jwt_identity())
        data = request.get_json() or {}
        request_model = TaskCreateSchema(**data)

        async for session in get_session():
            repository = SQLAlchemyTaskRepository(session)
            use_case = CreateTaskUseCase(repository)
            task = await use_case.execute(request_model.title, request_model.description, current_user_id)
            return TaskResponseSchema.from_orm(task).dict(), 201

    @app.route("/tasks/<task_id>", methods=["PUT"])
    @jwt_required()
    async def update_task(task_id: str) -> tuple[dict, int]:
        current_user_id = UUID(get_jwt_identity())
        data = request.get_json() or {}

        async for session in get_session():
            repository = SQLAlchemyTaskRepository(session)
            existing_task = await repository.find_by_id(UUID(task_id))
            if not existing_task or existing_task.user_id != current_user_id:
                return {"message": "Task not found"}, 404

            use_case = UpdateTaskUseCase(repository)
            updated_task = await use_case.execute(
                UUID(task_id),
                data.get("title"),
                data.get("description"),
                data.get("completed"),
            )
            if not updated_task:
                return {"message": "Task not found"}, 404

            return TaskResponseSchema.from_orm(updated_task).dict(), 200

    @app.route("/tasks/<task_id>", methods=["DELETE"])
    @jwt_required()
    async def delete_task(task_id: str) -> tuple[dict, int]:
        current_user_id = UUID(get_jwt_identity())

        async for session in get_session():
            repository = SQLAlchemyTaskRepository(session)
            existing_task = await repository.find_by_id(UUID(task_id))
            if not existing_task or existing_task.user_id != current_user_id:
                return {"message": "Task not found"}, 404

            use_case = DeleteTaskUseCase(repository)
            await use_case.execute(UUID(task_id))
            return {"message": "Task deleted"}, 204

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0", port=8000, debug=False)