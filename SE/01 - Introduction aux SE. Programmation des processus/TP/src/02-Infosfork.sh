#!/bin/bash
clear



echo -e "1 : Programmation du source (vi 02-Infosfork.c)\r\n"
vi 02-Infosfork.c
cat 02-Infosfork.c

echo -e "\r\n2 : Compilation du source (gcc 02-Infosfork.c -o 02-Infosfork)\r\n"
gcc 02-Infosfork.c -o 02-Infosfork

echo -e "3 : Execution (./01-InfosProcessus)"
./02-Infosfork