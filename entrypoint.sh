#!/bin/bash
# Entrypoint.sh
cp /etc/resolv.conf /etc/resolv.conf.bak
umount /etc/resolv.conf
mv /etc/resolv.conf.bak /etc/resolv.conf

syslogd

/etc/init.d/vpnagentd start

xvfb-run -n 0 -s "-screen 0 1024x768x24" -f /root/.Xauthority /usr/bin/blackbox 1>/dev/null 2>&1 &

x11vnc -display :0 -forever -bg -auth /root/.Xauthority -rfbport 5901 1>/dev/null 2>&1

/purge-firewall.sh 1>/dev/null 2>&1 &

/launch-dante-server.sh 1>/dev/null 2>&1 &

websockify -D --web=/usr/share/novnc/ 5900 localhost:5901 1>/dev/null 2>&1

tail -f /var/log/messages
