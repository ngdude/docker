#!/bin/bash
KAFKA_DATA=/opt/kafka/data
if [[ -f ${KAFKA_DATA}/meta.properties ]]
then
echo 'file exist'
else
sed -i "s|log.dirs=/tmp/kraft-combined-logs|log.dirs=${KAFKA_DATA}|" config/kraft/server.properties
sed -i "s|advertised.listeners=PLAINTEXT://localhost:9092|advertised.listeners=PLAINTEXT://kafka:9092|" config/kraft/server.properties
uuid=`./bin/kafka-storage.sh random-uuid`
./bin/kafka-storage.sh format -t $uuid -c config/kraft/server.properties
fi

exec "$@"
