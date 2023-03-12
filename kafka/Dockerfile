Dockerfile  entrypoint.sh
root@ubuntutest:~/docker/zoo# cat Dockerfile
FROM bellsoft/liberica-openjdk-alpine:17.0.6-10

ENV KAFKA_VERSION 3.3.1
ENV SCALA_VERSION 2.13

LABEL name="kafka" version=${KAFKA_VERSION}

RUN apk update && apk upgrade && apk add bash
RUN cd /tmp && \
    wget https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mkdir -p /opt/kafka && \
    tar -xvf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION}/* /opt/kafka/ && \
    chmod +x /opt/kafka/bin/*.sh && \
    rm -rf /tmp/*
COPY entrypoint.sh /opt/kafka/

RUN chmod +x /opt/kafka/entrypoint.sh

ENV PATH /sbin:/opt/kafka/bin/:$PATH
WORKDIR /opt/kafka

ENTRYPOINT ["./entrypoint.sh"]
CMD ["kafka-server-start.sh", "config/kraft/server.properties"]
