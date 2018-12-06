# instructons from here:
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository

# prepare
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# confirm fingerprint
sudo apt-key fingerprint 0EBFCD88
echo "this must be equal to"
echo "pub   4096R/0EBFCD88 2017-02-22"
echo "      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"
echo "uid                  Docker Release (CE deb) <docker@docker.com>"
echo "sub   4096R/F273FCD8 2017-02-22"

# add repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install
sudo apt-get update
sudo apt-get install docker-ce

# test
sudo docker run hello-world

# optional post install stuff
# https://docs.docker.com/install/linux/linux-postinstall/#ip-forwarding-problems
