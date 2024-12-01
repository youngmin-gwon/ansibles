#!/bin/bash

if [ -z "${ANSIBLE_BECOME_PASSWORD+x}" ] || [ -z "$ANSIBLE_BECOME_PASSWORD" ]; then
    export ANSIBLE_BECOME_PASSWORD=$(security find-generic-password -a "sudo_pass" -s "ansible" -w)
fi

echo $ANSIBLE_BECOME_PASSWORD
