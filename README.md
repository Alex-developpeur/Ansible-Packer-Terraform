Objectif : Construire ses propres rôles pour déployer un wordpress sous docker
Travail d'équipe : oui
Besoin :

    Création d'un serveur sous debian 11 avec vagrant
    Création des rôles ansible suivants :
        sys-common : ce rôle doit regrouper toutes vos pratiques d'installation par défaut (création d'utilisateur, mise à jour système, paramétrage de la timezone, hostname...)
        sys-docker : ce rôle doit vous permettre l'installation de docker et docker-compose
        dck-wordpress : ce rôle vous permet de déployer un wordpress sous docker (penser à utiliser le docker-compose du précédent TP)
    L'ensemble des rôles peuvent être appelé par le playbook principale main.yml
    Essayer d'utiliser le provisionner ansible local pour vous permettre d'exécuter les playbooks directement sur la machine guest

Rendu :

    Versionner votre code dans un projet GitLab
    Documenter son usage dans un document README.md

traitement:

création des répertoires d'environnement :
-----------------------------------------
$ mkdir -p {host_vars,group_vars,playbooks,roles,vars}

$ touch ansible.cfg hosts main.yml 

création des répertoires dans chaque rôle:
-------------------------------------------
$ cd roles

$ ansible-galaxy init sys-common

$ ansible-galaxy init sys-docker

$ ansible-galaxy init dck-docker

fichier main.yml général:
------------------------
ajout des roles créés précédemment 

fichier main.yml du role sys-common:
-----------------------------------
   - création d'un groupe sysadmin
   - création d'un user sysadmin
   - ajout de l'utilisateur dans le groupe sudoer

fichier main.yml du role sys-docker:
-----------------------------------
   - update des paquets linux
   - installation des paquets necessaire à docker et docker compose
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
      - python3-pip
      - virtualenv
      - python3-setuptools
      - gnupg 
      - lsb-release
   - récupération d'un script d'installation docker à cette adresse https://get.docker.com
   - lancement du script

fichier main.yml du role dck-wordpress:
---------------------------------------
   - copie du ficher ansible-role/dck-wordpress/files/docker-compose.yml dans le répertoire /home/sysadmin
   - se positionner dans le répertoire /home/sysadmin
   - lancement de la commande docker compose up -d

Test complet:
-------------
sur la machine Vagrant:
   - Vagrant up
   - Vagrant ss # pour vérifier si la machine virtuelle est accessible

sur la machine ansible:
   - se positionner sur le répertoire ansible-role et executer : sudo ansible-playbook main.yml

si tout se passe bien sur votre machine window, dans un navigateur taper l'adresse de votre VM générée par Vagrant
   - exemple : http://192.168.134.147/
   - l'installation de wordpress apparait

pour partager la vm vers l'exterieur :
   - ngrok http 192.168.134.147