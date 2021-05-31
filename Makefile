.PHONY: stop build start clean

build:
	@docker-compose build 

start:
	@docker-compose up 

stop: 
	@docker-compose down

clean:
	@docker-compose down -v --rmi local --remove-orphans
