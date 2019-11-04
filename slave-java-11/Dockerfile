FROM openjdk:11
 
COPY slave.jar .
COPY startup.sh .
RUN chmod u+x startup.sh
 
ENV JENKINS_MASTER_SERVER=3.122.97.139
ENV JENKINS_MASTER_PORT=8080
ENV JENKINS_MASTER_JNLP_PORT=50000
ENV SLAVE_NAME=slave-java-11
ENV JENKINS_TOKEN=b26ad819e8d4f823302e1ea4abd724e488967130b7910ea7762c4579c80852ee

RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y maven 

RUN curl -sSL https://get.docker.com/ | sh
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo usermod -aG docker root
VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ["sh", "./startup.sh"]
