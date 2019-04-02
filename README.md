# Summary

Samba 4 ActiveDirectory DC docker container for ARM. (Raspberry pi).

# Description

Include ubuntu:18.04 image.

# Usage

## Configuration

### --env

    DOCKER_DEBUG 0
    DNS_FORWARD 8.8.8.8
    DNS_DOMAIN fran.lan
    AD_PASSWORD PASS0rd1234
    AD_REALM fran.local
    AD_DOMAIN FRAN
    AD_NOSTRONGAUTH 1
    AD_HOST_IP ""
    AD_OPTIONS ""

### --port

    53 DNS
    135
    137
    138
    139
    389 LDAP
    445
    464
    636 LDAPS

### --volume

    /var/lib/samba
    /var/log/samba
    /etc/samba
    /fran

## Examples

### Start Docker Container

    sudo docker run --privileged -it -p 389:389 \
                -e "DOCKER_DEBUG=1" \
                -e "DNS_FORWARD=8.8.8.8" \
                -e "DNS_DOMAIN=fran.lan" \
                -e "AD_PASSWORD=PASS0rd1234" \
                -e "AD_REALM=fran.lan" \
                -e "AD_DOMAIN=FRAN" \
                --restart=always \
                -d franitel/samba4-ad-dc

# Other

## Copyright and license

- Code released under [GNU GENERAL PUBLIC LICENSE Version 3]
