marklee77.rabbitmq-server
=========================

[![Build Status](https://travis-ci.org/marklee77/ansible-role-rabbitmq-server.svg?branch=master)](https://travis-ci.org/marklee77/ansible-role-rabbitmq-server)

The purpose of this role is to deploy rabbitmq-server onto Ubuntu. 

Role Variables
--------------

- rabbitmq_bind_address: 0.0.0.0
- rabbitmq_port: 5672

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
