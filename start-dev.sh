#!/bin/bash

ENV_FILE=.env

if [ ! -f "./$ENV_FILE" ]; then
    echo "----------------------------------";
    echo "Error - .env file is required";
    echo "------------------";
    exit 1;
fi

DOCKER_BUILDKIT=1 docker compose build --parallel || exit;
docker compose --env-file "${ENV_FILE}" up;
