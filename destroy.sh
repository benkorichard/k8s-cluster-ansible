#!/bin/bash

WORKDIR=${PWD}

cd ${WORKDIR}/vagrant
vagrant destroy -f
cd ${WORKDIR}