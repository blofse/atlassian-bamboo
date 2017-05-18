FROM openjdk:8-alpine

# Configuration variables.
ENV BAMBOO_VERSION=6.0.0 \
    BAMBOO_HOME=/var/atlassian/application-data/bamboo \
    BAMBOO_INSTALL=/opt/atlassian/bamboo

RUN set -x
RUN apk add --no-cache libressl
RUN apk add --no-cache wget
RUN apk add --no-cache tar

RUN mkdir -p "${BAMBOO_HOME}"
RUN mkdir -p "${BAMBOO_INSTALL}"

RUN wget -O "atlassian-bamboo-${BAMBOO_VERSION}.tar.gz" --no-verbose "http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz"
RUN tar -xzvf "atlassian-bamboo-${BAMBOO_VERSION}.tar.gz" -C "${BAMBOO_INSTALL}" --strip-components=1

RUN  sed -i 's~bamboo.home=C:/bamboo/bamboo-home~bamboo.home=${BAMBOO_HOME}~g' ${BAMBOO_INSTALL}/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

RUN adduser -D -u 1000 bamboo
RUN chown -R bamboo "${BAMBOO_HOME}"
RUN chown -R bamboo "${BAMBOO_INSTALL}"
RUN chmod -R 700 "${BAMBOO_HOME}"
RUN chmod -R 700 "${BAMBOO_INSTALL}"

# Expose default HTTP connector port.
EXPOSE 8085

# Create the volumes and mount
VOLUME ["${BAMBOO_HOME}"]

WORKDIR ${BAMBOO_HOME}

USER bamboo
CMD ["sh", "-c", "${BAMBOO_INSTALL}/bin/catalina.sh run"]
