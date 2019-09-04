FROM jdk-base:latest

ENV ZOOKEEPER_VERSION 3.5.5
ARG ZOOKEEPER_DIR=apache-zookeeper-${ZOOKEEPER_VERSION}-bin
ARG ZOOKEEPER_HOME=/opt/apache-zookeeper
ARG ZOOKEEPER_HOME_VER=/opt/${ZOOKEEPER_DIR}

# Zookeeper setup
ADD https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${ZOOKEEPER_DIR}.tar.gz /usr/src/
ADD https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${ZOOKEEPER_DIR}.tar.gz.sha512 /usr/src/

# Verify files
RUN cd /usr/src/ && sha512sum -c /usr/src/${ZOOKEEPER_DIR}.tar.gz.sha512

# Install
RUN tar -xzf /usr/src/${ZOOKEEPER_DIR}.tar.gz -C /opt

# Cleaner link
RUN ln -s ${ZOOKEEPER_HOME_VER} ${ZOOKEEPER_HOME}

# Cleanup src files
RUN rm -rf /usr/src/${ZOOKEEPER_DIR}.tar.gz /usr/src/${ZOOKEEPER_DIR}.tar.gz.sha512

# Copy config file
RUN mv ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg ${ZOOKEEPER_HOME}/conf/zoo.cfg

RUN sed -i "s|/tmp/zookeeper|$ZOOKEEPER_HOME/data|g" ${ZOOKEEPER_HOME}/conf/zoo.cfg \
 && mkdir ${ZOOKEEPER_HOME}/data

# Add start file
ADD start-zookeeper.sh /usr/bin/start-zookeeper.sh

EXPOSE 2181 2888 3888

WORKDIR ${ZOOKEEPER_HOME}

VOLUME ["${ZOOKEEPER_HOME}/conf", "${ZOOKEEPER_HOME}/data"]

CMD ["/bin/bash", "/usr/bin/start-zookeeper.sh"]
