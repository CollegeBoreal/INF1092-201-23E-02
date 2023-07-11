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
