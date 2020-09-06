ARG OS_TYPE=alpine-jre
ARG JDK_VERSION=openjdk8
FROM adoptopenjdk/${JDK_VERSION}:${OS_TYPE}
COPY target/vestige /opt/vestige/
RUN apk add --no-cache bash
CMD /opt/vestige/vestige

