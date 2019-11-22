FROM docker:stable

RUN adduser -G root -D jenkins \
 && apk --update --no-cache add openjdk8-jre curl git

# All versions here: https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/
ARG SWARM_CLIENT_VERSION=3.17
ARG URL_PATH=${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar

RUN curl -o /home/jenkins/swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${URL_PATH} \
 && ls -l /home/jenkins

CMD java -jar /home/jenkins/swarm-client.jar ${COMMAND_OPTIONS}