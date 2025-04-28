FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y openfortivpn openssh-server supervisor && \
    mkdir /var/run/sshd && \
    echo "root:root" | chpasswd && \
    sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    apt-get clean

COPY openfortivpn.conf /etc/openfortivpn/config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222

ENTRYPOINT ["/entrypoint.sh"]
