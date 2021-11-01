#!/bin/bash

WORKDIR=${PWD}

cd ${WORKDIR}/vagrant
vagrant up
sleep 20
cd ${WORKDIR}

cd ${WORKDIR}/ansible
ansible-playbook playbooks/k8s/main.yaml
cd ${WORKDIR}