#!/bin/bash
clear



echo -e "1 : Programmation du source (vi 05-waitProcessus.c)\r\n"
vi 05-waitProcessus.c
cat 05-waitProcessus.c

echo -e "\r\n2 : Compilation du source (gcc 05-waitProcessus.c -o 04-forkPrimitifs)\r\n"
gcc 05-waitProcessus.c -o 05-waitProcessus

echo -e "3 : Execution (./01-InfosProcessus)"
./05-waitProcessus