#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

int main(void)
{
    int status;
    int valUser;

    pid_t p = fork();

    if(p == 0)
    {
        sleep(1);
        printf("Entre une valeur entre 0 a 255\n");
        scanf("%d", &valUser);
        printf("Je suis le processus fils : pid=%d, ppid=%d\n", getpid(), getppid());
        exit(valUser);
    }
    else if (p > 0)
    {
        printf("Parent: j'attends en gros \n");
        wait(&status);
        printf("Parents: le code du child d'exit est %d\n", WEXITSTATUS(status));
         printf("Je suis le processus pere : pid=%d, ppid=%d, pid fils=%d\n", getpid(), getppid(), p);
        exit(0);
    }
    else
    {
        exit(-1);
    }
    
    
    
    return 0;
}