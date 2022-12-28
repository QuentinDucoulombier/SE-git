######################################################################
##   Conversion de 005.c (développé par Alain Bertails)             ##
##                          en python                               ##
##                                                                  ##
## But : Affiche les informations sur le processus                  ##
##       Exécution : python3 005.py                                 ##
##                                                                  ##
## Historique             Date         Version        Par           ##
## Création de main.py    05/10/2021   1.0.00      Corentin Calmels ##
######################################################################

import os 
import time 


def parent():
    newpid = os.fork()
    if newpid >= 0:
        if newpid == 0:
            print('\nI\'m the new child ',  os.getpid())
            time.sleep(5)
        else:
            pid= os.getpid()
            print(f"My pid is {pid}, waiting children.........")
            status = os.waitpid(newpid , 0)
            print(f"child pid: {status[0]}, exitcode: {status[1]}\n")

if __name__ == "__main__":
    parent()