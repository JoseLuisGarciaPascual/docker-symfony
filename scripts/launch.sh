#!/usr/bin/env bash
docker-compose build
wait
docker-compose up -d