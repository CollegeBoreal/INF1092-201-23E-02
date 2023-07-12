# CREATION DE LA MACHINE VIRTUELLE VM-OTHMAN

1️⃣ Installer le role Hyper V sur Windows Server

```POWERSHELL
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```


<img src="images/WhatsApp Image 2023-07-12 at 3.19.2811 PM.jpeg" width="253" height="337" > </img>



:two: Créer le disque virtuel pour la machine virtuelle

```POWERSHELL
New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -SizeBytes 32GB -Dynamic
```

<img src="images/2WhatsApp Image 2023-07-12 at 3.19.29 PM.jpeg" width="253" height="337" > </img>

Reponse:

```PYTON
ComputerName            : WIN-TJQ7DKNAHHUSI

Path                    : C:\Users\Administrators\Documents\VM-Brice.vhdx

VhdFormat               : VHDX

VhdType                 : Dynamic

FileSize                : 4194304

Size                    : 34359738368

MinimumSize             :

LogicalSectorSize       : 512

PhysicalSectorSize      : 4096

BlockSize               : 33554432

ParentPath              :

DiskIdentifier          : 7CD12920-A21F-4B93-8EBD-B93A4DD71DIUW

FragmentationPercentage : 0

Alignment               : 1

Attached                : False

DiskNumber              :

IsPMEMCompatible        : False

AddressAbstractionType  : None

Number                  :
```

3️⃣ Monter l'image disque en DVD :

```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```

<img src="images/WhatsApp Image 2023-07-12 at 3.19.30 PM (1).jpeg" width="253" height="337" > </img>


```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```

4️⃣ Créer la machine virtuelle :
```POWERSHELL
$VM = New-VM -Name VM-Othman -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Brice.vhdx"
```
```POWERSHELL
Get-VM
```
Response :
```PYTHON
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Othman Off   0           0                 05:02:03 Operating normally 10.0
```
5️⃣ Ajouter le disque de démarrage:
```POWERSHELL
Get-VMDVDDrive -VMName $VM.VMName
```
Reponse:
```POWERSHELL
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Othman IDE            1                0                  None
```

```POWERSHELL
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```

```POWERSHELL
Get-VMDVDDrive -VMName $VM.VMName
```
Reponse:
```POWERSHELL
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Othman IDE            0                1                  ISO          C:\Users\Brice\Documents\Win10_22H2_English_x64v1.iso
VM-Othman IDE            1                0                  None
```
6️⃣ Démarrer la machine virtuelle:
```powershell
Start-VM VM-Othman
```

# Installation de la VM

1️⃣  Installer la machine virtuelle avec vmconnect :
```powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
```
```powershell
vmconnect $HostName VM-Brice
```
# Connexion à la VM 
1️⃣ Récupérer les informations sur la VM :
```powershell
Get-VM
```
return:
```powershell
Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Othman Running 0           4096              00:00:08.5860000 Operating normally 10.0
```
2️⃣ Collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur :
```powershell
$cred = Get-Credential
```
reponse:
```powershell
cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
```
3️⃣ Établir une session interactive à distance avec la VM :
```powershell
Enter-PSSession -VMName VM-Brice -Credential $cred
```
reponse:
```powershell
[VM-Othman]: PS C:\Users\Administrators\Documents>
```







