

eval $(docker-machine env minion1)
docker run -d \
       --name kafka1 \
       --hostname kafka1 \
       --network kafka \
       -p 7203:7203 \
       -p 9092:9092 \
       -e KAFKA_ADVERTISED_HOST_NAME=kafka1 \
       -e ZOOKEEPER_IP=zoomin1 \
       ches/kafka

eval $(docker-machine env minion2)
docker run -d \
       --name kafka2 \
       --hostname kafka2 \
       --network kafka \
       -p 7203:7203 \
       -p 9092:9092 \
       -e KAFKA_ADVERTISED_HOST_NAME=kafka2 \
       -e ZOOKEEPER_IP=zoomin1 \
       ches/kafka
