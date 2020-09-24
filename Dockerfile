ARG OS_TYPE=alpine-jre
ARG JDK_VERSION=openjdk8
FROM adoptopenjdk/${JDK_VERSION}:${OS_TYPE}
COPY target/vestige /opt/vestige/
COPY target/repository /root/.m2/repository/
COPY src/logback.xml /root/.config/vestige/logback.xml
RUN ln -s /root/.m2/repository/ /opt/vestige/repository \
 && apk add --no-cache bash \
 && export VESTIGE_STOP_AFTER_START=true \
 && export VESTIGE_ADMIN_WEB_ENABLED=false \
 && /opt/vestige/vestige \
 && sed -i 's/VESTIGE_ADMIN_WEB_ENABLED:-true/VESTIGE_ADMIN_WEB_ENABLED:-false/' /root/.config/vestige/settings.xml
CMD /opt/vestige/vestige

