Docker-Hyperledger
===

This is deprecated, pls see [hyperledger-fabric-peer]((https://github.com/yeasy/docker-hyperledger-fabric-peer).

Out-of-the-box Docker images for [Hyperledger](https://www.hyperledger.org).

Related images:

* [hyperledger-peer](https://github.com/yeasy/docker-hyperledger-peer): With peer configurated, can be utilized as a peer node (NVP, VP).
* [hyperledger-membersrvc](https://github.com/yeasy/docker-hyperledger-membersrvc): With the membership service configurated, can be utilized as the authentication node.

If you want to quickly deploy a hyperledger cluster, please see [hyperledger-cluster](https://github.com/yeasy/docker-compose-files#hyperledger).

# Supported tags and respective Dockerfile links

* [`latest` (Dockerfile)](https://github.com/yeasy/docker-hyperledger/blob/master/Dockerfile)
* [`0.6-dp` (Dockerfile)](https://github.com/yeasy/docker-hyperledger/blob/0.6-dp/Dockerfile)
* [`0.5-dp` (Dockerfile)](https://github.com/yeasy/docker-hyperledger/blob/0.5-dp/Dockerfile)
* [`dev` (Dockerfile)](https://github.com/yeasy/docker-hyperledger/blob/dev/Dockerfile)

For more information about this image and its history, please see the relevant manifest file in the [`yeasy/docker-hyperledger` GitHub repo](https://github.com/yeasy/docker-hyperledger).

# What is docker-hyperledger?
Full functional Docker image with necessary hyperledger fabric binaries (peer, membersrvc) deployed. 

Please use the `dev` tag if you want have a full development env with tools like protoc and NodeJs supports.

# How to use this image?
The docker image is auto built at [https://registry.hub.docker.com/u/yeasy/hyperledger/](https://registry.hub.docker.com/u/yeasy/hyperledger/).

## In Dockerfile
```sh
FROM yeasy/hyperledger:latest
```

## Local Run
The image is only for the base environment. So please refer to [hyperledger-peer](https://hub.docker.com/r/yeasy/hyperledger-peer/) if you want a local run.

# Which image is based on?
The image is built based on [golang:1.6](https://hub.docker.com/_/golang) image.

# What has been changed?
## install dependencies
Install required  libsnappy-dev, zlib1g-dev, libbz2-dev.

## install rocksdb
Install required  rocksdb 4.1.

## install hyperledger
Install hyperledger fabric and install the peer and membersrvc.

# Supported Docker versions

This image is officially supported on Docker version 1.7.0.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# Known Issues
* N/A.

# User Feedback
## Documentation
Be sure to familiarize yourself with the [repository's `README.md`](https://github.com/yeasy/docker-hyperledger/blob/master/README.md) file before attempting a pull request.

## Issues
If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/yeasy/docker-hyperledger/issues).

You can also reach many of the official image maintainers via the email.

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/yeasy/docker-hyperledger/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
