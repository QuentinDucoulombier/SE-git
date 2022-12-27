#!/bin/bash
clear

##########################################################################
## Programme : FCFS.sh                                                  ##
## Acces     : SE                                                       ##
## But       : Edition, Compilation, Exécution d'un programme           ##
##             Edition   : vi FCFS.c                                    ##
##             Compil.   : gcc FCFS.c -o FCFS                           ##
##             Exécution : ./start                                      ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de FCFS.sh              30/08/2022  1.0.00   Alain          ##
## #!/usr/bin/sh -> #!/bin/bash     19/09/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : Programmation du source (vi FCFS.c ou gedit FCFS.c)"
#vi FCFS.c
#cat FCFS.c

echo -e "\r\n2 : Compilation du source (gcc FCFS.c -o FCFS)\r\n"
gcc FCFS.c -o FCFS

echo -e "3 : Execution (./FCFS)\r\n"
./FCFS
