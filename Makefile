.PHONY: test

DOCKER_CONSOLE := docker-compose run -w /app$(APP_PATH) --rm console
PROJECT_NAME ?= $(shell basename $(shell pwd))

container:
	docker-compose build
	$(DOCKER_CONSOLE) bundle install

bundle bundle_install bundle_update:
	$(eval bundle_cmd ?= $(shell echo $@ | tr _ ' '))
	$(DOCKER_CONSOLE) $(bundle_cmd)

console:
	$(DOCKER_CONSOLE)
