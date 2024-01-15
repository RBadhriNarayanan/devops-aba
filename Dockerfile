FROM python:3.9-slim-bullseye
WORKDIR ./app
COPY . /app/
CMD ["python3", "sample.py"]
