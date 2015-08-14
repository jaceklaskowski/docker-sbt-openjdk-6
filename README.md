Docker image for sbt 0.13.9 on OpenJDK 6
==

The project contains a **Dockerfile** to have [sbt](http://www.scala-sbt.org/) **0.13.9** on **OpenJDK 6** inside a [Docker](https://www.docker.com/) container. The version of Java is crucial as the official builds of sbt require this particular version of Java, namely **6**.

The aim of the project is to be a base for another image for reproducible builds of sbt.

## Configuration

This docker image contains the following software:

* Java: OpenJDK 6
* sbt: 0.13.9

## Dependencies

* [java:6](https://hub.docker.com/r/library/java/)

## Installation

Latest version:

    $ docker pull jaceklaskowski/docker-sbt-openjdk-6:0.13.9

## Run `sbt` REPL

    $ docker run -ti --rm --name=sbt jaceklaskowski/docker-sbt-openjdk-6:0.13.9

## Display OpenJDK version

    ➜  docker run -it --entrypoint=/bin/sh --rm docker-sbt-openjdk-6:0.13.9 java -version
    java version "1.6.0_35"
    OpenJDK Runtime Environment (IcedTea6 1.13.7) (6b35-1.13.7-1~deb7u1)
    OpenJDK 64-Bit Server VM (build 23.25-b01, mixed mode)

## Build the image

    ➜  docker-sbt-openjdk-6 git:(master) ✗ docker build -t docker-sbt-openjdk-6:0.13.9 .
    Sending build context to Docker daemon 97.28 kB
    Step 0 : FROM java:6
     ---> 999cc805d223
    Step 1 : MAINTAINER Jacek Laskowski <jacek@japila.pl>
    ...
    [info] This is sbt 0.13.9
    [info] The current project is {file:/}root 0.1-SNAPSHOT
    [info] The current project is built against Scala 2.10.5
    [info] Available Plugins: sbt.plugins.IvyPlugin, sbt.plugins.JvmPlugin, sbt.plugins.CorePlugin, sbt.plugins.JUnitXmlReportPlugin
    [info] sbt, sbt plugins, and build definitions are using Scala 2.10.5
     ---> b88e2460537d
    Removing intermediate container 62e194b923c0
    Step 11 : WORKDIR $PROJECT_DIR
     ---> Running in 001b1b884b46
     ---> 6df9b59ca4e9
    Removing intermediate container 001b1b884b46
    Step 12 : ENTRYPOINT $SBT_SCRIPT
     ---> Running in b5c03b3c42c4
     ---> c5b7c1b6e7e0
    Removing intermediate container b5c03b3c42c4
    Successfully built c5b7c1b6e7e0

## Cleanup (to build the image once more)

1. `docker rm -f $(docker ps -aq)`
1. `docker rmi $(docker images -f "dangling=true" -q)`

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).
