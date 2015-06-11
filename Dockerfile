FROM java:8

MAINTAINER Christophe Labouisse <consulting@labouisse.com>

ENV HOME /spring-boot

# Can be redefined in the derived images
ENV SB_APP_JAR spring-boot-app.jar
ENV SB_ACTIVE_PROFILES docker

RUN mkdir -p $HOME/bin && mkdir -p $HOME/lib && mkdir -p $HOME/config \
  && mkdir -p /usr/local/bin

# Define working directory.
WORKDIR $HOME

EXPOSE 8080

ADD docker-entry-point.sh /usr/local/bin/docker-entry-point.sh

RUN groupadd default && useradd -g default default

ONBUILD ADD spring-boot-app $HOME

# Define default command.
ENTRYPOINT [ "/usr/local/bin/docker-entry-point.sh" ]
