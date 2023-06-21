# VM (Machine Virtuelle)


:round_pushpin: Comment démarrer une VM Hyper-V en utilisant powershell et ajoutant une adresse IP ?


Pour démarrer une machine virtuelle (VM) Hyper-V en utilisant PowerShell et attribuer une adresse IP, vous pouvez suivre ces étapes :

- [ ]  Lancez PowerShell : Ouvrez la console PowerShell ou PowerShell ISE.

Vérifiez les VM disponibles : Utilisez la commande Get-VM pour obtenir une liste des machines virtuelles disponibles. Cela vous aidera à identifier la VM que vous souhaitez démarrer et configurer l'adresse IP. Par exemple :

```powershell
Get-VM
```

- [ ] Démarrez la machine virtuelle : Utilisez la commande Start-VM pour démarrer la VM que vous avez identifiée à l'étape précédente. Spécifiez le nom ou l'objet de la VM en tant que paramètre d'entrée. Par exemple :

```powershell
Start-VM -Name "MaVM"
```

- [ ] Connectez-vous à la VM : Utilisez la commande `Enter-PSSession` pour établir une session PowerShell distante avec la VM. Cela vous permettra d'exécuter des commandes directement sur la VM. Spécifiez le nom ou l'adresse IP de la VM. Par exemple :

```powershell
Enter-PSSession -VMName "MaVM"
```

- [ ] Configurez l'adresse IP : À l'intérieur de la session PowerShell distante, utilisez la commande New-NetIPAddress pour ajouter une adresse IP à l'interface réseau de la VM. Spécifiez l'adresse IP, le masque de sous-réseau, la passerelle par défaut et d'autres paramètres requis. Par exemple :

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.1<ADDR IP>" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```

> Ajustez l'alias de l'interface, l'adresse IP, le masque de sous-réseau et la passerelle par défaut en fonction de votre configuration réseau.

- [ ] Testez la connexion réseau : Pour vérifier que l'adresse IP a été attribuée avec succès, utilisez la commande Test-NetConnection pour tester la connectivité réseau à partir de la VM. Spécifiez une adresse IP ou un nom d'hôte distant à tester. Par exemple :

```powershell
Test-NetConnection -ComputerName "google.com"
```

Cette commande vérifiera si la VM peut atteindre "google.com" via le réseau.

Voilà ! Vous avez démarré la machine virtuelle Hyper-V et attribué une adresse IP en utilisant PowerShell. Assurez-vous d'avoir les autorisations appropriées et des droits d'administration pour effectuer ces actions.
