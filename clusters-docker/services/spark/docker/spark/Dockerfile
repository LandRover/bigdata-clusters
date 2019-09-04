FROM jdk-base:latest

LABEL version="0.1.0"

ENV DAEMON_RUN=true
ENV SPARK_VERSION=2.4.3
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.13.0
ENV SCALA_HOME=/usr/share/scala
ENV SPARK_HOME=/spark
ENV SBT_VERSION=1.2.8

RUN apt update && apt install -q -y  software-properties-common jq

# Scala installation
ADD https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz /usr/src

RUN cd "/usr/src" \
    && tar xzf "scala-${SCALA_VERSION}.tgz" \
    && mkdir "${SCALA_HOME}" \
    && rm "/usr/src/scala-${SCALA_VERSION}/bin/"*.bat \
    && mv "/usr/src/scala-${SCALA_VERSION}/bin" "/usr/src/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" \
    && ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" \
    && rm -rf "/usr/src/"*


# Python installation (PySpark Dependencies)
RUN apt install -q -y  python3 python3-pip python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy
RUN update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1


# sbt installation
RUN export PATH="/usr/local/sbt/bin:$PATH" \
    && mkdir -p "/usr/local/sbt" \
    && wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && sbt sbtVersion


# Spark installation
RUN wget --no-verbose http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz


# Fix the value of PYTHONHASHSEED (this is needed when you use Python 3.3 or greater)
ENV PYTHONHASHSEED 1
