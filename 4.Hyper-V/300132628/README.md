# Création du disque virtuelle pour la machine
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Hakim.vhdx" -SizeBytes 32GB -Dynamic 
```
Resultat
```Python
ComputerName            : WIN-QK6U295MSEU
Path                    : C:\Users\Administrateur\Documents\VM-Hakim.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 6CE9DE50-514C-4DC2-BCC4-0C05CBD9C207
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
# Monter l'image disque en DVD (pas utile)
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Resultat
```Python
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM0
FileSize          : 6140975104
ImagePath         : C:\Users\Administrateur\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 0
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```
```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```
Resultat
```python
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  25,44        247,31 FileSystem    C:\                                           Users\Administrateur
D                   5,72          0,00 FileSystem    D:\
Z                  61,11        211,68 FileSystem    \\10.13.237.25\Users
```
# Créer la machine virtuelle
```POWERSHELL
$VM = New-VM -Name VM-Hakim -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Hakim.vhdx"
Get-VM
```
Resultat
```Python
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status                Version
----     ----- ----------- ----------------- ------   ------                -------
VM-Hakim Off   0           0                 00:00:00 Fonctionnement normal 10.0
```
# Ajouter le disque de démarrage
```POWERSHELL
Get-VMDVDDrive -VMName VM-Hakim
```
Resultat
```Python
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Hakim IDE            1                0                  None
```
```POWERSHELL
Add-VMDvdDrive -VMName VM-Hakim -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName VM-Hakim
```
Resultat
```Python
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Hakim IDE            0                1                  ISO          C:\Users\Administrateur\Documents\Win10_22H...
VM-Hakim IDE            1                0                  None
```
# Démarrer la machine virtuelle
```POWERSHELL
Start-VM VM-Hakim
```
# Installer la machine virtuelle avec vmconnect
```POWERSHELL
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-Hakim















