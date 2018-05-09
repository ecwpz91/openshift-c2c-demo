#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

time ansible-playbook playbook.yml -i inventory/inventory.cfg "$@"
