#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

time ansible-playbook playbook.yml -vvv -i inventory/inventory.cfg "$@"
