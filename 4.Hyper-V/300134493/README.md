# Hyper-V

# 🅰️  Creation de la VM
```powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Thera.vhdx" -SizeBytes 32GB -Dynamic
```
> Resultat
```Python
ComputerName            : WIN-OED1RCQ9NFR
Path                    : C:\Users\Administrator\Documents\VM-Thera.vhdx
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
-[] Monter l'image disque en DVD
```powershell
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
> Resultat
```Python

Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM1
FileSize          : 6140975104
ImagePath         : C:\Users\Administrator\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 1
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```

```powershell
Get-PSDrive -PSProvider FileSystem
> Resultat
```Python

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  35.31        237.48 FileSystem    C:\                                            Users\Administrator
D                   5.72          0.00 FileSystem    D:\
F                                      FileSystem    F:\
```
Créer la machine virtuelle 
```powershell
$VM = New-VM -Name VM-Thera -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Thera.vhdx"
> Resultat
```Python

Name         State   CPUUsage(%) MemoryAssigned(M) Uptime             Status             Version
----         -----   ----------- ----------------- ------             ------             -------
VM-Fousseyni Running 0           4096              2.10:22:31.6760000 Operating normally 10.0
VM-Thera     Off     0           0                 00:00:00           Operating normally 10.0








