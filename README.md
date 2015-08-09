Build sbt using Docker
==============

The project contains a **Dockerfile** to have [sbt](http://www.scala-sbt.org/) **0.13.8** on **OpenJDK 6** inside a [Docker](https://www.docker.com/) container. The version of Java is crucial as the official builds of sbt require this particular version of Java, namely **6**.

The aim of the project is to be a base for another image for reproducible builds of sbt.

## Configuration

This docker image contains the following software:

* Java: OpenJDK 6
* sbt: 0.13.8

## Dependencies

* [java:6](https://hub.docker.com/r/library/java/)

## Installation

Latest version:

    $ docker pull jaceklaskowski/docker-sbt-openjdk-6:0.13.8

## Run `sbt` REPL

    $ docker run -it --rm jaceklaskowski/docker-sbt-openjdk-6:0.13.8

## Display OpenJDK version

    ➜  docker run -it --rm docker-sbt-openjdk-6:0.13.8 java -version
    java version "1.6.0_35"
    OpenJDK Runtime Environment (IcedTea6 1.13.7) (6b35-1.13.7-1~deb7u1)
    OpenJDK 64-Bit Server VM (build 23.25-b01, mixed mode)

## Build the image (on MacOS)

1. `boot2docker up`

        ➜  docker-builds-sbt git:(master) boot2docker up
        Waiting for VM and Docker daemon to start...
        ................ooooooooo
        Started.

        To connect the Docker client to the Docker daemon, please set:
        unset DOCKER_CERT_PATH
        unset DOCKER_TLS_VERIFY
        export DOCKER_HOST=tcp://192.168.59.103:2375

        Or run: `eval "$(boot2docker shellinit)"`

1. `$(boot2docker shellinit)`

        ➜  docker-builds-sbt git:(master) ✗ $(boot2docker shellinit)

1. `docker build -t docker-sbt-openjdk-6:0.13.8 .`

## Cleanup (to build the image once more)

1. `docker rm -f $(docker ps -aq)`
1. `docker rmi $(docker images -f "dangling=true" -q)`

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).
