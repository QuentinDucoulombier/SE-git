#!/bin/bash
clear

##########################################################################
## Programme : 01-InfosProcessus.sh                                     ##
## Acces     : SE                                                       ##
## But       : Edition, Compilation, Ex�cution d'un programme           ##
##             Edition   : vi 01-InfosProcessus.c                       ##
##             Compil.   : gcc 01-InfosProcessus.c -o 01-InfosProcessus ##
##             Ex�cution : ./start                                      ##
##                                                                      ##
## Arguments                                                            ##
## - IN      : neant                                                    ##
## - IN#OUT  : neant                                                    ##
## - OUT     : neant                                                    ##
## Retour    : neant                                                    ##
##                                                                      ##
## Historique                       Date        Version  par            ##
## Cr�ation 01-InfosProcessus.sh    30/08/2022  1.0.00   Alain          ##
## #!/usr/bin/sh -> #!/bin/bash     19/09/2022  1.0.00   Alain          ##
##########################################################################

echo -e "1 : Programmation du source (vi 01-InfosProcessus.c)\r\n"
//vi 01-InfosProcessus.c
cat 01-InfosProcessus.c

echo -e "\r\n2 : Compilation du source (gcc 01-InfosProcessus.c -o 01-InfosProcessus)\r\n"
gcc 01-InfosProcessus.c -o 01-InfosProcessus

echo -e "3 : Execution (./01-InfosProcessus)"
./01-InfosProcessus
