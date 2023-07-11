# creation du disque virtuel VM-Massil
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Massil.vhdx" -SizeBytes 32GB -Dynamic 
```
resultats :
```PYTHON
ComputerName            : WIN-F8M1G3SNO23
Path                    : C:\Users\Administrateur\Documents\VM-Massil.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 20EFEC9E-35E1-4568-8A10-E127841FF15B
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
