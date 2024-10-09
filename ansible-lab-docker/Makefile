.PHONY: stop run pull restart logs ps

DOCKER_COMPOSE=docker compose

stop:
	$(DOCKER_COMPOSE) stop

run:
	$(DOCKER_COMPOSE) up -d

pull:
	$(DOCKER_COMPOSE) pull

restart:
	$(DOCKER_COMPOSE) restart

logs:
	$(DOCKER_COMPOSE) logs

ps:
	$(DOCKER_COMPOSE) ps

build:
	$(DOCKER_COMPOSE) up --build -d
