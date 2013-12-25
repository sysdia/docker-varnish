FROM ubuntu:12.04
RUN apt-get -q -y update
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get -q -y update
RUN apt-get install -q -y varnish
EXPOSE 80
