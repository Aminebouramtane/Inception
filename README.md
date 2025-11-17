# Inception


NAME = inception

VOLUME_WORDPRESS = /home/abouramt/data/wordpress

VOLUME_MARIADB = /home/abouramt/data/mariadb

all:
	mkdir -p $(VOLUME_WORDPRESS)
	mkdir -p $(VOLUME_MARIADB)
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

logs:
	docker compose -f srcs/docker-compose.yml logs

clean:
	docker system prune -af --volumes

fclean:
	sudo rm -rf /home/abouramt/data/wordpress
	sudo rm -rf /home/abouramt/data/mariadb

	@docker stop $$(docker ps -qa) 2>/dev/null
	@docker rm $$(docker ps -qa) 2>/dev/null
	@docker rmi -f $$(docker images -qa) 2>/dev/null
	@docker volume rm $$(docker volume ls -q) 2>/dev/null
	@docker network rm $$(docker network ls -q) 2>/dev/null

re: down clean all
