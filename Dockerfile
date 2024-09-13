# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.11.4
FROM python:${PYTHON_VERSION}-slim AS base
# Python docker images: https://github.com/docker-library/docs/tree/master/python/

USER root

# Copy the src
WORKDIR /app
COPY src/ /app/src/
COPY ./requirements.txt /app
RUN pwd && ls -la /app

# Install python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r /app/requirements.txt
RUN pip3 list --format=columns

USER 1001

# EXPOSE 5001
ENTRYPOINT ["python3", "/app/src/app.py"]