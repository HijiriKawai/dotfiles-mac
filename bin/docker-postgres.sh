#!/bin/sh

echo "start postgres from docker"

if type "docker-compose" >/dev/null 2>&1; then
	docker-compose -f ~/bin/docker/docker-compose.yml up -d
else
	echo "docker-compose not exist"
fi
