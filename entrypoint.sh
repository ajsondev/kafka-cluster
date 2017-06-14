#!/bin/bash

mkdir -p $dataLogDir

export id=$1
export host=$2
export zks=$3

##build kafka config
kconfig="broker.id=${id}
num.io.threads=8
socket.send.buffer.bytes=102400
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
num.partitions=1
num.recovery.threads.per.data.dir=1
log.retention.hours=12
log.segment.bytes=1073741824
log.retention.check.interval.ms=300000
zookeeper.connection.timeout.ms=6000
auto.leader.rebalance.enable=true
"
kconfig="${kconfig}"$'\n'"advertised.listeners=PLAINTEXT://${host}:9092"
kconfig="${kconfig}"$'\n'"log.dirs=${dataLogDir}"
kconfig="${kconfig}"$'\n'"zookeeper.connect=${zks}"

echo "${kconfig}" > config/server.properties

##start the kafka server
bin/kafka-server-start.sh config/server.properties
