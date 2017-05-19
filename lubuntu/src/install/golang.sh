#!/bin/bash

set -e

apt-get update
apt-get -y install wget bzip2 git-core net-tools

# golang itself
wget http://golang.org/dl/go1.8.linux-amd64.tar.gz -q -O - | tar -zxf - -C /usr/local && \
    chmod -R a+rwx /usr/local/go
GOROOT=/usr/local/go
PATH=$PATH:$GOROOT/bin

# Add tools
mkdir /tools &&\
    cd /tools &&\
		GOPATH=/tools go get github.com/alecthomas/gometalinter &&\
    GOPATH=/tools /tools/bin/gometalinter --install &&\
    GOPATH=/tools go get -u github.com/kardianos/govendor &&\
    GOPATH=/tools go get -u github.com/rogpeppe/godef &&\
    GOPATH=/tools go get -u github.com/golang/lint/golint &&\
    GOPATH=/tools go get -u github.com/derekparker/delve/cmd/dlv &&\
    GOPATH=/tools go get -u github.com/nsf/gocode &&\
    GOPATH=/tools go get -u github.com/tpng/gopkgs &&\
    GOPATH=/tools go get -u github.com/lukehoban/go-outline &&\
    GOPATH=/tools go get -u github.com/acroca/go-symbols &&\
    GOPATH=/tools go get -u golang.org/x/tools/cmd/guru &&\
    GOPATH=/tools go get -u golang.org/x/tools/cmd/gorename &&\
    GOPATH=/tools go get -u github.com/fatih/gomodifytags &&\
    GOPATH=/tools go get -u golang.org/x/tools/cmd/godoc &&\
    GOPATH=/tools go get -u github.com/rogpeppe/godef &&\
    GOPATH=/tools go get -u github.com/zmb3/gogetdoc &&\
    GOPATH=/tools go get -u golang.org/x/tools/cmd/goimports &&\
    GOPATH=/tools go get -u sourcegraph.com/sqs/goreturns &&\
    GOPATH=/tools go get -u github.com/golang/lint/golint &&\
    GOPATH=/tools go get -u github.com/cweill/gotests/... &&\
    GOPATH=/tools go get -u github.com/sourcegraph/go-langserver

PATH=$PATH:/tools/bin
