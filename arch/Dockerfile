#FROM rafaelsoares/archlinux:2016-06-17
FROM finalduty/archlinux:monthly

MAINTAINER roman.heinrich@gmail.com
ENV LANG en_US.utf8

RUN pacman -Sy --noconfirm --needed expect tigervnc ratpoison ttf-droid
WORKDIR /root/
ADD src/.ratpoisonrc /root/.ratpoisonrc
ENV VNCPASSWD vncrocks
#RUN pacman -S -cc --noconfirm
#ln -sf /proc/self/fd /dev
#rm -rf /var/cache/pacman/pkg
ADD src/xstartup.sh /root/.vnc/xstartup
ADD src/setpass.sh /root/setpass.sh
RUN /root/setpass.sh
CMD vncserver -fg

EXPOSE 5901
