#!/bin/bash

# Define the playbook and tags
PLAYBOOK="macos_dev.yml"
TAGS="macos,unix"

# Run the Ansible playbook
echo "Running playbook: ${PLAYBOOK} with tags: ${TAGS}"
ansible-playbook "${PLAYBOOK}" --tags "${TAGS}" "$@"