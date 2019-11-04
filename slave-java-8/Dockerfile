FROM openjdk:8
 
COPY slave.jar .
COPY startup.sh .
RUN chmod u+x startup.sh
 
ENV JENKINS_MASTER_SERVER=3.122.97.139
ENV JENKINS_MASTER_PORT=8080
ENV JENKINS_MASTER_JNLP_PORT=50001
ENV SLAVE_NAME=slave-java-8
ENV JENKINS_TOKEN=da41e08b5406fca0e76315df641381752e6faa526ce3d81dc752e4a3c0b385e3

RUN apt-get update && apt-get install -y git
ENV MAVEN_VERSION 3.3.9

RUN mkdir -p /usr/share/maven
RUN apt-get update && apt-get -y install curl
RUN curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven 
 
CMD ["sh", "./startup.sh"]
