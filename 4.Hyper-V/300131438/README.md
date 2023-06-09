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
# VERIFICATION
```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```

>RESULTAT
```PYTHON
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  30.34        242.45 FileSystem    C:\                                            Users\Administrator
D                   5.72          0.00 FileSystem    D:\
Z                  60.34        212.45 FileSystem    \\10.13.237.25\Users
```
# CREATION DE LA MACHINE VIRTUELLE (DE 4GB DE MEMOIRE)
```POWERSHELL
$VM = New-VM -Name VM-ESTELLE -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-ESTELLE.vhdx"
```
# VERIFICATION 
```POWERSHELL
Get-VM
```
>RESULTAT
```PYTHON
Name       State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----       -----   ----------- ----------------- ------           ------             -------
VM-ESTELLE Off     0           0                 00:00:00         Operating normally 10.0
VM-MIRIAM  Running 0           4096              16:25:47.5640000 Operating normally 10.0
```
# AJOUTER LE DISQUE DE DEMARAGE POUR MA VM
>CHECK DES DISQUES PRESENTS
```POWERSHELL
 Get-VMDVDDrive -VMName  VM-ESTELLE
```
>RESULTAT
```PYTHON

VMName     ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------     -------------- ---------------- ------------------ ------------ ----
VM-ESTELLE IDE            1                0                  None
```
> AJOUT DU DISQUE POUR LA VM-ESTELLE
```POWERSHELL
Add-VMDvdDrive -VMName VM-ESTELLE -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
>DEUXIEME CHECK DES DISQUES PRESENTS
```POWERSHELL
Get-VMDVDDrive -VMName VM-ESTELLE
```
>RESULTAT
```PYTHON

VMName     ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------     -------------- ---------------- ------------------ ------------ ----
VM-ESTELLE IDE            0                1                  ISO          C:\Users\Administrator\Documents\Win10_22...
VM-ESTELLE IDE            1                0                  None
```
# 🔦ACTIVER LA MACHINE virtuelle
```powershell
Start-VM VM-ESTELLE
```
# INSTALLATION DE LA VM AVEC (vmconnect)
```powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-ESTELLE
```
