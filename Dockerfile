FROM ubuntu:12.04
RUN apt-get -q -y update

RUN echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu precise-updates universe' >> /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list

RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d

RUN apt-get -q -y update
RUN apt-get install -q -y varnish supervisor 
RUN mkdir -p /var/log/supervisor

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
