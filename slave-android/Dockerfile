FROM ubuntu:18.04
 
COPY slave.jar .
COPY startup.sh .
RUN chmod u+x startup.sh
 
ENV JENKINS_MASTER_SERVER=3.122.97.139
ENV JENKINS_MASTER_PORT=8080
ENV JENKINS_MASTER_JNLP_PORT=50002
ENV SLAVE_NAME=slave-android
ENV JENKINS_TOKEN=b0ba4d14636d31570318692b2e214cfbdb6e221b5351f263bff75e2c806dd730

ENV VOLUME /volume
ENV JENKINS_HOME $VOLUME/jenkins
ENV ANDROID_HOME $VOLUME/android/sdk
ENV ANDROID_KEYSTORE $VOLUME/android/keystore
ENV SYNC_HOME $VOLUME/sync

COPY volume/ /volume/
COPY setup_environment.sh .
RUN chmod 777 setup_environment.sh
RUN ls -al
RUN ./setup_environment.sh

CMD ["sh", "./startup.sh"]
