
eval $(docker-machine env manager1)
docker swarm init --advertise-addr 192.168.99.100


eval $(docker-machine env manager2)

docker swarm join --token manager


eval $(docker-machine env minion1)

docker swarm join --token manager


eval $(docker-machine env minion2)

docker swarm join --token manager


docker network create --driver overlay kafka
