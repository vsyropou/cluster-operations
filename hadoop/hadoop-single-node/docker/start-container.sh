# docker network create --driver=bridge hadoop

echo "start hadoop-master container..."
docker run -itd \
       -p 50070:50070 \
       -p 8088:8088 \
       --name hadoop-master \
       --net=hadoop \
       --hostname hadoop-master \
       hadoop-master

#   --volume data:/hadoop/hdfs/data \
  #    -p 18080:18080 \
# -p 4040:4040
