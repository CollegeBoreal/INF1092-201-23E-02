# VM (Machine Virtuelle)


:round_pushpin: Creer une machine virtuelle avec HyperV à partir d'un fichier ISO

Si vous souhaitez créer une machine virtuelle (VM) à partir d'un fichier ISO avec Hyper-V en utilisant PowerShell, voici les étapes à suivre :

1. Lancez PowerShell : Ouvrez la console PowerShell ou PowerShell ISE en tant qu'administrateur.

2. Vérifiez les configurations requises : Assurez-vous que votre système dispose de la configuration matérielle nécessaire pour exécuter des machines virtuelles avec Hyper-V. Vérifiez que la virtualisation matérielle est activée dans le BIOS de votre ordinateur.

3. Créez un nouveau disque dur virtuel : Utilisez la commande New-VHD pour créer un disque dur virtuel (VHD) qui servira de disque dur de la VM. Spécifiez le chemin de destination, la taille du disque et d'autres paramètres. Par exemple :

```powershell
New-VHD -Path "C:\VMs\MyVM.vhdx" -SizeBytes 50GB -Dynamic
```

4. Montez l'ISO : Utilisez la commande Mount-DiskImage pour monter le fichier ISO sur un lecteur virtuel. Spécifiez le chemin du fichier ISO. Par exemple :

```powershell
Mount-DiskImage -ImagePath "C:\ISOs\MyISO.iso"
```

5. Créez une nouvelle VM : Utilisez la commande New-VM pour créer une nouvelle machine virtuelle. Spécifiez le nom de la VM, le chemin du disque dur virtuel créé précédemment, le chemin du lecteur virtuel monté à partir de l'ISO et d'autres paramètres. Par exemple :

```powershell
New-VM -Name "MyVM" -Path "C:\VMs" -MemoryStartupBytes 4GB -Generation 2 -VHDPath "C:\VMs\MyVM.vhdx" -DVDDrivePath "D:"
```

> Assurez-vous de spécifier le chemin approprié pour le dossier de destination des VM, le chemin du disque dur virtuel et le lecteur virtuel monté à partir de l'ISO.

6. Configurez les options de démarrage : Utilisez la commande Set-VM pour configurer les options de démarrage de la VM, telles que l'ordre de démarrage des périphériques. Par exemple, pour démarrer la VM à partir du lecteur DVD en premier :

```powershell
Set-VM -Name "MyVM" -BootOrder "CD"
```

7. Démarrez la VM : Utilisez la commande Start-VM pour démarrer la VM que vous avez créée. Par exemple :

```powershell
Start-VM -Name "MyVM"
```

> Cela créera une machine virtuelle avec Hyper-V à partir du fichier ISO spécifié et démarrera la VM nouvellement créée. Vous pouvez ensuite vous connecter à la VM et effectuer d'autres configurations nécessaires.
