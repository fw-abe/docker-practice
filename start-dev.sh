#!/bin/bash

set -x;
DOCKER_BUILDKIT=1 docker compose build --parallel || exit;
docker-compose up;
