######################################################################
##   Conversion de Variables.c (développé par Alain Bertails)       ##
##                          en python                               ##
##                                                                  ##
## But : Affiche les informations sur le processus et son fils      ##
##       Exécution : python3 04-Variables.py                        ##
##                                                                  ##
## Historique             Date         Version        Par           ##
## Création de main.py    05/10/2021   1.0.00         Louis Travaux ##
######################################################################

import os

# fork process to create a child process
pid = os.fork()

a = 2
if pid < 0:
	print("Erreur de création du processus 	avec fork()")
elif pid == 0:
	print("Je suis le fils : mon PID est %d et mon PPID est %d" %(os.getpid(), os.getppid()))
	a += 1
else:
	print("Je suis le pere : mon PID est %d et mon PPID est %d" %(os.getpid(), os.getppid()))
	a = 12
	print(f"père : a: {a}")