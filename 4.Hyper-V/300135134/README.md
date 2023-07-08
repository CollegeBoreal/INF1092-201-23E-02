# creation de la machine virtuelle
```POWERSHELL
New-VHD -Path "$ENV:USERPROFILE\Documents\VM-lionel.vhdx" -SizeBytes 32GB -Dynamic
```
RESULTATS
```PYTHON
ComputerName            : WIN-B435EULM6RL
Path                    : C:\Users\Administrator\Documents\VM-lionel.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : CAD5A105-610F-47AC-9C8C-3617F852936D
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
