FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

# Configure timezone and locale to spanish and America/Bogota timezone. Change locale and timezone to whatever you want
ENV LANG="en_US.UTF8"
ENV LANGUAGE=en_US
RUN apt-get clean && \
    apt-get -y update && \
    apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    locale-gen en_US

RUN echo "Europe/Berlin" > /etc/timezone && \
    apt-get install -y locales && \
    sed -i -e "s/# $LANG.*/$LANG.UTF-8 UTF-8/" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG

RUN apt-get update && apt-get install -y vim xterm pulseaudio cups curl

# Install the mate-desktop-enviroment version you would like to have
RUN apt-get update -y && \
    apt-get install -y mate-desktop-environment-extras

# Goto https://www.nomachine.com/download/download&id=10 and change for the latest NOMACHINE_PACKAGE_NAME and MD5 shown in that link to get the latest version.
ENV NOMACHINE_PACKAGE_NAME=nomachine_5.2.21_1_amd64.deb
ENV NOMACHINE_MD5=48787b8175e68a741a0272b2c255799f
# Install nomachine, change password and username to whatever you want here
RUN curl -fSL "http://download.nomachine.com/download/5.2/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
        && echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
        && dpkg -i nomachine.deb \
        && groupadd -r nomachine -g 433 \
        && useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine \
        && adduser nomachine sudo \
        && mkdir /home/nomachine \
        && chown -R nomachine:nomachine /home/nomachine \
        && echo 'nomachine:nomachine' | chpasswd

# install add-apt-repository stuff to get tor-browser working
RUN apt-get install -y  \
    wget xdg-utils libpango1.0-0 fonts-liberation htop nano git vim








# Tools for use with Go
RUN apt-get -y install wget bzip2 git-core net-tools

# golang itself
RUN wget http://golang.org/dl/go1.8.linux-amd64.tar.gz -q -O - | tar -zxf - -C /usr/local && \
    chmod -R a+rwx /usr/local/go
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

# install vscode
RUN apt-get -qy install apt-utils
RUN apt-get -qy install make libnotify4 libnss3 libxkbfile1 libgtk2.0-0 libxss1 libgconf-2-4 gcc sudo unzip libgl.1 "^libxcb.*"
RUN wget -q -O vscode-amd64.deb  https://go.microsoft.com/fwlink/?LinkID=760868
RUN dpkg -i vscode-amd64.deb
RUN rm vscode-amd64.deb

# install hack font
run wget 'https://github.com/chrissimpkins/Hack/releases/download/v2.020/Hack-v2_020-ttf.zip'
run unzip Hack*.zip
run mkdir /usr/share/fonts/truetype/Hack
run mv Hack* /usr/share/fonts/truetype/Hack
run fc-cache -f -v

# Add tools
RUN mkdir /tools &&\
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

ENV PATH $PATH:/tools/bin

# The default directories where the code and profiles will be
WORKDIR /work
ENV GOPATH /work
ENV GOBIN=/work/bin

# The directory where the local IDE profile is stored.
RUN mkdir -p /vscode-data
ENV HOME /vscode-data
COPY src/gitconfig /vscode-data/.gitconfig
COPY src/settings.json /vscode-data/User/settings.json




ADD nxserver.sh /nxserver.sh
RUN chmod 0755 /nxserver.sh
CMD /nxserver.sh
