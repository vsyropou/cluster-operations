
echo creating topic
docker run --rm \
       --hostname create \
       --network kafka \
       ches/kafka kafka-topics.sh \
       --create \
       --topic panagia \
       --replication-factor 1 \
       --partitions 1 \
       --zookeeper zoomin1:2181

echo list topics
docker run --rm \
       --hostname list \
       --network kafka \
       ches/kafka kafka-topics.sh \
       --list \
       --zookeeper zoomin1:2181

echo creating publisher
docker run --rm --interactive \
       --hostname publisher1 \
       --network kafka \
       ches/kafka kafka-console-producer.sh \
       --topic panagia \
       --broker-list kafka1:9092

echo creating consumer
docker run --rm \
       --hostname consumer1 \
       --network kafka \
       ches/kafka kafka-console-consumer.sh \
       --topic panagia \
       --from-beginning \
       --zookeeper zoomin1:2181

echo creating funky publisher
docker run --rm --interactive \
       --hostname publisher2 \
       --network kafka \
       ches/kafka kafka-console-producer.sh \
       --topic panagia \
       --broker-list kafka1:9092 kafka2:9092

echo list broksers
docker exec -it \
       zoomgr2 bash -c "bin/zkCli.sh  ls /brokers"

 
