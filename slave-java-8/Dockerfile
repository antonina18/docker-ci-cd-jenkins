FROM openjdk:8-jre-slim
 
COPY slave.jar .
COPY startup.sh .
RUN chmod u+x startup.sh
 
ENV JENKINS_MASTER_SERVER=3.122.97.139
ENV JENKINS_MASTER_PORT=8080
ENV JENKINS_MASTER_JNLP_PORT=50001
ENV SLAVE_NAME=slave-java-8
ENV JENKINS_TOKEN=da41e08b5406fca0e76315df641381752e6faa526ce3d81dc752e4a3c0b385e3

RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y maven 
 
CMD ["sh", "./startup.sh"]
