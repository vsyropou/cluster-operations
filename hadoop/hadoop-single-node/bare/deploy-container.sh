# docker network create --driver=bridge hadoop

echo "start hadoop-master container..."
docker run -itd \
#        --net=hadoop \
       -p 50070:50070 \
       -p 8088:8088 \
       -p 18080:18080 \
       --name hadoop-single-node \
       --hostname hadoop-master \
       hadoop-single

# docker exec -it hadoop-single-node bash

