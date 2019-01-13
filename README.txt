###

## Install Docker
# See: https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository

$ sudo apt-get update
$ sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
$ echo 'deb https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list
$ apt-get update
$ apt-get install docker-ce

## Install Docker-Compose
# See: https://docs.docker.com/compose/install/#install-compose

$ sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose

## Docker-compose
# the unprivileged elasticsearch user is used within the Elasticsearch image, therefore the mounted data directory must be owned by the uid 1000.

## Pastebin Script
# Yara rules
$ wget https://github.com/VirusTotal/yara/archive/v3.8.1.tar.gz (last releases on: https://github.com/VirusTotal/yara/releases)
$ tar -xvzf v3.4.0.tar.gz
$ cd yara-3.4.0/
$ ./bootstrap.sh
	--> error: ./bootstrap.sh: 2: ./bootstrap.sh: autoreconf: not found
	$ apt-get install autoconf libtool 
$ ./configure
$ make
$ sudo make install

$ apt-get install python3-pip
$ pip3 install yara-python
$ sudo -H pip3 install -U pip
$ sudo -H pip3 install -U yara-python


# Filebeat ??

# addd enough vm memory to run elastic containers
#$sysctl -w vm.max_map_count=262144
