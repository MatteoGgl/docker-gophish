FROM debian:jessie
MAINTAINER Matteo Guglielmetti <matteo.guglielmetti@hotmail.it>

RUN apt-get update && \
apt-get install -y \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN wget -nv https://github.com/gophish/gophish/releases/download/v0.1.1/gophish_linux_64bit.tar.gz
RUN tar -xf gophish_linux_64bit.tar.gz && \
rm -f gophish_linux_64bit.tar.gz

WORKDIR /opt/gophish_linux_amd64
RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
