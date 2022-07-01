# Terraform Packer

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

Création du fichier **.gitlab-ci.yml** avec l'intégration des commandes **Terraform** et de la configuration de **GitLab CI** pour gérer **Terraform State**.  
Création des fichiers **Packer** pour créer une image **AWS** et intégration de la configuration dans **GitLab CI**.

Intégration du **Post-Processor** manifest dans **Packer** pour récupérer l'**ID AMI** dans un fichier **Json** et l'enregistrer dans une variable d'environement pour l'utiliser dans **Terraform**.

Installation de l'utilitaire **terraform-docs** pour créer des fichiers **Markdown** sur la configuration du projet.
```bash
cd terraform
terraform-docs markdown . > terraform-docs.md
```
