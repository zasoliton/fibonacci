from functools import lru_cache
from typing import Dict

from fastapi import FastAPI

app = FastAPI()


@lru_cache
def fibonacci(n: int) -> int:
    if n in {0, 1}:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)


@app.get("/")
async def root() -> Dict[str, str]:
    return {"message": "Welcome to Fibonacci service"}


@app.get("/fib/{num}")
async def fib(num: int):
    return {"result": fibonacci(num)}
