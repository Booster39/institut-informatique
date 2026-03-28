"""Redis cache adapter for performance optimization."""

import aioredis
import json
from typing import Any

from tasks.config.settings import REDIS_URL


class RedisCache:
    """Simple Redis cache layer."""

    def __init__(self, redis_url: str = REDIS_URL):
        self.redis_url = redis_url
        self.redis: aioredis.Redis | None = None

    async def connect(self) -> None:
        self.redis = await aioredis.from_url(self.redis_url)

    async def close(self) -> None:
        if self.redis is not None:
            await self.redis.close()

    async def get(self, key: str) -> Any | None:
        if self.redis is None:
            raise RuntimeError("Redis client not connected")

        value = await self.redis.get(key)
        if value is None:
            return None

        return json.loads(value)

    async def set(self, key: str, value: Any, ttl: int = 60) -> None:
        if self.redis is None:
            raise RuntimeError("Redis client not connected")

        await self.redis.set(key, json.dumps(value), ex=ttl)

    async def invalidate(self, key: str) -> None:
        if self.redis is None:
            raise RuntimeError("Redis client not connected")

        await self.redis.delete(key)
