FROM ubuntu:16.04
MAINTAINER Roman Heinrich <roman.heinrich@gmail.com>

RUN apt-get update
RUN apt-get install -y xvfb x11vnc openbox firefox


# Setup a password for vnc
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd vncrocks ~/.vnc/passwd
# Expose default vnc port
EXPOSE 5900

RUN apt-get install curl -y
RUN curl -L https://github.com/immortal/immortal/releases/download/0.13.2/immortal_0.13.2_linux_amd64.tar.gz \
    -o immortal.tar.gz && tar xvfz immortal.tar.gz
# Add a script launching xvfb and x11vnc to supervisor configuration
# RUN echo "[program:startxvfb]">> /etc/supervisor/conf.d/supervisord.conf
# RUN echo "command=/bin/sh startXvfb.sh">> /etc/supervisor/conf.d/supervisord.conf
ADD src/startXvfb.sh /startXvfb.sh

CMD ["/startXvfb.sh"]
