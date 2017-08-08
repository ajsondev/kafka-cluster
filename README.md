# kafka-cluster
docker kafka-cluster

## docker-hub
	https://hub.docker.com/r/sundyli/kafka-cluster/

## usage
	- dataDir: /data/db/

## example
```
id=1   ## the brokerid
host=s1 ## the hostname
zks="s1:2181,s2:2181,s3:2181" ## the zk servers

docker run --net host --name kafka \
	-p 9200:9200 \
	-v /data/db/kafka:/data/db/ \
	-d sundyli/kafka-cluster  ${id} ${host} ${zks}
```
