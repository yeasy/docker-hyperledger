Docker-Hyperledger
===
Docker images for [Hyperledger](https://www.hyperledger.org).


# Supported tags and respective Dockerfile links

* [`0.1, latest` (latest/Dockerfile)](https://github.com/yeasy/docker-hyperledger/blob/master/Dockerfile)

For more information about this image and its history, please see the relevant manifest file in the [`yeasy/docker-hyperledger` GitHub repo](https://github.com/yeasy/docker-hyperledger).

# What is docker-hyperledger?
Docker image with hyperledger deployed. 


# How to use this image?
The docker image is auto built at [https://registry.hub.docker.com/u/yeasy/hyperledger/](https://registry.hub.docker.com/u/yeasy/hyperledger/).


## In Dockerfile
```sh
FROM yeasy/hyperledger:latest
```

## Local Run
```sh
$ docker run -it yeasy/hyperledger hyperledger
```

# Which image is based on?
The image is built based on [golang:1.6](https://hub.docker.com/_/golang) image.

# What has been changed?
## install libpcap
Install required  libpcap 0.8.

## install hyperledger
Install hyperledger 1.0.1-x86_64 versin.

## add default conf file
Add the hyperledger.yml to /etc/hyperledger/.

## download geo data
Download [geodata](http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz) and put as `/usr/share/GeoIP/GeoLiteCity.dat`.

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
