# Instructions from here:
# https://docs.docker.com/machine/install-machine/#install-bash-completion-scripts

# install
base=https://github.com/docker/machine/releases/download/v0.15.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

# test
docker-machine version

