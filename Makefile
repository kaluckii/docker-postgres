DC = docker compose
COMPOSE = docker-compose.yml

include .env
export

start:
	$(DC) -f $(COMPOSE) up -d --force-recreate

drop:
	$(DC) -f $(COMPOSE) down

logs:
	$(DC) -f $(COMPOSE) logs database

clear-logs:
	sudo docker ps -aq | xargs -I {} sudo sh -c 'truncate -s 0 $$(docker inspect --format="{{.LogPath}}" {})'

connect-db:
	$(DC) -f $(COMPOSE) exec database psql -U ${DOCKER_DATABASE_USER} -d ${DOCKER_DATABASE_USER}

connection-string:
ifeq ($(OS),Windows_NT)
	@for /f %%i in ('curl -s https://api.ipify.org') do @echo postgres://$(DOCKER_DATABASE_USER):$(DOCKER_DATABASE_PASS)@%%i:443/$(DOCKER_DATABASE_NAME)
else
	@echo "postgres://$(DOCKER_DATABASE_USER):$(DOCKER_DATABASE_PASS)@$$(curl -s https://api.ipify.org):443/$(DOCKER_DATABASE_NAME)"
endif
