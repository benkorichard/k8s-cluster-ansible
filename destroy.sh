#!/bin/bash

WORKDIR=${PWD}

cd ${WORKDIR}/vagrant
vagrant destroy -f
rm -rf .vagrant
cd ${WORKDIR}
rm cluster.config