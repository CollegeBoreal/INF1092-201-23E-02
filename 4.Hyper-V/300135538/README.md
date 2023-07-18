🚩Machine Virtuelle
🚦 Création de la VM
 Copy ISO File (être très patient) from Download Windows 10 Disc Image (ISO File)

```
Copy-Item -Path "E:\Win10_22H2_English_x64v1.iso" -Destination "$ENV:USERPROFILE\Documents"
```

 Créer le disque virtuel pour la machine virtuelle
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Reda.vhdx" -SizeBytes 32GB -Dynamic 
Reponse :

ComputerName            : WIN-AR36REID
Path                    : C:\Users\Brice\Documents\VM-Reda.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 7BD42720-AE1F-4B93-8EBD-B93A4DD71DED
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
 Monter l'image disque en DVD (pas utile)
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Response:

Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM3
FileSize          : 6140975104
ImagePath         : C:\Users\Reda\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 3
Size              : 6140975104
StorageType       : 1
PSComputerName    :
Get-PSDrive -PSProvider FileSystem
Response:

Name           Used (GB)     Free (GB) Provider      Root                                                           CurrentLocation
----           ---------     --------- --------      ----                                                           ---------------
C                  59.80        212.99 FileSystem    C:\                                                      Users\Reda\Documents
D                                      FileSystem    D:\
E              179496.88      58904.14 FileSystem    \\TSCLIENT\Downloads
F                                      FileSystem    F:\
G                   5.44          0.00 FileSystem    G:\
H                   5.72          0.00 FileSystem    H:\
 Créer la machine virtuelle
$VM = New-VM -Name VM-Reda -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Reda.vhdx"
Get-VM
Response :

Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Reda Off   0           0                 00:00:00 Operating normally 10.0
 Ajouter le disque de démarrage
Get-VMDVDDrive -VMName $VM.VMName
Response :

VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Reda IDE            1                0                  None
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName $VM.VMName
Response :

VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Reda IDE            0                1                  ISO          C:\Users\Reda\Documents\Win10_22H2_English_x64v1.iso
VM-Reda IDE            1                0                  None
 Démarrer la machine virtuelle
Start-VM VM-Reda
🚦 Installation de la VM
💡 Note: vmconnect permet uniquement la connection en mode interactive (GUI - Graphical User Interface - Interface Homme Machine)

 🚩Installer la machine virtuelle avec vmconnect
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-Reda
🚦 Connexion à la VM
💡 Note: PSSession permet uniquement la connection en mode CLI (Command Level Interface) pour entrer les commandes PowerShell sur la machine virtuelle

 Récupérer les informations sur la VM
Get-VM
Response:

Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Reda Running 0           4096              00:00:08.5860000 Operating normally 10.0
 Collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur.
$cred = Get-Credential
Response:

cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
 Établir une session interactive à distance avec la VM
Enter-PSSession -VMName VM-Reda -Credential $cred
Response :

[VM-Reda]: PS C:\Users\Reda\Documents>
Ou Erreur⛔️

Response :

Enter-PSSession : An error has occurred which Windows PowerShell cannot handle. A remote session might have ended.
At line:1 char:1
+ Enter-PSSession -VMName "VM-Reda" -Credential $cred
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Enter-PSSession], PSRemotingDataStructureException
    + FullyQualifiedErrorId : CreateRemoteRunspaceForVMFailed,Microsoft.PowerShell.Commands.EnterPSSessionCommand
