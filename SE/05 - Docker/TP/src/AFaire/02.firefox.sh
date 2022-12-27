#!/bin/bash
clear

##########################################################################
## Programme : 01.firefox.sh                                            ##
## Acces     : SE                                                       ##
## But       : Utilise docker pour lancer firefox                       ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de 01.firefox.sh        25/11/2022  1.0.00   Alain          ##
##########################################################################

#https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04
apt install software-properties-common
#sudo snap remove firefox
#sudo add-apt-repository ppa:mozillateam/ppa

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 
'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";
' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt install firefox

xhost +
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ubuntu /bin/bash
#docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox


#sudo docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --net=host mtabishk/firefox:v1.0.0

#docker run -d --name firefox -v /tmp/.X11-unix:/tmp/.X11-unix \
#    -v /home/hybris/.mozilla:/home/hybris/.mozilla \
#    -v /home/hybris/Downloads:/home/hybris/Downloads \
#    hybris:firefox
## firefox container should be launched before using this script
#if ! docker inspect firefox > /dev/null 2>&1; then
#    docker run --rm -d --name firefox -v /tmp/.X11-unix:/tmp/.X11-unix \
#    -v /home/hybris/.mozilla:/home/hybris/.mozilla \
#    -v /home/hybris/Downloads:/home/hybris/Downloads hybris:firefox
#fi
#if ! docker top firefox > /dev/null 2>&1; then
#    docker start firefox
#fi
#if [ $# -ne 0 ]; then
#    for i in $@; do
#        docker exec firefox iceweasel "$i"
#    done
#fi
