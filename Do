FROM openjdk:8-jdk-alpine

# All versions here: https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/
ARG SWARM_CLIENT_VER=3.17

RUN apk --no-cache add curl maven git docker

RUN mkdir /workspace \
 && chmod 777 /workspace

RUN curl -o swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VER}/swarm-client-${SWARM_CLIENT_VER}.jar

CMD java -jar swarm-client.jar
