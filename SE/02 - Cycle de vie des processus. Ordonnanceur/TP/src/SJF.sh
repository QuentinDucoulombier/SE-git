#!/bin/bash
clear

##########################################################################
## Programme : SJF.sh                                                   ##
## Acces     : SE                                                       ##
## But       : Edition, Compilation, Exécution d'un programme           ##
##             Edition   : vi SJF.c                                     ##
##             Compil.   : gcc SJF.c -o SJF                             ##
##             Exécution : ./start                                      ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Création de SJF.sh               30/08/2022  1.0.00   Alain          ##
## #!/usr/bin/sh -> #!/bin/bash     19/09/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : Programmation du source (vi SJF.c ou gedit SJC.c)\r\n"
#vi SJF.c
#cat SJF.c

echo -e "2 : Compilation du source (gcc SJF.c -o SJF)\r\n"
gcc SJF.c -o SJF

echo -e "3 : Execution (./SJF)\r\n"
./SJF
