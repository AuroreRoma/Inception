all : build up

build :
	docker-compose -f srcs/docker-compose.yml build

up :
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

clean :
	docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml rm

clear :
	-@docker stop $(docker ps -qa) 2>/dev/null
	-@docker rm $(docker ps -qa) 2>/dev/null
	-@docker rmi -f $(docker images -qa) 2>/dev/null
	-@docker volume rm $(docker volume ls -q) 2>/dev/null
	-@docker network rm $(docker network ls -q) 2>/dev/null
