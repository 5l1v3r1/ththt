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

# Filebeat ??
