marklee77.rabbitmq-server
=========================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-rabbitmq-server.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-rabbitmq-server)

The purpose of this role is to deploy rabbitmq-server onto Ubuntu. There is
also support for an experimental "dockerized" deployment. This dockerized
deployment copies the role to the target machine and uses the original
ansible-based functionality to build a docker image, and then uses recent
ansible features to manage the running service. The dockerized deployment can
theoretically deploy to any Linux platform with a running docker install and
the docker-py python client library installed.

Travis status above refers only to the non-dockerized deployment, as docker does 
not (easily) run on travis.

Role Variables
--------------

- rabbitmq_bind_address: 0.0.0.0
- rabbitmq_port: 5672

The variables below only affect the dockerized deployment:

- rabbitmq_dockerized_deployment: false
- rabbitmq_docker_username: default
- rabbitmq_docker_imagename: rabbitmq-server
- rabbitmq_docker_containername: rabbitmq-server


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
- problems with accessing admin functions in container due to need to run 
  rabbitmqctl
- either figure out why supervisor is not working right or remove it...
- administering rabbitmq is a pain, need better support for dynamic users and 
  vhosts when deployed in a dockerized environment...
