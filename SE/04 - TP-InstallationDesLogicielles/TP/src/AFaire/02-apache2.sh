#!/bin/bash
clear

##########################################################################
## Programme : 02-apache2.sh                                            ##
## Acces     : SE                                                       ##
## But       : Installation apache2                                     ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de 02-apache2.sh        25/11/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : apt search apache2"
apt search apache2 | grep apache2
echo -e "2 : apt policy apache2"
apt policy apache2

read -p "Press any key to resume ..."
clear
echo -e "\r\n3 : sudo apt install apache2=2.4.52-1ubuntu4 -y"
sudo apt install apache2-bin=2.4.52-1ubuntu4 -y
sudo apt install apache2-data=2.4.52-1ubuntu4 -y
sudo apt install apache2-utils=2.4.52-1ubuntu4 -y
sudo apt install apache2=2.4.52-1ubuntu4 -y

read -p "Press any key to resume ..."
clear
echo -e "4 : sudo apt remove apache2 -y"
sudo apt remove apache2
sudo apt remove apache2-utils
sudo apt remove apache2-data
sudo apt remove apache2-bin

sudo apt autoremove --purge -y
