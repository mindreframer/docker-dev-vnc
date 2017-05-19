FROM ubuntu:16.04
MAINTAINER Roman Heinrich

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y xorg nano locate zsh supervisor logrotate \
          git curl wget tightvncserver openssh-server \
          lxde-core lxappearance lxterminal \
          firefox lubuntu-icon-theme lubuntu-artwork-16-04 \
          lubuntu-lxpanel-icons lubuntu-artwork \
          xfonts-100dpi xfonts-100dpi-transcoded xfonts-75dpi \
          xfonts-75dpi-transcoded xfonts-base \
 && rm -rf /var/lib/apt/lists/*
