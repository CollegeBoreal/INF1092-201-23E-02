# Backup

:cat:GPT: Comment créer une image windows?

Pour créer une image Windows à partir de zéro, vous pouvez utiliser le déploiement automatisé de Windows (Windows Automated Installation Kit - AIK) ou Windows Assessment and Deployment Kit (Windows ADK) pour Windows 10. Voici les étapes générales :

1. Téléchargez et installez Windows ADK : Rendez-vous sur le site Web de Microsoft pour télécharger et installer la version appropriée de Windows ADK. Assurez-vous de sélectionner les composants nécessaires pour la création d'images, tels que Windows PE, Deployment Tools, etc.


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


:cat:GPT: Comment exporter une VM en image WIM ?

Pour exporter une machine virtuelle (VM) en tant qu'image WIM, vous pouvez utiliser l'outil de gestion de déploiement de Windows (Windows Deployment Image Servicing and Management - DISM). Voici les étapes générales pour effectuer cette opération :

1. Arrêtez la machine virtuelle : Assurez-vous que la machine virtuelle que vous souhaitez exporter est arrêtée avant de commencer le processus.

2. Ouvrez une invite de commandes en tant qu'administrateur : Cela vous permettra d'exécuter les commandes DISM avec les privilèges appropriés.

3. Identifiez le chemin de destination pour l'image WIM : Choisissez un emplacement sur votre système de fichiers où vous souhaitez enregistrer l'image WIM résultante.

4. Utilisez DISM pour exporter la VM en tant qu'image WIM : Utilisez la commande suivante pour exporter la VM en tant qu'image WIM :

```powershell
   DISM /Capture-Image /ImageFile:"Chemin\vers\image.wim" /CaptureDir:"Chemin\vers\machinevirtuelle" /Name:"Nom de l'image" /Description:"Description de l'image" /Compress:Maximum
```

   Assurez-vous de remplacer "Chemin\vers\image.wim" par le chemin de destination de l'image WIM et "Chemin\vers\machinevirtuelle" par le chemin vers le dossier racine de la machine virtuelle que vous souhaitez exporter. Indiquez également un nom et une description appropriés pour l'image.

5. Le processus de capture peut prendre un certain temps en fonction de la taille de la machine virtuelle.

Une fois que la commande DISM est terminée, vous aurez une image WIM de votre machine virtuelle exportée dans le chemin spécifié. Vous pouvez ensuite utiliser cette image pour déployer la machine virtuelle sur d'autres systèmes utilisant des outils de déploiement tels que Windows Deployment Services (WDS) ou Microsoft Deployment Toolkit (MDT).


:cat:GPT: Comment également capturer le disque utiliser par la VM?

Pour capturer le disque utilisé par une machine virtuelle (VM) en plus de l'image WIM, vous pouvez utiliser l'outil de gestion de déploiement de Windows (Windows Deployment Image Servicing and Management - DISM) en combinaison avec l'outil de gestion de disque (Disk Management).

Voici les étapes pour capturer le disque utilisé par une VM :

1. Arrêtez la machine virtuelle : Assurez-vous que la machine virtuelle est arrêtée avant de commencer le processus de capture.

2. Ouvrez une invite de commandes en tant qu'administrateur : Cela vous permettra d'exécuter les commandes `DISM` et `Diskpart` avec les privilèges appropriés.

3. Identifiez la lettre du lecteur de la machine virtuelle : Utilisez l'outil Disk Management pour identifier la lettre du lecteur utilisé par la machine virtuelle que vous souhaitez capturer.

4. Montez le disque de la machine virtuelle : Utilisez la commande Diskpart pour monter le disque de la machine virtuelle à une lettre de lecteur disponible. Par exemple :

```powershell
diskpart
select vdisk file="Chemin\vers\disque.vhdx"
attach vdisk
```

   Assurez-vous de remplacer "Chemin\vers\disque.vhdx" par le chemin du fichier de disque virtuel utilisé par la machine virtuelle.

5. Utilisez DISM pour capturer l'image WIM : Utilisez la commande DISM pour capturer l'image WIM de la machine virtuelle, en incluant le disque monté. Par exemple :

```powershell
DISM /Capture-Image /ImageFile:"Chemin\vers\image.wim" /CaptureDir:"LettreDisqueMonte:\" /Name:"Nom de l'image" /Description:"Description de l'image" /Compress:Maximum
```

   Assurez-vous de remplacer "Chemin\vers\image.wim" par le chemin de destination de l'image WIM, "LettreDisqueMonte:\" par la lettre du lecteur monté de la machine virtuelle, et spécifiez un nom et une description appropriés pour l'image.

6. Le processus de capture peut prendre un certain temps en fonction de la taille du disque virtuel.

Une fois la commande DISM terminée, vous aurez l'image WIM de la machine virtuelle, incluant le disque capturé, dans le chemin spécifié. Vous pouvez ensuite utiliser cette image pour déployer la machine virtuelle avec son disque sur d'autres systèmes utilisant des outils de déploiement tels que Windows Deployment Services (WDS) ou Microsoft Deployment Toolkit (MDT).

# References

- [ ] [How to Take Windows Server Backup Using PowerShell](https://www.ubackup.com/windows-server/windows-server-backup-powershell.html)
- [ ] [Download Windows 10 Disc Image (ISO File)](https://www.microsoft.com/en-us/software-download/windows10ISO)
- [ ] [Add a Windows 10 operating system image using Configuration Manager](https://learn.microsoft.com/en-us/windows/deployment/deploy-windows-cm/add-a-windows-10-operating-system-image-using-configuration-manager)
- [ ] [Configure Windows Deployment Services Using PowerShell](https://mcpmag.com/articles/2018/12/13/configure-wds-using-powershell.aspx)
- [ ] [Chocolatey: Windows Assessment and Deployment Kit 10.1.22621.1](https://community.chocolatey.org/packages/windows-adk)

```bash
choco install windows-adk
```

