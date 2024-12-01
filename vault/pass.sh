#!/bin/bash

if [ -z "${ANSIBLE_VAULT_PASSWORD+x}" ] || [ -z "$ANSIBLE_VAULT_PASSWORD" ]; then
    export ANSIBLE_VAULT_PASSWORD=$(security find-generic-password -a "vault_pass" -s "ansible" -w)
fi

echo $ANSIBLE_VAULT_PASSWORD
