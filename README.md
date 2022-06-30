# Terraform Packer

## TP : Terraform et Packer

### **Cahier des charges**
Objectif : Compléter le projet précédent, pour déployer l'infrastructure avec l'AMI généré par packer  
Travail d'équipe : oui  
Besoin :  
Partie 1 :
- Déployer un serveur avec votre AMI ID saisi en variable

Partie 2 :
- Construire une CI pour automatiser les actions de Terraform et vous permettre de vous concentrer sur le code

Partie 3 :
- Déployer votre image Packer sans renseigner manuellement l'AMI ID
- utiliser le projet Terraform-Doc pour générer votre documentation

Rendu :
- Versionner votre code dans un projet GitLab
- Documenter son usage dans un document README.md

### **Réalisation**

#### **Partie 1 :**  
Création des fichiers **terraform** avec l'ID de l'AMI AWS
Lancement des commandes :
- d'initialisation (init)
- de contrôle (fmt)
- de validation (validate)
- d'application des configurations.
```bash
terraform init
terraform fmt
terraform validate
terraform apply
```

#### **Partie 2 :**
Création du fichier **.gitlab-ci.yml** avec l'intégration des commandes **Terraform** et de la configuration de **GitLab CI** pour gérer **Terraform State**.  
Création des fichiers **Packer** pour créer une image **AWS** et intégration de la configuration dans **GitLab CI**.

#### **Partie 3 :**
Intégration du **Post-Processor** manifest dans **Packer** pour récupérer l'**ID AMI** dans un fichier **Json** et l'enregistrer dans une variable d'environement pour l'utiliser dans **Terraform**.

Installation de l'utilitaire **terraform-docs** pour créer des fichiers **Markdown** sur la configuration du projet.
```bash
cd terraform
terraform-docs markdown . > terraform-docs.md
```
