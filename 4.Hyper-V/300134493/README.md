# Hyper-V

# 🅰️  Creation de la VM
```powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Thera.vhdx" -SizeBytes 32GB -Dynamic
```
> Resultat :
```Python
ComputerName            : WIN-OED1RCQ9NFR
Path                    : C:\Users\Administrator\Documents\VM-Thera.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : A24742E2-49A8-414A-BB7D-9518ADB2BBAB
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
-[] Monter l'image disque en DVD
```powershell
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
> Resultat :
```Python

Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM1
FileSize          : 6140975104
ImagePath         : C:\Users\Administrator\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 1
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Resultat :
```Python

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  35.31        237.48 FileSystem    C:\                                            Users\Administrator
D                   5.72          0.00 FileSystem    D:\
F                                      FileSystem    F:\
```
Créer la machine virtuelle 
```powershell
$VM = New-VM -Name VM-Thera -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Thera.vhdx"
```
> Resultat :
```Python

Name         State   CPUUsage(%) MemoryAssigned(M) Uptime             Status             Version
----         -----   ----------- ----------------- ------             ------             -------
VM-Fousseyni Running 0           4096              2.10:22:31.6760000 Operating normally 10.0
VM-Thera     Off     0           0                 00:00:00           Operating normally 10.0
```

Ajoutez le disque de démarrage
```powershell
Get-VMDVDDrive -VMName $VM.VMName
```
> Resultat :
```python

VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Thera IDE            1                0                  None
```
```powershell
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
```powershell
Get-VMDVDDrive -VMName $VM.VMName
```
> Resultat :
``` Python

VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Thera IDE            0                1                  ISO          C:\Users\Administrator\Documents\Win10_22H2...
VM-Thera IDE            1                0                  None
```
-[] Démarrer la machine virtuelle 
```powershell
Start-VM VM-Thera
```
## :b: installation de la machine VM
```powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
```
```powershell
vmconnect $HostName VM-Thera
```

## 🆎 connexion a la machine virtuelle
-[] Récuperer sur les informations de la machine virtuelle 
```powershell
Get-VM
```
> Resultat :
```python

----         -----   ----------- ----------------- ------             ------             -------
VM-Fousseyni Off     0           0                 00:00:00           Operating normally 10.0
VM-Thera     Running 3           4096              3.21:46:19.8630000 Operating normally 10.0
```
- [] Collecter les informations d'identification ( nom d'utilisateur et mot de passe) d'un utilisateur

  ```powershell
  $cred = Get-Credential
  ```
 > Resultat :
 ```Python
 cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
```
- [] Etablir une connexion interactive avec la machine virtuelle
```powershell
Enter-PSSession -VMName VM-Thera -Credential $cred
```
> Resultat :
```Python
[VM-Thera]: PS C:\Users\Thera\Documents>
```
## 🅾️ Connexion à l'internet : globe_with_meridians
 
### : round_pushpin: Création du commutateur (switch) virtuel externe sur le serveur

-[ ] Determiner les adaptateurs réseaux (cartes Ethernets)
```powershell
 Get-NetAdapter
```
> Resultat :
```python
---                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Microsoft Hyper-V Network Adapter             5 Disconnected 00-15-5D-ED-1A-02        10 Gbps
```
- [ ] Choisir la carte qui a son état up (disponible), prendre le nom de la carte et l'assigner à une variable $net
```powershell
 $net = Get-NetAdapter -Name 'Ethernet'
```







