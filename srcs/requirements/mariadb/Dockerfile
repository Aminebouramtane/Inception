FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /tmp/setup.sh

EXPOSE 3306

CMD ["/tmp/setup.sh"]
