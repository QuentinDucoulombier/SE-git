import os
import time

p=os.fork()

if p>=0 :
    status=p
    if p==0:
        PID= os.getpid()
        print("je suis le fils, mon PID est",PID)
        time.sleep(1.0)
    else:
        PID =os.getpid()
        print("Père. Mon PID est",PID)
        retval=os.wait()
        print("Le PID fils est ",retval[0])
        print("Le code de sortie est ",os.WEXITSTATUS(status))
        
else : 
    print("Erreur")
