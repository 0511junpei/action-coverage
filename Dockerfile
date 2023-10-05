# Container image that runs your code
FROM alpine:3.10
RUN wget -q https://github.com/jacoco/jacoco/releases/download/v0.8.10/jacoco-0.8.10.zip \
 && unzip jacoco-0.8.10.zip
RUN wget -q https://github.com/apache/maven/archive/refs/tags/maven-3.9.4.zip \
 && unzip maven-3.9.4.zip

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# permission denied問題の解決に必須
# https://stackoverflow.com/questions/54336677/error-starting-container-process-caused-exec-docker-entrypoint-sh-permi
RUN ["chmod", "+x", "entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
