# instructions from here:
# https://websiteforstudents.com/install-virtualbox-latest-on-ubuntu-16-04-lts-17-04-17-10/

# add repo
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'

# prep install
sudo apt remove virtualbox virtualbox-5.1

sudo apt update
sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms

# install
sudo apt update
sudo apt-get install virtualbox-5.2
