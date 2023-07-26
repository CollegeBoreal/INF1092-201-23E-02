# :slot_machine: Machine Virtuelle

## :a: Création de la Vm
```

- [ ] Créer le disque virtuel pour la machine virtuelle

```PowerShell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Valentin.vhdx" -SizeBytes 32GB -Dynamic 
```
> Reponse :
```python

ComputerName            : WIN-77KAV1BUA4O
Path                    : C:\Users\Brice\Documents\VM-Valentin.vhdx
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
```

# Hyper-V

# 🅰️ Creation de la VM
```powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Lassine.vhdx" -SizeBytes 32GB -Dynamic
```
> Réponse:
```python


ComputerName            : WIN-KT672KKKI3O
Path                    : C:\Users\Administrator\Documents\VM-Lassine.vhdx
VhdFormat               : VHDX
