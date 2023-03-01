UID=$(shell id -u)
GID=$(shell id -g)

ENV := dev
DOCKER_COMPOSE_OPTIONS := -d --remove-orphans
DOCKER_COMPOSE=$(DOCKER_BUILDKIT) DOCKER_BUILDKIT=1 docker-compose -f docker-compose.yml

.SILENT:

.PHONY: help
help:
	echo ""
	echo " > \033[1;37mRiberenc\033[0m commands"
	echo ""
	echo You can use the following commands:
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN { FS = ":.*?## " }; { printf " - \033[1;36m%s:\033[0m %s\n", $$1, $$2 }'
	echo

up:
	$(DOCKER_COMPOSE) up $(DOCKER_COMPOSE_OPTIONS)

down:
	$(DOCKER_COMPOSE) down

build:
	$(DOCKER_COMPOSE) build