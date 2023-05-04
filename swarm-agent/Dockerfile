FROM docker:stable

RUN adduser -G root -D jenkins \
 && apk --update --no-cache add openjdk11-jre curl git

## Install Kubectl
ARG KUBECTL_VERSION=v1.22.13
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && curl -LO https://dl.k8s.io/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256 \
 && echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin/kubectl \
 && rm kubectl.sha256

## Install Kustomize
ARG KUSTOMIZE_VERSION=v5.0.1
RUN curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
 && curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/checksums.txt \
 && grep kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz checksums.txt > kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz.sha256sum \
 && sha256sum -c kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz.sha256sum \
 && tar -xvf kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
 && chmod +x ./kustomize \
 && mv ./kustomize /usr/local/bin/kustomize \
 && rm checksums.txt kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz.sha256sum kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz

## Install Jenkins Swarm Client
# All versions here: https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/
ARG SWARM_CLIENT_VERSION=3.39
ARG URL_PATH=${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar
RUN curl -o /home/jenkins/swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${URL_PATH} \
 && ls -l /home/jenkins

CMD java -jar /home/jenkins/swarm-client.jar ${COMMAND_OPTIONS}
