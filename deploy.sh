#!/bin/bash
git pull
ansible-playbook -v -i machine-description.yml deploy.yml
