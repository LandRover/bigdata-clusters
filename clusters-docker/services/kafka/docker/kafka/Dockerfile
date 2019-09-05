FROM jdk-base:latest

ENV KAFKA_VERSION 2.3.0
ENV SCALA_VERSION 2.12
ENV GLIBC_VERSION 2.29-r0
ENV KAFKA_HOME /opt/kafka

ARG KAFKA_FILE_VERSION=kafka_${SCALA_VERSION}-${KAFKA_VERSION}

ENV PATH=${PATH}:${KAFKA_HOME}/bin

ADD https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_FILE_VERSION}.tgz /usr/src/

# Install
RUN tar -xzf /usr/src/${KAFKA_FILE_VERSION}.tgz -C /opt \
 && ln -s /opt/${KAFKA_FILE_VERSION} ${KAFKA_HOME} \
 && rm -rf /usr/src/${KAFKA_FILE_VERSION}.tgz

# Add files
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD create-topics.sh /usr/bin/create-topics.sh

# Copy helpers
COPY helpers/overrides /opt/overrides

VOLUME ["/kafka"]

WORKDIR ${KAFKA_HOME}

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["/usr/bin/start-kafka.sh"]
