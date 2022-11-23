FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y curl docker
RUN jenkins-plugin-cli --plugins docker-build-publish
