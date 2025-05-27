# Dockerfile
## Création d'une image avec le Dockerfile
Commande a éxecuter pour la création :
```bash
docker buildx build --tag minecraft:version dossier
```
Il faut indiquer le nom dans --tag et le dossier contenant le Dockerfile et tous les prérequis a la place de dossier

## Modification du Dockerfile
### Modificaiton en général
Après apport d'une modification du Dockerfile il faut relancer la commande de création d'une image

### Modification de version 
Pour modifier la version de minecraft il faut :

1. Ajouter le nouveau .jar dans la version souhaitée dans le même dossier que le Dockerfile
2. Modifier le nom du .jar dans :
- le Dockerfile
- le startup.sh
- le docker-compose.sh

Puis recréer l'image

# Lancement de l'image
## Docker run
Particulièrement adapté pour Linux sinon il faut modifier le chemin ./data par une chemin type C:\...

```bash
docker run -d -it -p 25565:25565 -e EULA=true RAMAX="" RAMIN="" minecraft:version -v data:/minecraft/data
```

!!Attention!! Le volume est réinitialisé a chaque redémarrage
Le -p indique le port du conteneur et indique a quel port de la machine hôte il est relié = Port_Hôte:Port_Conteneur
Par défaut le port de minecraft est le 25565

Il y a 3 variables :
1 obligatoire = EULA=""     Elle indique l'acceptation des conditions générales d'utilisations.
3 optionnelles  RAMAX=""    Elle indique la RAM maximum que le serveur Minecraft pourra utiliser.       Par défaut 8192M
                RAMIN=""    Elle indique la RAM minimum que le serveur Minecraft pourra/devra utiliser. Par défaut 1024M
!!Attention!! il ne faut pas oublier le M a la fin

## Docker compose

Très simple d'utilisation 
il faut placer le docker-compose.yml et lancer la commande suivante

```bash
docker compose up -d
```

le cas échéant modifier les valeurs de l'environnement a l'intérieur comme la RAM maximum et minimum

# Interragir avec l'image 
Le nom de l'image se trouve en faisant la commande suivante

```bash
docker ps
```

Le résultat ressemblera a une sortie comme celle ci
'CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS         PORTS                      NAMES
f76c22fbde4c   thenucl3on/minecraft:version   "/minecraft/startup.…"   5 minutes ago   Up 5 minutes   0.0.0.0:25565->25565/tcp   minecraft-version

Pour accéder a l'interface :

```bash
docker attach minecraft-version
```

Pour quitter il faut faire deux combinaison de touches:
Ctrl + p  +  Ctrl + q

# Arrêt de l'image
## Docker compose

Pour arrêter le serveur sous Docker Compose il faut entrer la commande suivante dans le dossier ou se trouve le fichier docker-compose.yml

```bash
docker compose down
```

## Docker run

Pour arrêter le serveur lancé en Docker run il faut récupérer le Container ID (Interragir avec l'image)

```bash
docker stop f76c22fbde4c
```

# Nettoyage du serveur

Si plusieurs versions de Minecraft ont été installées il faut nettoyer les images, conteneurs et autres éléments inhérents a Docker inutilisés avec la commande 

```bash
docker system prune
```
