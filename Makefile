.PHONY: logs taillogs up down build up-dev down-dev build-dev console 

logs:
	docker-compose logs

taillogs:
	docker-compose -f logs

up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

up-dev:
	docker-compose -f compose.yml -f override.dev.yml up -d

down-dev:
	docker-compose -f compose.yml -f override.dev.yml down

build-dev:
	docker-compose -f compose.yml -f override.dev.yml build

console:
	docker-compose exec fibonacci bash
