
# add restart unles sstoped flags
# deply them as services so that they respawn when they fail
eval $(docker-machine env manager1)
docker run -d \
       --name zoomgr1 \
       --hostname zoomgr1 \
       --network kafka \
       -p 2181:2181 \
       -e ZOO_MY_ID=1 \
       -e ZOO_SERVERS="server.1=0.0.0.0:2888:3888 server.2=zoomgr2:2888:3888 server.3=zoomin1:2888:3888 server.4=zoomin2:2888:3888" \
       zookeeper



eval $(docker-machine env manager2)
docker run -d \
       --name zoomgr2 \
       --hostname zoomgr2 \
       --network kafka \
       -p 2181:2181 \
       -e ZOO_MY_ID=2 \
       -e ZOO_SERVERS="server.1=zoomgr1:2888:3888 server.2=zoomgr2:2888:3888 server.3=zoomin1:2888:3888 server.4=zoomin2:2888:3888" \
       zookeeper



eval $(docker-machine env minion1)
docker run -d \
       --name zoomin1 \
       --hostname zoomin1 \
       --network kafka \
       -p 2181:2181 \
       -e ZOO_MY_ID=3 \
       -e ZOO_SERVERS="server.1=zoomgr1:2888:3888 server.2=zoomgr2:2888:3888 server.3=zoomin1:2888:3888 server.4=zoomin2:2888:3888" \
       zookeeper




eval $(docker-machine env minion2)
docker run -d \
       --name zoomin2 \
       --hostname zoomin2 \
       --network kafka \
       -p 2181:2181 \
       -e ZOO_MY_ID=4 \
       -e ZOO_SERVERS="server.1=zoomgr1:2888:3888 server.2=zoomgr2:2888:3888 server.3=zoomin1:2888:3888 server.4=zoomin2:2888:3888" \
       zookeeper


