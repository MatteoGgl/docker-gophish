# docker-gophish

> A docker image for the Gophish web application

[![Build details](https://img.shields.io/badge/build%20details-success-brightgreen.svg)](https://hub.docker.com/r/matteoggl/gophish/builds) [![Docker Pulls](https://img.shields.io/docker/pulls/matteoggl/gophish.svg)](https://hub.docker.com/r/matteoggl/gophish)


## Description

This is a quick way to deploy a [gophish](https://github.com/gophish/gophish) installation on your local machine.

The latest version 0.1.2 is running on the official Debian Jessie container. Latest stable image version is 0.6.

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

#### Different gophish version

You can run a different version of gophish by simply applying the corresponding tag.

e.g. `matteoggl/gophish:gophish0.1.1`

## Contributing

Issues and pull requests are gladly accepted!

## gophish license

gophish - Open-Source Phishing Framework
The MIT License (MIT)
Copyright (c) 2013 - 2016 Jordan Wright
