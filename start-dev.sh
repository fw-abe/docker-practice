#!/bin/bash

set -x;

ENV_FILE=.env

DOCKER_BUILDKIT=1 docker compose build --parallel || exit;
docker compose --env-file "${ENV_FILE}" up;
