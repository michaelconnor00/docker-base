###############################################################################
# Environment
###############################################################################

FROM debian:jessie
MAINTAINER <hi@sparkgeo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

###############################################################################
# Libraries
###############################################################################

# Pre apt-get install
RUN apt-get update && apt-get install -y --no-install-recommends curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -

# Post apt-get install
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libffi-dev \
    libmemcached-dev \
    libpq-dev \
    libxslt-dev \
    nginx \
    nodejs \
    npm \
    postgis \
    python-dev \
    python-pip \
    ruby \
    supervisor \
    vim

RUN pip install --upgrade pip

RUN gem install sass ultrahook

RUN ln -s "$(which nodejs)" /usr/bin/node
RUN npm install -g bower gulp npm
