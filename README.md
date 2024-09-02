# Projet : Deployer une infrastructure complète

Contexte du projet :
Il s'agit de deployer un serveur nginx sur EC2 avec un disque dur ebs
Cette infrasture sur accessible via un eip.

Tâches à accomplir :
1- Ecrire un module pour créer une instance ec2 utilisant la dernière version de ubuntu bionic (qui s'attachera l'ebs et l'ip publique) dont la taille et le tag seront variabilisés
2- Ecrire un module pour créer un volume ebs dont la taille sera variabilisée
3- Ecrire un module pour une ip publique (qui s'attachera la sécurity group)
4- Ecrire un module pour créer une security qui ouvrira le 80 et 443
5- Créer un dossier app qui va utiliser les 4 modules pour deployer une ec2. NB: Ils vont surcharger les variables afin de rendre l'application plus dynamique.
6- A la fin du deploiement, installer nginx et enregistrer l'ip publique dans un fichier nommé ip_ec2.txt (ces elements sont à intégrer dans le rôle ec2)
7- A la fin du travail, mettre sur github