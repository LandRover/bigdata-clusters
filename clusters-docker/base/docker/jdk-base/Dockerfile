FROM debian-base:latest

ENV JAVA_VERSION 8u222b10
ENV JAVA_TAR_URL "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10"

RUN set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
       amd64|x86_64) \
         ESUM='37356281345b93feb4212e6267109b4409b55b06f107619dde4960e402bafa77'; \
         BINARY_URL="${JAVA_TAR_URL}/OpenJDK8U-jdk_x64_linux_hotspot_${JAVA_VERSION}.tar.gz"; \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
    wget -qO - --no-check-certificate ${BINARY_URL} /usr/src/openjdk.tar.gz \
    echo "${ESUM} */usr/src/openjdk.tar.gz" | sha256sum -c -; \
    mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    tar -xf /usr/src/openjdk.tar.gz --strip-components=1; \
    rm -rf /usr/src/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
