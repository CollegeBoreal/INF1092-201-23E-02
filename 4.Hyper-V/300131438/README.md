# 💻  CREATION DE LA MACHINE VIRTUELLE VM.ESTELLE( WINDOW 1O)
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-ESTELLE.vhdx" -SizeBytes 32GB -Dynamic
```
> RESULTAT
```PYTHON
ComputerName            : WIN-A49Q5MI8IPQ
Path                    : C:\Users\Administrator\Documents\VM-ESTELLE.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 375465A7-5BC5-4C1B-8339-CFAAA72FBA32
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
#  Monter l'image disque en DVD avec la commande "mount-DisKImage"
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```

>> RESULTAT
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
