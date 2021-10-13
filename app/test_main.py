from fastapi.testclient import TestClient

from .main import app

client = TestClient(app)


def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Welcome to Fibonacci service"}


def test_read_fib_case_1():
    response = client.get("/fib/0")
    assert response.status_code == 200
    assert response.json() == {"result": 0}


def test_read_fib_case_2():
    response = client.get("/fib/1")
    assert response.status_code == 200
    assert response.json() == {"result": 1}


def test_read_fib_case_3():
    response = client.get("/fib/10")
    assert response.status_code == 200
    assert response.json() == {"result": 55}
