# build via docker build -t franitel/samba4-ad-dc .

FROM ubuntu:18.04
MAINTAINER franitel@hotmail.com

LABEL name="Samba 4 AD/DC arm" \
      license="GPLv3" \
      build-tag="1.0.0_0" \
      build-version="0"

RUN apt-get update -y
#RUN apt-get upgrade -y

RUN mkdir /fran

COPY config.txt /fran/config
COPY smb-global.txt /fran/smb-global.conf
COPY smb-share.txt /fran/smb-share.conf

COPY init.sh /fran/init.sh
COPY setup.sh /fran/setup.sh
COPY service.sh /fran/service.sh
RUN chmod 755 /fran
RUN chmod 755 /fran/*.sh

RUN apt-get install -y samba smbclient krb5-kdc winbind

RUN apt-get autoremove -y

ENV DOCKER_DEBUG 0

ENV DNS_FORWARD 8.8.8.8
ENV DNS_DOMAIN fran.lan
ENV AD_PASSWORD PASS0rd1234
ENV AD_REALM fran.lan
ENV AD_DOMAIN FRAN
ENV AD_NOSTRONGAUTH 1
ENV AD_HOST_IP ""
ENV AD_OPTIONS ""


#VOLUME ["/var/lib/samba", "/var/log/samba", "/etc/samba", "/fran"]

EXPOSE 53 135 137/udp 138/udp 139 389 445 464 636

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
