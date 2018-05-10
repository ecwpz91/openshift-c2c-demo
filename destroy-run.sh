#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

time ansible-playbook destroy.yml -vvv -i inventory/inventory.cfg "$@"
