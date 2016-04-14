# Dockerfile for Hyperledger base image, with everything to go!
# Data is stored under /var/hyperledger/db and /var/hyperledger/production
# Under $GOPATH/bin, there are two config files: core.yaml and config.yaml.

FROM golang:1.6
MAINTAINER Baohua Yang

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
        && apt-get install -y libsnappy-dev zlib1g-dev libbz2-dev software-properties-common curl wget unzip autoconf build-essential libtool nodejs \
        && rm -rf /var/cache/apt

# install nodejs
#RUN cd /tmp \
#&& wget --quiet https://nodejs.org/dist/node-v0.12.7/node-v0.12.7-linux-x64.tar.gz \
#&& cd /usr/local \
#&& tar --strip-components 1 -xzf /tmp/node-v0.12.7/node-v0.12.7-linux-x64.tar.gz

# install protoc
RUN cd /tmp \
        && git clone https://github.com/google/protobuf.git \
        && cd protobuf \
        && git checkout 12fb61b292d7ec4cb14b0d60e58ed5c35adda3b7 \
        && ./autogen.sh \
        && ./configure --prefix=/usr \
        && make \
        && make check \
        && make install \
        && export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# install rocksdb
RUN cd /tmp \
 && git clone --single-branch -b v4.1 --depth 1 https://github.com/facebook/rocksdb.git \
 && cd rocksdb \
 && PORTABLE=1 make shared_lib \
 && INSTALL_PATH=/usr/local make install-shared \
 && ldconfig

# install hyperledger
RUN mkdir -p $GOPATH/src/github.com/hyperledger \
        && cd $GOPATH/src/github.com/hyperledger \
        && git clone --single-branch -b master --depth 1 https://github.com/hyperledger/fabric.git \
        && cd $GOPATH/src/github.com/hyperledger/fabric \
        && CGO_CFLAGS=" " CGO_LDFLAGS="-lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy" go install

RUN mkdir -p /var/hyperledger/db \
        && mkdir -p /var/hyperledger/production

RUN cp $GOPATH/src/github.com/hyperledger/fabric/core.yaml $GOPATH/bin \
        && cp $GOPATH/src/github.com/hyperledger/fabric/consensus/obcpbft/config.yaml $GOPATH/bin
