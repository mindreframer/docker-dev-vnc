#!/bin/bash

set -e
# cd /tmp
# curl http://download.nomachine.com/download/5.2/Linux/nomachine_5.2.21_1_amd64.deb -o nomachine_5.2.21_1_amd64.deb
# dpkg -i nomachine_5.2.21_1_amd64.deb



NOMACHINE_PACKAGE_NAME=nomachine_5.2.11_1_amd64.deb
NOMACHINE_MD5=d697e5a565507d522380c94d2f295d07
# Install nomachine, change password and username to whatever you want here
curl -fSL "http://download.nomachine.com/download/5.2/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
        && echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
        && dpkg -i nomachine.deb \
        && groupadd -r nomachine -g 433 \
        && useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine \
        && adduser nomachine sudo \
        && mkdir /home/nomachine \
        && chown -R nomachine:nomachine /home/nomachine \
        && echo 'nomachine:nomachine' | chpasswd