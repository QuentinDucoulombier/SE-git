# Resumé SE

## Chapitre 1: Intro SE intro processus

### Def Systeme d'exploitation

Couche logiciel qui s’occupe de :

- fournir aux programmes d’application un modèle plus simple et propre de l’ordinateur (présentation).
- gérer l’utilisation de toutes les ressources de l’ordinateur (gestion).

## Chapitre 2: Processus ordonnanceur

### Ordonnement

Bien regarde les slides sur l'ordonnement

- Temps de sejour = Fin - Arrivée (arrivée donnée mais fin non)
- Temp d'attente = temps de séjour - temps d'exécution du travail

## Chapitre 3: Memoire

Adresse virtuelle = No de page virtuelle + offset  
Avec offset = au nombre de bites correspondant au pages
  
Cadres de pages dans memoires physiques = taille memoire physique - offset(tjrs virtuel)
  
Quel est le nombre maximum d’entrées dans la table de pages ? -> 2^numero de pages virtuel (logique)

## Chapitre 4: Systeme de fichiers/ Machine virtuelle

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
