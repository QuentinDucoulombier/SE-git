#!/bin/bash
clear

##########################################################################
## Programme : 00-start.sh                                              ##
## Acces     : SE                                                       ##
## But       : Edition, Compilation, Exécution d'un programme           ##
##             Edition   : vi 00-start.c                                ##
##             Compil.   : gcc 00-start.c -o 00-start                   ##
##             Exécution : ./start                                      ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de 00-start.sh          30/08/2022  1.0.00   Alain          ##
## #!/usr/bin/sh -> #!/bin/bash     19/09/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : Programmation du source (vi 00-start.c)\r\n"
vi 00-start.c
cat 00-start.c

echo -e "\r\n2 : Compilation du source (gcc 00-start.c -o 00-start)\r\n"
gcc 00-start.c -o 00-start

echo -e "3 : Execution (./00-start)"
./00-start
