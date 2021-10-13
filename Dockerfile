FROM python:3.9-slim AS prod
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

FROM prod AS dev
COPY ./requirements_test.txt /code/requirements_test.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements_test.txt
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
