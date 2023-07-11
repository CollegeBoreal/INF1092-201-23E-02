# CREATION DU DISQUE VIRTUEL POUR LA MACHINE VIRTUELLE 
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Archange.vhdx" -SizeBytes 32GB -Dynamic
```
Resultat 
```PYTHON

ComputerName            : WIN-2U28H0SD9S1
Path                    : C:\Users\Administrator\Documents\VM-Archange.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : A61C1A66-5AD3-4C99-B5D7-C03C33253035
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
# MONTAGE DU DISQUE EN DVD
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Resultat 
```PYTHON
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM0
FileSize          : 6140975104
ImagePath         : C:\Users\Administrator\Documents\Win10_22H2_English_x64v1.iso
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
```PYTHON
Name           Used (GB)     Free (GB) Provider      Root                                                                     CurrentLocation
----           ---------     --------- --------      ----                                                                     ---------------
C                  23,13        249,73 FileSystem    C:\                                                                  Users\Administrator
D                   5,72          0,00 FileSystem    D:\
Z                  60,96        211,83 FileSystem    \\10.13.237.25\Users
```
#  Créer la machine virtuelle
```POWERSHELL
$VM = New-VM -Name VM-Archange -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Archange.vhdx"
Get-VM
```
Resultat 
```PYTHON
Name        State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----        ----- ----------- ----------------- ------   ------             -------
VM-Archange Off   0           0                 00:00:00 Operating normally 9.0
```
