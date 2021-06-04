# Pass as argument to +build+ target to change
GIT_PWD="abc123"

.PHONY: stop build start clean

build:
	@docker-compose build --build-arg GIT_PWD=$(GIT_PWD)

start:
	@docker-compose up 

stop: 
	@docker-compose down

clean:
	@docker-compose down -v --rmi local --remove-orphans
