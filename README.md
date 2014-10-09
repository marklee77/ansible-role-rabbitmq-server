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

<<<<<<< HEAD
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
=======
- mariadb_repository_mirror: http://mirrors.coreix.net/mariadb by default.
- mariadb_version: 10.0
- mariadb_mysql_root_password: random value
- mariadb_bind_address: 127.0.0.1
- mariadb_port: 3306

The variables below only affect the dockerized deployment:

- mariadb_dockerized_deployment: false
- mariadb_docker_username: default
- mariadb_docker_imagename: mariadb
- mariadb_docker_containername: mariadb
>>>>>>> 8b067081c67d5f0f44f5a19a122c8872a91e0fab

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
- there is no way to override the mariadb repository and version from a 
  deployment, another role, or the command line. This is because the files are 
  copied to the server and built on the receiving end. It would be possible to 
  use a template instead, but then that would break docker.io automatic builds.

Todo
----

<<<<<<< HEAD
- consider making mapping of rabbitmq-server port to host interface optional

=======
- need to make sure to pass through *all* variables that might be overwritten...
- consider making mapping of mariadb port to host interface optional
- option to map unix socket to local or to *not* map ip address...
- user .my.cnf configured to connect to mariadb_bind_address:mariadb_port if 
  bound and no socket?
- automatic rebuild on changes that might affect dockerfile?
- verify no private credential directory is being created...
>>>>>>> 8b067081c67d5f0f44f5a19a122c8872a91e0fab
