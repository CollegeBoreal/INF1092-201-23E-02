# Hyper-v
```powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Lassine.vhdx" -SizeBytes 32GB -Dynamic
```
> Réponse:
```python


ComputerName            : WIN-KT672KKKI3O
Path                    : C:\Users\Administrator\Documents\VM-Lassine.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 086179E9-5299-4566-B2F8-EC07ECAF1B77
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```

```powershell
 $VM = New-VM -Name VM-Lassine -Path "$ENV:USERPROFILE\Documents" `
                         -MemoryStartupBytes 4GB `
                         -VHDPath "$ENV:USERPROFILE\Documents\VM-Lassine.vhdx"
```
