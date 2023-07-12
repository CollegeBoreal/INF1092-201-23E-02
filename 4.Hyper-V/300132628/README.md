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
