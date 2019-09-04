FROM debian-base:latest

ARG JDK_VERSION=8u222-b10
ARG JDK_VERSION_STRICT=8u222b10
ARG JDK_FILENAME="OpenJDK8U-jdk_x64_linux_hotspot_${JDK_VERSION_STRICT}.tar.gz"

ADD https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk${JDK_VERSION}/${JDK_FILENAME} /usr/src/
ADD https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk${JDK_VERSION}/${JDK_FILENAME}.sha256.txt /usr/src/

# Verify files
RUN cd /usr/src && sha256sum -c /usr/src/${JDK_FILENAME}.sha256.txt

# Install
RUN mkdir -p /opt/java/openjdk-${JDK_VERSION} \
 && tar -xf /usr/src/${JDK_FILENAME} --strip-components=1 -C /opt/java/openjdk-${JDK_VERSION} \
 && ln -s /opt/java/openjdk-${JDK_VERSION} /opt/java/openjdk \
 && rm -rf /usr/src/${JDK_FILENAME} /usr/src/${JDK_FILENAME}.sha256.txt

# Set global path for java
ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
