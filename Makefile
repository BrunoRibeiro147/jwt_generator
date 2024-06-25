DOCKER_COMPOSE := docker compose

MAKE := make --no-print-directory

start:
	$(DOCKER_COMPOSE) -f docker-compose.yml run --rm --service-ports --name=jwt_generator core bash
