#!/usr/bin/sh
whoami  
java -jar slave.jar -jnlpUrl http://${JENKINS_MASTER_SERVER}:${JENKINS_MASTER_PORT}/computer/${SLAVE_NAME}/slave-agent.jnlp -secret ${JENKINS_TOKEN} -workDir /opt
