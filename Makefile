NAME = inception

all:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

logs:
	docker compose -f srcs/docker-compose.yml logs

clean:
	docker system prune -af --volumes

re: down clean all
