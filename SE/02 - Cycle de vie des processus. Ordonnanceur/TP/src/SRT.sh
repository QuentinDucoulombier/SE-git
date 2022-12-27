#!/bin/bash
clear

##########################################################################
## Programme : SRT.sh                                                   ##
## Acces     : SE                                                       ##
## But       : Edition, Compilation, Exécution d'un programme           ##
##             Edition   : vi SRT.c                                     ##
##             Compil.   : gcc SRT.c -o SRT                             ##
##             Exécution : ./start                                      ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de SRT.sh               30/08/2022  1.0.00   Alain          ##
## #!/usr/bin/sh -> #!/bin/bash     19/09/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : Programmation du source (vi SRT.c ou gedit SJC.c)\r\n"
#vi SRT.c
#cat SRT.c

echo -e "2 : Compilation du source (gcc SRT.c -o SRT)\r\n"
gcc SRT.c -o SRT

echo -e "3 : Execution (./SRT)\r\n"
./SRT
