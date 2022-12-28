#!/bin/bash
clear



echo -e "1 : Programmation du source (vi 04-forkPrimitifs.c)\r\n"
//vi 04-forkPrimitifs.c
cat 04-forkPrimitifs.c

echo -e "\r\n2 : Compilation du source (gcc 04-forkPrimitifs.c -o 04-forkPrimitifs)\r\n"
gcc 04-forkPrimitifs.c -o 04-forkPrimitifs

echo -e "3 : Execution (./01-InfosProcessus)"
./04-forkPrimitifs