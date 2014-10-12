## Bind Dockerfile


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download `docker pull dcai/bind`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dcai/bind" github.com/danielscai/docker-bind`)


### Usage

    docker run -d -p 53:53 -p 53:53/udp dcai/bind

#### Customizing Bind

    docker run -d -p 53:53 -p 53:53/udp -v <override-dir>:/bind-override dcai/bind

where `<override-dir>` is an absolute path of a directory that could contain:

  - `name.conf`: custom config file 
  - `name.conf.options`: custom options files
  - `name.conf.local`: custom local file 
  - `db.mine`: your private record .

### Refs

refs to [Dockerfile/haproxy](https://github.com/dockerfile/haproxy).
