#!/bin/sh

vagrant destroy -f
vagrant up && sleep 7 && \
  ./provision.sh
