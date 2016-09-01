# Dockerfile for Hyperledger dev image, with everything to go!
# Data is stored under /var/hyperledger/db and /var/hyperledger/production
# Under $GOPATH/bin, there are two config files: core.yaml and config.yaml.

FROM yeasy/hyperledger:latest
MAINTAINER Baohua Yang

RUN apt-get update \
        && apt-get install -y \
            autoconf \
            automake \
            build-essential \
            curl \
            libtool \
            nodejs \
            python-dev \
            python-pip \
            software-properties-common \
            unzip \
            wget \
        && rm -rf /var/cache/apt

# install nodejs
#RUN cd /tmp \
#&& wget --quiet https://nodejs.org/dist/node-v0.12.7/node-v0.12.7-linux-x64.tar.gz \
#&& cd /usr/local \
#&& tar --strip-components 1 -xzf /tmp/node-v0.12.7/node-v0.12.7-linux-x64.tar.gz

# install protoc
RUN cd /tmp \
#&& git clone --single-branch https://github.com/google/protobuf.git \
#&& cd protobuf \
#&& git checkout v3.0.0 \
        && wget --quiet https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip \
        && tar xpzf v3.0.0.tar.gz \
        && cd protobuf-3.0.0 \
        && ./autogen.sh \
        && ./configure --prefix=/usr \
        && make \
        && make check \
        && make install \
        && export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN export GOROOT=/go
