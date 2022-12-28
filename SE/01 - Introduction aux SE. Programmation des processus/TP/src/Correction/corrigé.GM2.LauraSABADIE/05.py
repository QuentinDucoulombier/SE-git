import os 
import time 

## Création d'un sous proc avec fork aussi et dans la fonction on attend que le
## proc fils se soit execute avant dexecuter le proc pere


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