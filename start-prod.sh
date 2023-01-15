#!/bin/bash

ENV_FILE=.env

if [ ! -f "./$ENV_FILE" ]; then
    echo "----------------------------------";
    echo "Error - .env file is required";
    echo "------------------";
    exit 1;
fi

FILE_ARGS=(-f docker-compose.yml -f docker-compose.prod.yml);
DOCKER_BUILDKIT=1 docker compose "${FILE_ARGS[@]}" build --parallel || exit;
docker compose "${FILE_ARGS[@]}" --env-file "${ENV_FILE}" up;
