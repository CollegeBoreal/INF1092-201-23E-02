# NanoServer

Pour installer Nano Server sur Hyper-V en utilisant PowerShell, vous pouvez suivre ces étapes :

- [ ] Préparez les ressources nécessaires :

Téléchargez l'image Nano Server (.iso) depuis le Centre d'évaluation Microsoft ou obtenez-la à partir d'autres sources.
Assurez-vous que Hyper-V est installé et configuré sur la machine cible.

- [ ] Créez une nouvelle machine virtuelle (VM) en utilisant PowerShell :

```powershell
New-VM -Name "NanoServerVM" `
       -MemoryStartupBytes 1GB `
       -SwitchName "NomDeVotreVirtualSwitch" `
       -Path "C:\HyperV\NanoServerVM"
```

- [ ] Remplacez "NanoServerVM" par le nom souhaité pour votre VM, "NomDeVotreVirtualSwitch" par le nom du commutateur virtuel auquel vous souhaitez connecter la VM, et "C:\HyperV\NanoServerVM" par le chemin désiré pour stocker les fichiers de la VM.

- [ ] Configurez le disque dur virtuel pour la VM :

```powershell
$VHDPath = "C:\HyperV\NanoServerVM\NanoServerVM.vhdx" `
New-VHD -Path $VHDPath -SizeBytes 10GB -Dynamic `
Add-VMHardDiskDrive -VMName "NanoServerVM" -Path $VHDPath `
```

- [ ] Ajustez les chemins et tailles en fonction de vos besoins.

Attachez l'ISO de Nano Server à la VM :

```powershell
$ISOPath = "C:\Chemin\Vers\NanoServer.iso" ```
Set-VMDvdDrive -VMName "NanoServerVM" -Path $ISOPath ```
```

Remplacez "C:\Chemin\Vers\NanoServer.iso" par le chemin réel de l'ISO Nano Server téléchargée.

Démarrez la VM :

powershell
Copy code
Start-VM -Name "NanoServerVM"
Connectez-vous à la console de la VM :

powershell
Copy code
Connect-VMConsole -VMName "NanoServerVM"
Cela ouvrira la fenêtre de la console de la VM, vous permettant d'interagir avec le processus d'installation de Nano Server.

Suivez les instructions à l'écran pour installer Nano Server sur la VM. Configurez les paramètres réseau, saisissez les clés de produit si nécessaire et sélectionnez les options d'installation souhaitées.

Une fois l'installation terminée, Nano Server sera installé sur la VM Hyper-V. Vous pouvez gérer et accéder à la VM Nano Server comme toute autre VM dans Hyper-V.

Veuillez noter que les étapes fournies ici sont une ligne directrice de base et que vous devrez peut-être les adapter en fonction de votre environnement et de vos besoins spécifiques.
