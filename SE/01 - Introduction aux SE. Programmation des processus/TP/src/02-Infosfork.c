#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

void infosProces()
{
    printf("Je suis le processus de PID : %d\n", getpid());
    printf("Mon pere est le processus de PID : %d\n", getppid());
    printf("Mon uid : %d\n", getuid());
    printf("Mon gid : %d\n", getgid());
    printf("Mon egid : %d\n", getegid());
    printf("\n");
}

int main(void)
{
    pid_t p;
    p = fork();

    printf("Valeur de fork = %d\n", p);
    switch (p)
    {
    case 0:
        printf("Je suis le processus fils : pid=%d, ppid=%d\n", getpid(), getppid());
        infosProces();
        break;
    
    case -1:
        perror("Erreur de creation avec le fork");
        break;
    
    default:
        printf("Je suis le processus pere : pid=%d, ppid=%d, pid fils=%d\n", getpid(), getppid(), p);
        infosProces();
        break;
    }
   
    return 0;
}