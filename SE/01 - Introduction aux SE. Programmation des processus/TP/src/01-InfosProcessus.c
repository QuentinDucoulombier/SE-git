#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void)
{
    printf("Je suis le processus de PID : %d\n", getpid());
    printf("Mon pere est le processus de PID : %d\n", getppid());
    printf("Mon uid : %d\n", getuid());
    printf("Mon gid : %d\n", getgid());
    printf("Mon egid : %d\n", getegid());
    
    return 0;
}