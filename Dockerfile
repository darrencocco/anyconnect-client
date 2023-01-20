FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y libxml2 libgio-cil kmod libgtk-3-0 x11vnc xvfb net-tools '^libwebkit2gtk-4.0-[0-9]+$' blackbox bbrun iproute2 iptables busybox-syslogd novnc && apt-get clean

COPY ./anyconnect-linux*.sh /opt/anyconnect-install.sh

RUN sh /opt/anyconnect-install.sh && rm /opt/anyconnect-install.sh

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

COPY ./purge-firewall.sh /purge-firewall.sh
RUN chmod 0700 /purge-firewall.sh

COPY ./menu /etc/X11/blackbox/blackbox-menu

ENTRYPOINT ["/entrypoint.sh"]
