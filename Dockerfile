FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

ENV DEBIAN_FRONTEND noninteractive

COPY . /var/cache/docker/rabbitmq
WORKDIR /var/cache/docker/rabbitmq
RUN mkdir -p roles && ln -snf .. roles/marklee77.rabbitmq-server
RUN ansible-playbook -i inventories/local.ini deploy.yml -e '{ \
        "rabbitmq_enable_remote" : true, \
        "rabbitmq_set_root_password" : false, \
        "rabbitmq_dockerized_deployment" : false }' && \
    rm -rf private && \
    service rabbitmq-server stop

VOLUME ["/etc/mysql", "/var/run/mysqld", "/usr/lib/mysql"]

CMD [ "/usr/sbin/mysqld", \
      "--basedir=/usr", \
      "--datadir=/var/lib/mysql", \
      "--pid-file=/var/run/mysqld/mysqld.pid", \
      "--plugin-dir=/usr/lib/mysql/plugin", \
      "--port=3306", \
      "--socket=/var/run/mysqld/mysqld.sock", \
      "--user=mysql" ]

EXPOSE 3306
