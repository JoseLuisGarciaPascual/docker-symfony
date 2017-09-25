#!/usr/bin/env bash
WORK_DIR="/var/www/"
echo "Changing ownership to www-data"
docker-compose exec -T nginx chown -R www-data:www-data ${WORK_DIR}
echo "Changing permissions to 775"
docker-compose exec -T nginx chmod -R 775 ${WORK_DIR}