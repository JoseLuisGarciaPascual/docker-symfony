#!/usr/bin/env bash
docker-compose stop
wait
docker-compose rm -f
wait
docker-compose up -d