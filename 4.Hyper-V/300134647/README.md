# :slot_machine: Machine Virtuelle

## :a: Création de la Vm
```

- [ ] Créer le disque virtuel pour la machine virtuelle

```PowerShell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Valentin.vhdx" -SizeBytes 32GB -Dynamic 
```
Cette commande crée un nouveau disque virtuel (VHD) avec une taille de 32GB et un format dynamique. Elle prépare le disque virtuel sur lequel la machine virtuelle sera installée.
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
- [ ] Monter l'image disque en DVD
```powershell
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Cette commande monte une image disque à partir d'un fichier ISO de Windows 10. L'image disque ISO contient les fichiers d'installation de Windows 10

> Resultat :
