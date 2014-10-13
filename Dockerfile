FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/ansible/rabbitmq
WORKDIR /var/cache/ansible/rabbitmq

RUN mkdir -p roles && ln -snf .. roles/marklee77.rabbitmq-server
RUN ansible-playbook -i inventories/local.ini deploy.yml -e '{ \
      "rabbitmq_dockerize_context" : "install" }'

VOLUME [ "/etc/rabbitmq", "/var/run/rabbitmq", "/var/lib/rabbitmq", \
         "/var/log/rabbitmq", "/var/log/supervisor" ]

CMD [ "/usr/bin/supervisord" ]

EXPOSE 5672
