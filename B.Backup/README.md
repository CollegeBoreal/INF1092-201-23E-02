# Backup

:cat:GPT: Comment créer une image windows?

Pour créer une image Windows à partir de zéro, vous pouvez utiliser le déploiement automatisé de Windows (Windows Automated Installation Kit - AIK) ou Windows Assessment and Deployment Kit (Windows ADK) pour Windows 10. Voici les étapes générales :

1. Téléchargez et installez Windows ADK : Rendez-vous sur le site Web de Microsoft pour télécharger et installer la version appropriée de Windows ADK. Assurez-vous de sélectionner les composants nécessaires pour la création d'images, tels que Windows PE, Deployment Tools, etc.

```bash
choco install windows-adk
```

2. Préparez les fichiers sources de Windows : Vous aurez besoin des fichiers sources de Windows pour créer l'image. Cela peut être l'ISO d'installation de Windows ou les fichiers extraits à partir de l'ISO.

3. Créez un dossier de travail : Créez un nouveau dossier qui servira de dossier de travail pour la création de l'image.

4. Ouvrez l'outil Deployment and Imaging Tools Environment : Recherchez et ouvrez l'invite de commandes "Deployment and Imaging Tools Environment" en tant qu'administrateur. Cela vous permettra d'accéder aux outils nécessaires pour créer l'image.

5. Générez le fichier de réponse (unattend.xml) : Utilisez Windows SIM (System Image Manager) pour générer un fichier de réponse (unattend.xml) qui contient les réponses aux questions d'installation de Windows. Ceci est `facultatif`, mais peut vous aider à automatiser le processus d'installation de Windows.

6. Créez l'image Windows avec DISM : Utilisez l'outil DISM (Deployment Image Servicing and Management) pour créer l'image Windows à partir des fichiers sources. Par exemple :

```powershell
   DISM /Capture-Image /ImageFile:C:\Chemin\Vers\Image.wim /CaptureDir:C:\Chemin\Vers\FichiersSources /Name:"Nom de l'image" /Description:"Description de l'image" /Compress:Maximum
```

   Cette commande créera une image Windows au chemin spécifié avec le nom et la description donnés. Assurez-vous d'ajuster les chemins en fonction de votre configuration.

7. Le processus de création de l'image peut prendre un certain temps, en fonction de la taille des fichiers sources et des options sélectionnées.

Ces étapes vous permettront de créer une image Windows à partir de zéro à l'aide des outils disponibles dans Windows ADK. Il est important de noter que les détails spécifiques peuvent varier en fonction de la version de Windows et de l'outil que vous utilisez. Assurez-vous de consulter la documentation de Microsoft et de suivre les instructions appropriées pour votre environnement spécifique.


# References

https://www.ubackup.com/windows-server/windows-server-backup-powershell.html

https://www.microsoft.com/en-us/software-download/windows10ISO

https://learn.microsoft.com/en-us/windows/deployment/deploy-windows-cm/add-a-windows-10-operating-system-image-using-configuration-manager
