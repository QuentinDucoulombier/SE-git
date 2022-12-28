import os
pid = os.fork()
a=2


if pid < 0:
    print("Erreur de creation de processus avec fork")
    
elif pid == 0:
    print("Je suis le fils : mon PID est %d et mon PPID est %d" %(os.getpid(), os.getppid()))
    a+=1
    print("fils: a++: %d, adresse de a : %d"%(a,id(a)))
else:
    print("Je suis le pere : mon PID est %d et mon PPID est %d" %(os.getpid(), os.getppid()))
    a=12
    print("pere: a: %d, adresse de a : %d"%(a,id(a)))   