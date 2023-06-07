# :three: Automatisation


> Faire l’installation automatisée de Windows 

L'installation automatisée de Windows peut être réalisée en utilisant divers outils et méthodes. L'une des approches couramment utilisées est l'utilisation de Windows Deployment Services (WDS) et de l'outil Windows Automated Installation Kit (AIK) ou Windows Assessment and Deployment Kit (ADK). Voici une procédure générale pour effectuer une installation automatisée de Windows à l'aide de ces outils :

Préparation de l'environnement :

Configurez un serveur Windows avec le rôle WDS installé.
Téléchargez et installez l'outil Windows AIK ou Windows ADK sur le serveur.
Création d'une image de référence :

Installez manuellement Windows sur une machine de référence et personnalisez-la selon vos besoins.
Capturez l'image de référence à l'aide de l'outil de capture d'image fourni par Windows AIK ou Windows ADK.

Configuration de WDS :

Lancez l'Assistant Configuration de WDS et configurez les paramètres réseau et de stockage.
Importez l'image de référence capturée dans WDS.
Création d'un fichier de réponse (unattend.xml) :

Utilisez l'outil Windows System Image Manager (SIM) fourni par Windows AIK ou Windows ADK pour créer un fichier de réponse XML personnalisé.
Le fichier de réponse spécifie les réponses automatisées aux questions posées pendant l'installation.

Déploiement automatisé :

Configurez les paramètres de déploiement dans WDS pour utiliser le fichier de réponse.
Déployez l'image de référence sur les machines cibles à l'aide de WDS.
Il est important de noter que les détails et les étapes précises peuvent varier en fonction de votre environnement et de la version spécifique de Windows que vous souhaitez installer. Je recommande de vous référer à la documentation officielle de Microsoft, aux guides de déploiement et aux tutoriels en ligne pour obtenir des instructions détaillées et à jour sur l'installation automatisée de Windows.

> comment générer une image Windows Server?

Pour générer une image Windows Server, vous pouvez utiliser des outils tels que Windows Deployment Services (WDS) ou System Center Configuration Manager (SCCM) fournis par Microsoft. Voici un aperçu général du processus :

1. Configurer un système de référence : Préparez une machine physique ou virtuelle qui servira de système de référence pour créer l'image Windows Server. Installez et configurez le système d'exploitation, les applications et les personnalisations selon vos besoins.

2. Généraliser le système de référence : Utilisez l'outil Sysprep (System Preparation) pour généraliser le système de référence. Sysprep supprime les informations spécifiques au système, telles que les identifiants uniques et les pilotes matériels, rendant l'image adaptée au déploiement sur différentes configurations matérielles.

3. Capturer le système de référence : Après avoir exécuté Sysprep, démarrez le système de référence à l'aide d'un support bootable (par exemple, Windows Preinstallation Environment) contenant les outils de capture nécessaires. Utilisez l'outil de capture, tel que Windows Imaging and Configuration Designer (ICD) ou SCCM, pour créer une image du système de référence.

4. Personnaliser l'image (facultatif) : Une fois l'image capturée, vous pouvez la monter à l'aide d'outils tels que DISM (Deployment Image Servicing and Management) et apporter des personnalisations supplémentaires. Vous pouvez ajouter ou supprimer des composants, installer des mises à jour ou apporter d'autres modifications selon vos besoins.

5. Stocker et distribuer l'image : Enregistrez l'image capturée et personnalisée dans un emplacement de stockage central ou un partage réseau accessible par les outils de déploiement tels que WDS ou SCCM. Assurez-vous de définir les autorisations appropriées pour accéder à l'image.

6. Déployer l'image : Utilisez l'outil de déploiement de votre choix, tel que WDS ou SCCM, pour déployer l'image Windows Server sur les systèmes cibles. Ces outils offrent des mécanismes de déploiement via le réseau, d'installations automatisées et de personnalisation lors du déploiement.

Veuillez noter que les étapes spécifiques et les outils peuvent varier en fonction de la version de Windows Server que vous utilisez et de votre environnement de déploiement. Il est recommandé de consulter la documentation et les guides de Microsoft pour des instructions détaillées sur l'utilisation des outils et technologies mentionnés ci-dessus.


# References

- [ ] [Installing and Configuring WDS for PXE Boot on Windows Server 2016 2019 2022](https://knowledgebase.macrium.com/display/KNOW80/Installing+and+Configuring+WDS+for+PXE+Boot+on+Windows+Server+2016+2019+2022)
- [ ] [Windows Deployment Services: How to setup and install WDS role](https://techdirectarchive.com/2020/05/09/what-is-windows-deployment-services-how-to-setup-and-install-wds)
