# docker-gophish

> A docker image for the Gophish web application

[![](https://badge.imagelayers.io/matteoggl/gophish:latest.svg)](https://imagelayers.io/?images=matteoggl/gophish:latest 'Get your own badge on imagelayers.io')


## Description

This is a quick way to deploy a [gophish](https://github.com/gophish/gophish) installation on your local machine.

The version running is 0.1.1 on the official Debian Jessie container.

## Usage

#### Quickstart

```bash
docker run -ti --name gophish -p 3333:3333 -p 8083:80 matteoggl/gophish
```
To run as a daemon:

```bash
docker run -d --name gophish -p 3333:3333 -p 8083:80 matteoggl/gophish
```

In your browser, go to ```http://your-docker-machine-ip:3333```

#### Building the image

```bash
git clone https://github.com/matteoggl/docker-gophish
cd docker-gophish
docker build -t "yourname/gophish:yourtag" .
```
