Docker image for sbt 0.13.8 on OpenJDK 6
==

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

        ➜  docker-sbt-openjdk-6  docker build -t docker-sbt-openjdk-6:0.13.8 .
        Sending build context to Docker daemon 18.43 kB
        Sending build context to Docker daemon
        Step 0 : FROM java:6
         ---> 999cc805d223
        Step 1 : MAINTAINER Jacek Laskowski <jacek@japila.pl>
        ...
        [info] This is sbt 0.13.8
        [info] The current project is {file:/}root 0.1-SNAPSHOT
        [info] The current project is built against Scala 2.10.4
        [info] Available Plugins: sbt.plugins.IvyPlugin, sbt.plugins.JvmPlugin, sbt.plugins.CorePlugin, sbt.plugins.JUnitXmlReportPlugin
        [info] sbt, sbt plugins, and build definitions are using Scala 2.10.4
         ---> 7288e5d87828
        Removing intermediate container 9a489a8e2bb8
        Step 10 : CMD $SBT_SCRIPT
         ---> Running in 89fd0ce7e71e
         ---> 3248a273e5ad
        Removing intermediate container 89fd0ce7e71e
        Successfully built 3248a273e5ad

## Cleanup (to build the image once more)

1. `docker rm -f $(docker ps -aq)`
1. `docker rmi $(docker images -f "dangling=true" -q)`

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.

## License

This code is open source software licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).
