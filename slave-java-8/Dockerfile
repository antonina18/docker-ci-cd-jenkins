FROM openjdk:8-jre-slim
 
COPY slave8.jar .
COPY wait-for-it.sh .
COPY startup.sh .
RUN chmod u+x startup.sh wait-for-it.sh
 
ENV JENKINS_MASTER_SERVER=jenkins-master
ENV JENKINS_MASTER_PORT=8080
ENV JENKINS_MASTER_JNLP_PORT=50000
ENV SLAVE_NAME=slave-java-8
ENV JENKINS_TOKEN=da41e08b5406fca0e76315df641381752e6faa526ce3d81dc752e4a3c0b385e3
 
CMD ["sh", "./startup.sh"]
