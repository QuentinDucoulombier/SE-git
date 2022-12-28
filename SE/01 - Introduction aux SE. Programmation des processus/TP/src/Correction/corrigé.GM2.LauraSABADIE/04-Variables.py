import os

# fork process to create a child process
pid = os.fork() 
 ## crée sous proc pour PID du fils et du père . sous proc = fils . proc princ.= père
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