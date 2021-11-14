FROM python:3.9-slim AS base
WORKDIR /code
COPY ./requirements/requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app

FROM base AS dev
COPY ./requirements/requirements_test.txt /code/requirements_test.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements_test.txt
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]

FROM base AS prod
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
