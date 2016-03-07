FROM debian:jessie
MAINTAINER Matteo Guglielmetti <matteo.guglielmetti@hotmail.it>

RUN apt-get update && \
apt-get install --no-install-recommends -y \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN wget -nv https://github.com/gophish/gophish/releases/download/v0.1.2/gophish_linux_64bit.tar.gz && \
tar -xf gophish_linux_64bit.tar.gz && \
rm -f gophish_linux_64bit.tar.gz

WORKDIR /opt/gophish_linux_amd64
RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
