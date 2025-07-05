#!/bin/bash

# Ansible verbosity management
VERBOSITY=""
if [ ! -z "$ANSIBLE_VERBOSITY" ]; then
    case "$ANSIBLE_VERBOSITY" in
        "0") VERBOSITY="" ;;
        "1") VERBOSITY="-v" ;;
        "2") VERBOSITY="-vv" ;;
        "3") VERBOSITY="-vvv" ;;
        "4") VERBOSITY="-vvvv" ;;
        "5") VERBOSITY="-vvvvv" ;;
    esac
    echo "Ansible verbosity is level $ANSIBLE_VERBOSITY"
else
    echo "Ansible verbosity is not set by user, use default value: '1'"
    VERBOSITY="-v"
fi

ansible --version
#ansible-playbook playbooks/UpdateServer.yaml $VERBOSITY

tail -f /dev/null