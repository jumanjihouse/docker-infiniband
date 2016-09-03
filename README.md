Infiniband base image
=====================


[![download size](https://images.microbadger.com/badges/image/jumanjiman/infiniband.svg)](http://microbadger.com/images/jumanjiman/infiniband "View on microbadger.com")
[![version](https://images.microbadger.com/badges/version/jumanjiman/infiniband.svg)](http://microbadger.com/images/jumanjiman/infiniband "View on microbadger.com")
[![license](https://images.microbadger.com/badges/license/jumanjiman/infiniband.svg)](http://microbadger.com/images/jumanjiman/infiniband "View on microbadger.com")
[![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/infiniband.svg)](https://registry.hub.docker.com/u/jumanjiman/infiniband)&nbsp;
[![Circle CI](https://circleci.com/gh/jumanjihouse/docker-infiniband.png?circle-token=1b2edb8b3686250c5116786aaf8f87e22b257d84)](https://circleci.com/gh/jumanjihouse/docker-infiniband/tree/master 'View CI builds')

Project URL: [https://github.com/jumanjihouse/docker-infiniband](https://github.com/jumanjihouse/docker-infiniband)
<br />
Docker hub: [https://registry.hub.docker.com/u/jumanjiman/infiniband/](https://registry.hub.docker.com/u/jumanjiman/infiniband/)


Overview
--------

This is intended to be a base image for other infiniband-related images,
such as https://github.com/jumanjihouse/docker-opensm


### Build integrity

The repo is set up to build the image on CircleCI.

![workflow](assets/docker_hub_workflow.png)

An unattended test harness runs simple test scripts.
If all tests pass on master branch in the unattended test harness,
it pushes the built images to the Docker hub.


How-to
------


### Build locally

:warning: Build requires Docker 1.9.0 or higher for `--build-arg`.

On a host with Docker:

    script/build


### Pull an already-built image

These images are built as part of the test harness on CircleCI.
If all tests pass on master branch, then the image is pushed into the docker hub.

    docker pull jumanjiman/infiniband:latest

Tags:

* Optimistic
  - `jumanjiman/infiniband:6`
  - `jumanjiman/infiniband:7`
  - `jumanjiman/infiniband:latest` (same as `jumanjiman/infiniband:7`)

* Pessimistic
  - `jumanjiman/infiniband:6-${build_date_time}-${git_hash}`
  - `jumanjiman/infiniband:7-${build_date_time}-${git_hash}`

We push the tags automatically from the test harness, and
we occasionally delete old tags from the Docker hub by hand.


### Run an image

On a host with Docker:

    docker run -d \
      --name infiniband.service
      --read-only \
      --memory=10G \
      --privileged \
      --net=host \
      -v /lib/modules:/lib/modules:ro \
      jumanjiman/infiniband \
      bash


### Run diagnostics

The image contains useful infiniband diagnostic utilities from these packages:

* ibutils
* infiniband-diags
* qperf

You can run the tools in two ways:

* Enter a running infiniband container via `docker exec -it <cid> bash`
  and call the utils directly.

* Start a fresh container with something like:

  ```
  docker run --rm -it --net=host --privileged --entrypoint bash jumanjiman/infiniband
  ```

Sample output from `ibnetdiscover` (one of the utils) is shown at
[`test/ibnetdiscover.out`](test/ibnetdiscover.out).


### Test

Run the test harness:

    script/test

The test harness requires [BATS](https://github.com/sstephenson/bats).

:warning: I need to figure out how to run acceptance tests
on a host without infiniband devices (such as CircleCI).


License
-------

See [LICENSE](LICENSE).
