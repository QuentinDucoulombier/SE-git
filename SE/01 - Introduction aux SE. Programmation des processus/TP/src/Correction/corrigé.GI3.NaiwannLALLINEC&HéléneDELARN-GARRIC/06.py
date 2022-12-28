import os
import time

#//////////////////////////////////////////////////////////////////////////
#// Programme : MultChildren.py                                          //
#// Acces     : SE                                                       //
#// But       : Affiche les informations sur le processus                //
#//                                                                      //
#// Arguments                                                            //
#// - IN      : neant                                                    //
#// - IN/OUT  : neant                                                    //
#// - OUT     : neant                                                    //
#// Retour    : neant                                                    //
#//                                                                      //
#// Historique                       Date        Version  par            //
#// Création de MultChildren.c       30/08/2021  1.0.00   Juan           //
#//////////////////////////////////////////////////////////////////////////


pidreturn = 0
n = 4

p = []

print("Pere avant fork: mon PID est {} et mon PPID est {}\n".format(os.getpid(),os.getppid()))

for j in range(n):
    p.append(os.fork())
    monp = p[j]

    if p[j] == 0:
        print("Fils PID {} avec i = {} en sortant de la boucle...\n".format(os.getpid(),j))
        time.sleep(j)
        i=j
        break
    i=j   #variable i dans le code c, mais comme i est l'indice de boucle il n'est pas conservé en python

if monp != 0:
    while pidreturn != -1:
        print("i : {}. Pere mis en attente\n".format(i))
        status = os.wait()
        pidreturn = status[0]   #status[0] renvoie le pid à la fin du fils
        print("Pere: pidreturn {} est terminé. Exit code est : {}\n".format(pidreturn,os.WEXITSTATUS(status)))
else:
    print("Fils PID {}. Valeur p[{}] = {} \n".format(os.getpid(),i,p[i]))
