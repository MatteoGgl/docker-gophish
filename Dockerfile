FROM debian:jessie
MAINTAINER Matteo Guglielmetti <matteo.guglielmetti@hotmail.it>

RUN apt-get update && \
apt-get install --no-install-recommends -y \
unzip \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN wget -nv https://getgophish.com/releases/latest/linux/64 && \
unzip gophish-*.zip && \
rm -f gophish-*.zip

WORKDIR /opt/gophish-*
RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
chmod +x gophish

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
