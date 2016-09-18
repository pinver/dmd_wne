FROM base/archlinux

RUN pacman -Sy archlinux-keyring --noconfirm && pacman -Syu --noconfirm && pacman-db-upgrade
# see the blog ...
RUN sed -i -- 's/https/http/g' /etc/pacman.d/mirrorlist
RUN pacman -S ca-certificates-mozilla --noconfirm

#### RUN pacman -S dlang dub git strace --noconfirm
#### #RUN git clone https://github.com/jasonwhite/button.git && cd button && dub build --build=release
#### RUN git clone https://github.com/pinver/button.git && cd button && git checkout winedmd && dub build --build=release

RUN sed -i -e'/^#\[multilib\]/{s/#//;N;s/#//}' /etc/pacman.conf
RUN pacman -Syu --noconfirm

#### RUN pacman -S clang --noconfirm
#### RUN git clone https://github.com/jacob-carlborg/dstep.git && cd dstep && git checkout tags/v0.2.2 && dub build --build=release

RUN pacman -S wine-staging winetricks xorg-server-xvfb --noconfirm
#### # RUN winetricks allfonts

#### ADD vc /vc
ADD dmd /dmd

ENV DISPLAY=:0.0
#### ENV WINEDLLOVERRIDES="MSVCP140,vcruntime140,ucrtbase,api-ms-win-crt-locale-l1-1-0,api-ms-win-crt-runtime-l1-1-0,api-ms-win-crt-stdio-l1-1-0,api-ms-win-crt-heap-l1-1-0,api-ms-win-crt-conio-l1-1-0=n"
ENV WINEDEBUG=-all
