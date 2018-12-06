eval $(docker-machine env manager1)
docker rm -f zoomgr1

eval $(docker-machine env manager2)
docker rm -f zoomgr2


eval $(docker-machine env minion1)
docker rm -f zoomin1
docker rm -f kafka1

eval $(docker-machine env minion2)
docker rm -f zoomin2



