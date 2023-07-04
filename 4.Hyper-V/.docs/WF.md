# :cat:GPT Windows Feature

> Qu'est ce que WindowsFeature ?
>

Dans PowerShell, la classe "WindowsFeature" est utilisée pour gérer les fonctionnalités (ou rôles) de Windows Server. Elle permet d'installer, de désinstaller, de configurer et de gérer les fonctionnalités de Windows à partir de scripts ou de lignes de commande.

La classe "WindowsFeature" est utilisée en conjonction avec la cmdlet "Install-WindowsFeature" pour installer une fonctionnalité sur un serveur Windows. Par exemple :

```powershell
Install-WindowsFeature -Name "Web-Server" -IncludeManagementTools
```

Cet exemple installe la fonctionnalité "Web Server" sur le serveur avec les outils d'administration associés. La classe "WindowsFeature" permet également d'accéder à des propriétés et à des méthodes pour vérifier l'état d'une fonctionnalité, la désinstaller, la configurer, etc.

Voici quelques exemples d'utilisation de la classe "WindowsFeature" en PowerShell :

- Vérifier l'état d'une fonctionnalité :
  ```powershell
  $feature = Get-WindowsFeature -Name "Web-Server"
  $feature.Installed
  ```

- Désinstaller une fonctionnalité :
  ```powershell
  $feature = Get-WindowsFeature -Name "Web-Server"
  $feature.Uninstall()
  ```

- Obtenir la liste des fonctionnalités disponibles :
  ```powershell
  Get-WindowsFeature
  ```

La classe "WindowsFeature" fournit donc une interface pratique pour gérer les fonctionnalités de Windows Server en PowerShell, offrant des fonctionnalités telles que l'installation, la désinstallation, la configuration et la vérification de l'état des fonctionnalités du système d'exploitation.
