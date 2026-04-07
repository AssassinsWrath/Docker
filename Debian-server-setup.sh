### Initial OS setup files (based on Debian server install) Hopefully I can make this into a bash script to run after initial install
sudo apt update
sudo apt install fastfetch
sudo apt install rsync

############################

### DOCKER Installation
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# check docker installation successful and running
sudo systemctl status docker
# if above shows docker is not running then run:
sudo systemctl start docker

# verify docker works
sudo docker run hello-world

#### update docker engine by repeating command below:
#sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# to run docker commands with having to use sudo, follow below:
#create unix group: docker
sudo groupadd docker

# Add user to docker group
sudo usermod -aG docker $USER

# activate group changes without logging off & on
newgrp docker

# Verify that you can run docker commands without sudo.
docker run hello-world

# On Debian and Ubuntu, the Docker service starts on boot by default. To automatically start Docker and containerd on boot for other Linux distributions using systemd, run the following commands (remove #).
# sudo systemctl enable docker.service
# sudo systemctl enable containerd.service

#######################

### prep stack file system:
## for Audiobookshelf
sudo mkdir -p /container_data/audiobookshelf/audiobooks /container_data/audiobookshelf/config /container_data/audiobookshelf/config /container_data/audiobookshelf/metadata /container_data/audiobookshelf/podcasts
## for Maintainaar
sudo mkdir -p /container_data/maintainaar
## for zigbee2mqtt (likely not going to be using any zigbee devices though
#sudo mkdir -p /container_data/zigbee2mqtt
# for media stack (Radarr, Sonarr, Lidarr, sabnzbd (binary newsreader)
sudo mkdir -p /container_data/media/Downloads /container_data/media/lidarr /container_data/media/radarr /container_data/media/sonarr /container_data/media/Movies /container_data/media/TV /container_data/media/plex /container_data/media/sabnzbd
# for mincraft and bedrock server
sudo mkdir -p /container_data/minecraft /container_data/bedrock-server
