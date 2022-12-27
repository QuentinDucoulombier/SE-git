#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main()
{
    // Création du processus fils
    pid_t pid = fork();

    // Si pid est négatif, cela signifie qu'il y a eu une erreur lors de la création du processus fils
    if (pid < 0)
    {
        perror("Erreur lors de la création du processus fils");
        return 1;
    }

    // Si pid est égal à 0, cela signifie que nous sommes dans le processus fils
    if (pid == 0)
    {
        // Le processus fils envoie la valeur 20 à son père
        printf("Valeur envoyée par le fils au père : 20\n");
        return 20;
    }
    else
    {
        // Nous sommes dans le processus père

        // Attente de la fin du processus fils
        int status;
        waitpid(pid, &status, 0);

        // Si le processus fils s'est terminé avec succès, la valeur retournée est stockée dans le champ WEXITSTATUS de l'objet status
        if (WIFEXITED(status))
        {
            int valeur_retournee = WEXITSTATUS(status);
            printf("Valeur retournée par le fils : %d\n", valeur_retournee);
        }
        else
        {
            printf("Le processus fils s'est terminé de manière anormale\n");
        }

        return 0;
    }
}
