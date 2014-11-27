# Pull base image.
FROM ubuntu:14.04

MAINTAINER RnbWd <dwisner6@gmail.com>

RUN echo "deb http://ppa.launchpad.net/node trusty main" > /etc/apt/sources.list.d/node-stable.list
RUN echo "deb-src http://ppa.launchpad.net/node trusty main" >> /etc/apt/sources.list.d/node-stable.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C

RUN apt-get update
RUN apt-get install -y --force-yes \
    curl \
    apt-transport-https \
    lsb-release \
    build-essential \
    python-all \
    nodejs

ENV SINOPIA_VERSION 1.0.0-alpha
ENV SINOPIA_PATH /opt/sinopia

RUN npm install -g node-gyp \
 && npm cache clear

RUN node-gyp configure || echo ""

RUN npm install -g sinopia@$SINOPIA_VERSION

RUN mkdir -p $SINOPIA_PATH/storage
ADD config.yaml $SINOPIA_PATH/config.yaml

VOLUME $SINOPIA_PATH

# RUN adduser --disabled-password --gecos 'Sinopia NPM mirror' sinopia
# RUN chown -R sinopia:sinopia $SINOPIA_PATH
# USER sinopia

WORKDIR $SINOPIA_PATH

CMD sinopia

EXPOSE 4873
