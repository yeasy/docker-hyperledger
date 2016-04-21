# Dockerfile for Hyperledger base image, with everything (peer, membersrvc) to go!
# Workdir is set to $GOPATH.
# Data is stored under /var/hyperledger/db and /var/hyperledger/production
# Under $GOPATH/bin, there are 3 config files: core.yaml, membersrvc.yaml and config.yaml.

FROM golang:1.6
MAINTAINER Baohua Yang

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
        && apt-get install -y libsnappy-dev zlib1g-dev libbz2-dev \
        && rm -rf /var/cache/apt

# install rocksdb
RUN cd /tmp \
 && git clone --single-branch -b v4.1 --depth 1 https://github.com/facebook/rocksdb.git \
 && cd rocksdb \
 && PORTABLE=1 make shared_lib \
 && INSTALL_PATH=/usr/local make install-shared \
 && ldconfig \
 && cd / \
 && rm -rf /tmp/rocksdb

RUN mkdir -p /var/hyperledger/db \
        && mkdir -p /var/hyperledger/production

# install hyperledger
RUN mkdir -p $GOPATH/src/github.com/hyperledger \
        && cd $GOPATH/src/github.com/hyperledger \
        && git clone --single-branch -b master --depth 1 https://github.com/hyperledger/fabric.git \
        && cd $GOPATH/src/github.com/hyperledger/fabric/peer \
        && CGO_CFLAGS=" " CGO_LDFLAGS="-lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy" go install \
        && go clean \
        && cd $GOPATH/src/github.com/hyperledger/fabric/membersrvc \
        && CGO_CFLAGS=" " CGO_LDFLAGS="-lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy" go install \
        && go clean

RUN cp $GOPATH/src/github.com/hyperledger/fabric/peer/core.yaml $GOPATH/bin \
        && cp $GOPATH/src/github.com/hyperledger/fabric/membersrvc/membersrvc.yaml $GOPATH/bin \
        && cp $GOPATH/src/github.com/hyperledger/fabric/consensus/obcpbft/config.yaml $GOPATH/bin

# this is only a workaround for current hard-coded problem.
RUN ln -s $GOPATH /opt/gopath
