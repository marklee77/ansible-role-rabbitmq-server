FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/ansible/rabbitmq
WORKDIR /var/cache/ansible/rabbitmq

RUN if [ ! -f playbooks/group_vars/all.yml ]; then \
      mkdir -p playbooks/group_vars;\
      ln -s ../../defaults/main.yml playbooks/group_vars/all.yml;\
    fi
RUN ansible-playbook -i inventories/local.ini playbooks/install.yml

VOLUME [ "/etc/rabbitmq", "/var/run/rabbitmq", "/var/lib/rabbitmq", \
         "/var/log/rabbitmq", "/var/log/supervisor" ]

USER rabbitmq
CMD [ "/usr/sbin/rabbitmq-server" ]

EXPOSE 5672
