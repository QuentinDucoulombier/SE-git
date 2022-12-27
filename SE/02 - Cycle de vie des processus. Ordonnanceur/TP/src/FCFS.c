#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct process
{
  char nom[20];
  int TpsExe;
  int TpsArr;
  int TpsFin;
  int TpsSej;
  int TpsAtt;
} process;

//////////////////////////////////////////////////////////////////////////
// Fonction  : FIFO                                                     //
// Acces     : Public                                                   //
// But       : Tri des processus en fonction du TpsArr                  //
//                                                                      //
// Arguments                                                            //
// - IN      : neant                                                    //
// - IN/OUT  : neant                                                    //
// - OUT     : neant                                                    //
// Retour    : neant                                                    //
//                                                                      //
// Historique                       Date        Version  par            //
// Cr�ation de la fonction FIFO     10/09/2022  1.0.01   Alain          //
//////////////////////////////////////////////////////////////////////////

void FIFO(process* proc , int nbp)
{
  // Tri des processus en fonction tu TpsArr (Temps Arriv�e)

  int i,j;
  process permut;
  for(i=0;i<nbp;i++){
    for(j=i+1;j<nbp;j++){
      if (proc[i].TpsArr>proc[j].TpsArr) {
        permut=proc[i];
        proc[j]=permut;
        printf("FIFO : %s permute avec %s\n", proc[i].nom, proc[j].nom);
      }
    }
  }
  printf("\n");

  // Afficher l'enchainement des processus
  for(int i=0;i<nbp;i++)
  { for(int j=0;j<proc[i].TpsExe;j++)
    { printf("%s ",proc[i].nom);
    }
  }
  printf("\n\n");
}

//////////////////////////////////////////////////////////////////////////
// Fonction  : ORDO                                                     //
// Acces     : Public                                                   //
// But       : Calcul et affiche le TpsSej et TpsAtt                    //
//                                                                      //
// Arguments                                                            //
// - IN      : neant                                                    //
// - IN/OUT  : neant                                                    //
// - OUT     : neant                                                    //
// Retour    : neant                                                    //
//                                                                      //
// Historique                       Date        Version  par            //
// Cr�ation de la fonction ORDO     10/09/2022  1.0.01   Alain          //
//////////////////////////////////////////////////////////////////////////

void ORDO(process* proc , int nbp)
{
  // Calcul du TpsFin, TpsSej, TotSej et TpsAtt
  int TpsFin,TpsSej,TotSej,TpsAtt,TotAtt;
  TpsFin=0;
  TpsSej=0;
  TotSej=0;
  TpsAtt=0;
  TotAtt=0;
  int i;
  for(i=0;i<nbp;i++)
  {
    TpsFin = TpsFin + proc[i].TpsExe;
    TpsSej = TpsFin - proc[i].TpsArr;
    TpsAtt = TpsSej - proc[i].TpsExe;

    TotSej = TotSej + TpsSej;
    TotAtt = TotAtt + TpsAtt;

    proc[i].TpsFin = TpsFin;
    proc[i].TpsSej = TpsSej;
    proc[i].TpsAtt = TpsAtt;
  }
  // Afficher le Temps d'execution et le Temps d'arrivee et de chaque processus
  printf("Processus\t TpsExe\t TpsArr\t TpsSej\t TpsAtt\n");
  for (i=0;i<nbp;i++)
  { printf("%s\t\t %d\t %d\t %d\t %d\n",proc[i].nom,proc[i].TpsExe,proc[i].TpsArr,proc[i].TpsSej,proc[i].TpsAtt);
  }
  printf("\n");
  // Afficher les temps moyen de sejour et d'attente
  float TpsSejMoy,TpsAttMoy;
  TpsSejMoy=(float)TotSej/nbp;
  TpsAttMoy=(float)TotAtt/nbp;
  printf("le temps moyen de sejour est = %f\n",TpsSejMoy);
  printf("le temps moyen d'attente est = %f\n",TpsAttMoy);
}

//////////////////////////////////////////////////////////////////////////
// Programme : 01-FCFS.c                                                //
// Acces     : SE                                                       //
// But       : Ordonnancement FIFO ou FCFS                              //
//                                                                      //
// Arguments                                                            //
// - IN      : neant                                                    //
// - IN/OUT  : neant                                                    //
// - OUT     : neant                                                    //
// Retour    : neant                                                    //
//                                                                      //
// Historique                       Date        Version  par            //
// Cr�ation de 01-FCFS.c            10/09/2022  1.0.00   Alain          //
//////////////////////////////////////////////////////////////////////////

void main()
{
  // Creation de cinq processus
  int nbp = 5;
  process* proc;
  proc=(process *)malloc(sizeof(process)*nbp);
  // Initialisation des donn�es
  strcpy(proc[0].nom,"A");
  proc[0].TpsExe=3;
  proc[0].TpsArr=0;
  strcpy(proc[1].nom,"B");
  proc[1].TpsExe=6;
  proc[1].TpsArr=1;
  strcpy(proc[2].nom,"C");
  proc[2].TpsExe=4;
  proc[2].TpsArr=4;
  strcpy(proc[3].nom,"D");
  proc[3].TpsExe=2;
  proc[3].TpsArr=6;
  strcpy(proc[4].nom,"E");
  proc[4].TpsExe=1;
  proc[4].TpsArr=7;
  // Afficher l'ordonnancement appilqu�
  printf("Ordonnancement FCFS :\n");
  printf("*********************\n");
  // Appel du FIFO
  FIFO(proc,nbp);
  ORDO(proc,nbp);
}
