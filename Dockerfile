FROM ubuntu:trusty

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN echo 'deb http://ams2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main' > /etc/apt/sources.list.d/galera.list
RUN apt-get update && apt-get install -y mariadb-galera-server

COPY ["client.cnf", "mysqld.cnf", "/etc/mysql/conf.d/"]

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["mysqld"]
