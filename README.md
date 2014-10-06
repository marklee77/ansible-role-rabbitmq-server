marklee77.rabbitmq-server
=================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-rabbitmq-server.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-rabbitmq-server)

The purpose of this role is to deploy rabbitmq-server onto Ubuntu. There is also an
support for an experimental "dockerized" deployment. This dockerized deployment
copies the role to the target machine and uses the original ansible-based
functionality to build a docker image, and then uses recent ansible features to
manage the running service. The dockerized deployment can theoretically deploy
to any Linux platform with a running docker install and the docker-py python
client library installed.

Travis status above refers only to the non-dockerized deployment, as docker does 
not (easily) run on travis.

Role Variables
--------------

- rabbitmq-server_repository_mirror: http://mirrors.coreix.net/rabbitmq-server by default.
- rabbitmq-server_version: 10.0
- rabbitmq-server_mysql_root_password: random value
- rabbitmq-server_enable_remote: false
- rabbitmq-server_set_root_password: true

The variables below only affect the dockerized deployment:

- rabbitmq-server_dockerized_deployment: false
- rabbitmq-server_docker_username: default
- rabbitmq-server_docker_imagename: rabbitmq-server
- rabbitmq-server_docker_containername: rabbitmq-server
- rabbitmq-server_port: 3306

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - marklee77.rabbitmq-server

License
-------

GPLv2

Author Information
------------------

http://stillwell.me

Known Issues
------------

- the dockerized deployment still requires sudo access, even though a member of 
  the docker group should be able to build and deploy containers without sudo.

Todo
----

- consider making mapping of rabbitmq-server port to host interface optional

