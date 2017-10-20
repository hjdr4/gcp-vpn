FROM debian:stretch

RUN apt-get update && apt-get install -qqy quagga* strongswan-ikev2 ansible kmod procps net-tools

ADD content /

ENTRYPOINT /entrypoint