# sbt on OpenJDK 6
#
# The official builds of sbt have to be on Java 6 and so the image.
#
# URL: https://github.com/jaceklaskowski/docker-sbt-openjdk-6
#
# If you're reading this and have any feedback on how this image could be improved,
# please open an issue or a pull request so we can discuss it!

FROM java:6
MAINTAINER Jacek Laskowski <jacek@japila.pl>

ENV SBT_VERSION 0.13.9
ENV BUILD_PATH  /tmp
ENV SBT_SCRIPT  $BUILD_PATH/sbt
ENV PROJECT_DIR $BUILD_PATH/scala-project

LABEL description="Image to have sbt on Java 6" \
      vendor="Japila Software" \
      version="$SBT_VERSION"

RUN curl -Lo $BUILD_PATH/sbt-launch.jar \
  https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar \
  && ls $BUILD_PATH

ADD sbt $SBT_SCRIPT
RUN chmod +x $SBT_SCRIPT
RUN $SBT_SCRIPT about

WORKDIR $PROJECT_DIR

ENTRYPOINT $SBT_SCRIPT
