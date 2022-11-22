from functools import lru_cache

from fastapi import FastAPI

app = FastAPI()


@lru_cache
def fibonacci(n):
    if n in {0, 1}:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)


@app.get("/")
async def root():
    return {"message": "Welcome to Fibonacci service"}


@app.get("/fib/{num}")
async def fib(num: int):
    return {"result": fibonacci(num)}
