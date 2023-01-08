# Resumé SE

## Chapitre 1: Intro SE intro processus

### Composants

- Programmes systeme qui permettent le fonctionnement de l'ordinateur(le SE) executés en mode kernel (acces total au materiel et à ttes les instructions du CPU)

- Programmes d'application des utilisateurs qui restraint l'acces aux ressources de l'ordi

- Mateiel (Hardware)

### Def Systeme d'exploitation

Couche logiciel qui s’occupe de :

- fournir aux programmes d’application un modèle plus simple et propre de l’ordinateur (présentation).
- gérer l’utilisation de toutes les ressources de l’ordinateur (gestion).

## Chapitre 2: Processus ordonnanceur

### Cycle de vie des processus

#### Processus

Un processus est une instance de programme en cours d'exécution  

Objectifs des processus :

- Séparer les différentes tâches du système
- Gestion des fichiers et des applications
- Permettre le multitâche (plusieurs activités “en même temps”)
- Permettre à plusieurs utilisateurs de travailler sur la même machine et donner l’illusion à l’utilisateur d’avoir la machine pour lui tout seul.

Environnement mémoire -> contexte du processus (avec des données, la valeur des registres, les reussous qui lui ont été allouées par le SE)

Reconnaissable grace a son PID

#### Structure d'un processus

Chargement en mémoire d'un exécutable
4 régions sont alloués en memoire:

- Region du code
- Region des données
- La pile (stack)
- Le tas (heap)

#### Cycle de vie d'un processus

- Nouveau: creation
- Pret (waiting) : mis en attente jusqu’à que la CPU soit libérée.
- Actif (running )
- Endormi : Bloqué. Le processus est en attente d’une ressource. Dès sa libération il repasse à l’état Prêt
- Terminé (Zombie) : réalisation d’un exit.

#### L'espace d'échange (swap)

Utiulisé lorsque la mémoire physique (RAM) arrive a saturation  
Sité sur le disque dure (donc + lent que la RAM)  
Sous forme de partition ou de fiche ou les deux  

Il est géré par le processus 0  
Il transfert hors et vers la memoire  

### Ordonnement

#### Ordonnanceur

Ordonnanceur qui a pour rôle de choisir, parmi tous les processus existants, lequel va pouvoir s’exécuter en fonction d’une politique d’ ordonnancement.

multiprogrammation = activation de plusieurs processus en meme temps  

Commutation de processus va sauvegarde le contexte d'un processus pour restaurer le contexte des processus précédement interrompu  

multitâche = plusieurs processus s’exécutent simultanément avec un processeur ne pouvant exécuter qu’une instruction (d’un programme) à la fois

#### Ordonnancement

Bien regarde les slides sur l'ordonnement

- Non préemptif: l'algo du SE choisiti un nouveau processus suyr blocage ou terminaison du processus courant
- Préemptif: Les ordinateurs ont une horlogo qui genere périodiquement une interruption (quantum)

##### Differents type ordonnanceur

Ordonnanceur sans réquisition:

- FCFS/FIFO (premier arrivé premier servis)
- PCTE/SJF (Shortest job first) Execute le process le + cours en premier

Ordonnanceur avec réquisition

- Round Robine / Ordonnancement circulaire (Attribution d'un quantum de temps qui est le temps d'exécution max par processus)
- SRT (Shortest remaining time) version préemptif de SJF  (le premier est le temps d'exécution le + court (attention au temps d'arrivée))
- Ordonnancement, par priorité

##### Comment calculer ?

- Temps de sejour = Fin - Arrivée (arrivée donnée mais fin non)
- Temp d'attente = temps de séjour - temps d'exécution du travail

## Chapitre 3: Memoire

### Introduction

La RAM est la mémoire dans laquelle les données et processus sont placées lors de leur traitement

Hierarchie:  
Processus <-> cache <-> Memoire centale <-> memoire secondaire (disque)  
\+ a gauche vitesse  
\+ a droite stockage
  
Seules les instructions stockées en mémoire centrale peuvent etre exécutées par le CPU

En monoprogrammation -> facile mémoire réservée au SE / au seul programme à exécuter  
Mais comment faire en multiprogrammation (systeme multitache -> plusieurs processus en RAM)  
Un processus ne doit pas pouvoir accéder à la RAM d'un autre processus ou de systme d'exploitation.  

#### Partitions de taille fixe

On partitionne la mémoire pour contenir un nbre maximum de programmes  
\+ gestion facile  
\- gaspillage de mémoire  

#### Partions de taille variable

Le nombre, la position et la taille des partitions varient dynamiquement  
\+ ameliore l'usage de la memoire  
\- complique sa gestion  
Marche avec le compactage de memoire (retassement) car quand un programme termine il laisse un trou

### Abstraction de la mémoire

Dans un environnement de multiprogrammation la memoire est normalement insuffisante  
Il faut donc sauvegardes les processus sur le disque et les recharger dynamiquement  

Deux approches pour gérer la surchage

#### Swapping

- But : Utiliser le disque pour simuler une taille de RAM plus grande.
- Principe : Une zone du disque (normalement une partition ou fichier) est mise à disposition du SE.
- Avantage : libère la RAM
- Inconvénient : L’accès au disque est lent.

#### Solution: Mémoire virtuelle

Pour exécuter un programme, il n’est pas forcément nécessaire de le garder entièrement en mémoire
Le SE conserve les parties (« pages ») en cours d’utilisation en mémoire et le restesur disque (dans la zone de swap).
Quand un programme attend le chargement d’une partie de lui-même → il est en attente d’E/S

### Donc utilisation de Pagination

#### Explication

Permet de traiter séparément les adresses virtuelles référencées par le programme, et les adresses réelles de la mémoire physique.  
MMU fait la correspondance rapide entre les adresse virtuelle et les adresse physique

##### Default de page

Le SE cherche la page en memoire s'il n'y la trouve pas la page sera copiée du disque a la memoire.  
En gros si la page n'est pas en memoire -> default de page  
Dans l'algo de pagination le defaut de page survient si le bit de valité est à 0.

En cas de défaut de page, les algorithmes de remplacement permettent de déterminer une case physique victime qui sera sauvée sur le disque (si nécessaire) et remplacée par la page virtuelle à laquelle on souhaite accéder.

#### Comment calculer

Adresse réelle = f(page virtuelle) + offset  
Adresse virtuelle = No de page virtuelle + offset  
Avec offset = au nombre de bites correspondant au pages
  
Cadres de pages dans memoires physiques = taille memoire physique - offset(tjrs virtuel)
  
Quel est le nombre maximum d’entrées dans la table de pages ? -> 2^numero de pages virtuel (logique)

## Chapitre 4: Systeme de fichiers/ Machine virtuelle (mettre a jour)

### Formule pour inode

Taille bloc / Numero de bloc en octets = numero de blocs dans un bloc

- Bloc directs: tjrs 10 blocs ?
- Indirect 1 : numero de blocs dans un bloc
- Indirect 2 : numero de blocs dans un bloc^2
- Indirect 3 : numero de blocs dans un bloc^3

Nombre maxi de blocs dans un fichier (direct + indirect (1.2.3))* taille bloc

### Different type d'allocation

#### Allocation contiguë

##### Description

Stocker chaque fichier dans une suite de bloc consécutifs.

##### Avantages

- simple, il suffit de mémoriser un seul nombre, l’adresse dupremier bloc pour localiser le fichier
- Performance excellente car le fichier peut être lu en une seule opération

##### Inconvenients

- si la taille du fichier doit être connu au moment de leur création et peut difficilement grandir.
- fragmentation du disque (le compactage peut y remédier mais il est coûteux)

#### Allocation chainée

##### Description

Le premier mot de chaque bloc est un pointeur sur le bloc suivant. Le
reste contient les données

##### Avantages

- Facilite les modifications et l’accroissement

##### Inconvenients

- alourdit la recherche d’une donnée
- pas d’accès aléatoire mais séquentiel

#### Allocation indexée

##### Description

Tous les pointeurs sont regroupés dans un tableau (index block)

##### Avantages

- facilite les modifications et l’accroissement
- accès aléatoire

##### Inconvenients

- les index prennent de l’espace
- taille du fichier limitée

### Organisation logique d’un disque (slides 26)

MBR VS GPT ET BIOS VS UEFI

### Mise a jour en Debian/Ubuntu

- apt-get update est utilisé pour mettre à jour la liste des paquets disponibles auprès des dépôts (repositories) configurés dans le système
- apt-get upgrade est utilisé pour mettre à jour les paquets installés sur le système en installant les versions les plus récentes disponibles
- apt-get dist-upgrade similaire a upt-get upgrade mais prend également en compte les dépendance. Utilisé pour une mise a jour majeur de la distribution.

## Chapitre 5: Docker

### But

Permet d'isoler l'exécution des applications dans des contextes d'éxécution.
(regarder slide 9)

### Cas d'utilisations

1. Conteneur de SE
Partage le kernel avec le SE du host  
Pratique pour executer differentes distributions en utilisant des images  
2. Conteneur d'applications
Microservice  

### Contributions de docker (voir slides 15)

Slides sur l'utilisations de docker et des commandes slides 18  

- Build une image
- Puis push
- Apres on peut search
- Enfin on peut pull et run dans l'autres sens

#### Commandes

Voir slides 23 et 24

```bash
docker run -i -t ubuntu /bin/bash
#run : lance un nouveau conteneur
#-i -t : demande une terminal en mode interactif dans une pseudo-terminal
#ubuntu : l’image à utiliser pour ce conteneur. Si elle n’est pas disponible sur votre ordinateur, elle sera téléchargée du Docker Hub.
#/bin/bash : exécute bash dans le conteneur
docker ps -a #trouve id du conteneur
docker start idConteneur #Demarre le conteneur
docker attach idConteneur #Attache le conteneur
docker images #liste toutes les images locales
docker search exemple #Recherche des images
docker rm conteneurId #supprime un conteneur pas une image
docker rmi imageID #supprime une image
```
