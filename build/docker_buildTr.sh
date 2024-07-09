#!/usr/bin/env bash
set -e
set -x

docker build \
  --platform linux/arm64/v8 \
  --pull \
  --tag point2cadtr \
  -f DockerfileTr \
  .
