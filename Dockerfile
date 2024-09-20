FROM python:3.10-slim as requirements-stage
WORKDIR /tmp
RUN pip install poetry
COPY poetry.lock pyproject.toml /tmp/
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes
FROM python:3.10-slim
WORKDIR /app
COPY --from=requirements-stage /tmp/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
COPY src/ /app/src/
COPY images/ /app/images/
CMD ["python3", "src/main.py"]


