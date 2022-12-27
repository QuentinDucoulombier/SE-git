#!/bin/bash
clear

##########################################################################
## Programme : 02-GLANCES.sh                                            ##
## Acces     : SE                                                       ##
## But       : Installation GLANCES                                     ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de 02-GLANCES.sh        25/11/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : apt search glances"
apt search glances
echo -e "2 : apt policy glances"
apt policy glances
echo -e "\r\n3 : sudo apt install glances glances-doc -y"
sudo apt install glances glances-doc -y

glances

clear
echo -e "4 : sudo apt remove glances glances-doc -y"
sudo apt remove glances glances-doc -y
sudo apt autoremove --purge -y
