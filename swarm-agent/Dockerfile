FROM docker:stable

RUN adduser -G root -D jenkins \
 && apk --update --no-cache add openjdk11-jre curl git

## Install Kubectl
ARG KUBECTL_VERSION=v1.22.13
ARG KUBECTL_SHA256=b96d2bc9137ec63546a29513c40c5d4f74e9f89aa11edc15e3c2f674d5fa3e02
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && echo "${KUBECTL_SHA256}  kubectl" | sha256sum -c \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl

## Install Kustomize
ARG KUSTOMIZE_VERSION=v5.0.1
ARG KUSTOMIZE_SHA256=dca623b36aef84fbdf28f79d02e9b3705ff641424ac1f872d5420dadb12fb78d
RUN curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
 && echo "${KUSTOMIZE_SHA256}  kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" | sha256sum -c \
 && tar -xvf kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
 && chmod +x ./kustomize \
 && mv ./kustomize /usr/local/bin/kustomize \
 && rm kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz

## Install Jenkins Swarm Client
# All versions here: https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/
ARG SWARM_CLIENT_VERSION=3.39
ARG URL_PATH=${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar
RUN curl -o /home/jenkins/swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${URL_PATH} \
 && ls -l /home/jenkins

CMD java -jar /home/jenkins/swarm-client.jar ${COMMAND_OPTIONS}
