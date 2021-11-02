#!/bin/bash

WORKDIR=${PWD}

cd ${WORKDIR}/vagrant
vagrant up
sleep 30
cd ${WORKDIR}

cd ${WORKDIR}/ansible
ansible-galaxy collection install community.kubernetes
ansible-galaxy collection install kubernetes.core
ansible-playbook playbooks/k8s/main.yaml
cd ${WORKDIR}