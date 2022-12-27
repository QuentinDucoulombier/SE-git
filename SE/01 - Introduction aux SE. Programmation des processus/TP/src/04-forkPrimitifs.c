#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void)
{
    pid_t p;
    p = fork();
    int tmp = 10;

    printf("Valeur de fork = %d\n", p);
    switch (p)
    {
    case 0:
        printf("Je suis le processus fils : pid=%d, ppid=%d\n", getpid(), getppid());
        printf("temp chez le fils est egale a %d et son adresse est %p\n", tmp, &tmp);
        printf("\n");
        break;
    
    case -1:
        perror("Erreur de creation avec le fork");
        break;
    
    default:
        printf("Je suis le processus pere : pid=%d, ppid=%d, pid fils=%d\n", getpid(), getppid(), p);
        printf("temp chez le pere est egale a %d et son adresse est %p\n", tmp, &tmp);
        printf("\n");
        break;
    }
   
    return 0;
}