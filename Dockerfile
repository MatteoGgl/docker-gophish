FROM debian:jessie
MAINTAINER Matteo Guglielmetti <matteo.guglielmetti@hotmail.it>

RUN apt-get update && \
apt-get install --no-install-recommends -y \
unzip \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN wget -nv https://github.com/gophish/gophish/releases/download/v0.1.2/gophish_linux_64bit.zip && \
unzip gophish_linux_64bit.zip && \
rm -f gophish_linux_64bit.zip

WORKDIR /opt/gophish_linux_64bit
RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
chmod +x gophish

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
