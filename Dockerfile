FROM openjdk:13-jdk-alpine

LABEL maintainer "Sean Mehrabi - Cloud Architect Expert"

RUN apk add --update \
  bash \
  curl \
  && rm -rf /var/cache/apk/*

ENV PATH $PATH:/liquibase

ENV LIQUIBASE_VERSION 3.8.4

RUN mkdir -p /liquibase \
    && curl -L https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz \
    | tar xzC /liquibase

COPY ./lib /liquibase/lib/

ENTRYPOINT ["liquibase"]
CMD ["--version"]
