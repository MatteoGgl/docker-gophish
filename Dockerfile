FROM debian:jessie
MAINTAINER Matteo Guglielmetti <matteo.guglielmetti@hotmail.it>
MAINTAINER Dominique Derrier <derrierdo@gmail.com>

RUN apt-get update && \
apt-get install --no-install-recommends -y \
unzip \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/gophish
RUN wget -nv https://github.com/gophish/gophish/releases/download/0.7.1/gophish-v0.7.1-linux-64bit.zip && \
unzip gophish*.zip && \
rm -f gophish*.zip

RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
sed -i "s|0.0.0.0:80|0.0.0.0:9090|g" config.json && \
chown 1000 -R /opt/gophish && \
chmod +x gophish

EXPOSE 3333 9090
USER 1000
ENTRYPOINT ["./gophish"]
