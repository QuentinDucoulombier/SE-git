#include <unistd.h>    /* Symbolic Constants */
#include <sys/types.h> /* Primitive System Data Types */
#include <stdio.h>     /* Input/Output */
#include <sys/wait.h>  /* Wait for Process Termination */
#include <stdlib.h>    /* General Utilities */

int main() 
{
   int retval; int status;

   pid_t p = fork();

   if (p == 0) {
     sleep(1); /* sleep for 1 second */
     printf("CHILD: Enter an exit value (0 to 255): ");
     scanf("%d", &retval);
     exit(retval);

   } else if (p > 0) {
       printf("PARENT: I will wait for my child to exit.\n");
       wait(&status);
       printf("PARENT: Child exit code is: %d\n", WEXITSTATUS(status));
       exit(0);
       
   } else { exit(-1); }
}
