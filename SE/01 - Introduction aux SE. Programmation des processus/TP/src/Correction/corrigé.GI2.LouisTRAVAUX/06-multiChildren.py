######################################################################
##   Conversion de MultiChildren.c (développé par Alain Bertails)   ##
##                          en python                               ##
##                                                                  ##
## But : Affiche les informations sur le processus                  ##
##       Exécution : python3 multiChildren.py                       ##
##                                                                  ##
## Historique             Date         Version        Par           ##
## Création de main.py    05/10/2021   1.0.00         Léo Portet    ##
######################################################################

# Importation des modules
import os
from time import sleep

# Définition des variables
retval = 0
status = 0
i = 0
monp = 0
pidreturn = 0
n = 4
p = [i for i in range(n)] # Création d'un tableau de n processus


print("Père avant fork : PID", os.getpid(), "et PPID :", os.getppid())
for i in range(n) :
    p[i] = os.fork()
    monp = p[i]
    if p[i] == 0 :
        print("Fils PID : ", os.getpid(), "avec i = ", i)
        sleep(i)
        break

# Affichage des informations sur le processus
if monp != 0 :
    while True :
        print("i :", i, "père mis en attente")
        #pidreturn = os.wait()
        print("père : pidreturn", pidreturn, "terminé. Exit code est :", os.WEXITSTATUS(status))

        if pidreturn[0] < 0 :
            break
else :
    print("Fils PID : ", os.getpid(), "terminé avec i = ", i)
    exit(i)
