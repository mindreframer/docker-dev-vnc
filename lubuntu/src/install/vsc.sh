#!/bin/bash

set -e

# apt-get -y install wget bzip2 git-core net-tools

# # golang itself
# wget http://golang.org/dl/go1.8.linux-amd64.tar.gz -q -O - | tar -zxf - -C /usr/local && \
#     chmod -R a+rwx /usr/local/go
# GOROOT=/usr/local/go
# PATH=$PATH:$GOROOT/bin

# install vscode
apt-get -qy install apt-utils
apt-get -qy install make libnotify4 libnss3 libxkbfile1 libgtk2.0-0 libxss1 libgconf-2-4 gcc sudo unzip libgl.1 "^libxcb.*"
wget -q -O vscode-amd64.deb  https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i vscode-amd64.deb
rm vscode-amd64.deb

# install hack font
wget 'https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip'
unzip Hack*.zip
mkdir /usr/share/fonts/truetype/Hack
mv Hack* /usr/share/fonts/truetype/Hack
fc-cache -f -v

# The default directories where the code and profiles will be
# WORKDIR /work
# ENV GOPATH /work
# ENV GOBIN=/work/bin

# The directory where the local IDE profile is stored.
# RUN mkdir -p /vscode-data
# ENV HOME /vscode-data
# COPY src/gitconfig /vscode-data/.gitconfig
# COPY src/settings.json /vscode-data/User/settings.json

