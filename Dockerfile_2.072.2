FROM base/archlinux

RUN pacman -Syu --noconfirm sed && \
    sed -i -e'/^#\[multilib\]/{s/#//;N;s/#//}' /etc/pacman.conf && \
    pacman -Syu --noconfirm && pacman-db-upgrade && \
    pacman -S wine --noconfirm

ADD dmd_2.072.2 /dmd
ENV DISPLAY=:0.0
ENV WINEDEBUG=-all
RUN wine /dmd/windows/bin/dmd.exe || true

CMD ["wine", "/dmd/windows/bin/dmd.exe"]
