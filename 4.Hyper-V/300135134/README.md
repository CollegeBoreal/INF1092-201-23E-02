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
# MONTAGE DU DISQUE DUR
```POWERSHELL
 Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
RESULTATS
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
```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```
RESULTATS
```PYTHON

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  29.25        243.54 FileSystem    C:\                                            Users\Administrator
D                   5.72          0.00 FileSystem    D:\
Z                  60.42        212.37 FileSystem    \\10.13.237.25\Users
```
# creation de la machine virtuelle (4gb memory)
```POWERSHELL
$VM = New-VM -Name VM-lionel -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-lionel.vhdx"
```
# VERIFICATION DES MACHINES VIRTUELLE
```POWERSHELL
Get-VM
```
RESULTATS
```PYTHON

Name      State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----      -----   ----------- ----------------- ------           ------             -------
VM-dave   Running 0           4096              00:42:38.5840000 Operating normally 10.0
VM-lionel Off     0           0                 00:00:00         Operating normally 10.0
```
# AJOUT DU DISQUE DE DEMARRAGE
```POWERSHELL
Get-VMDVDDrive -VMName VM-lionel
```
RESULTATS
```PYTHON

VMName    ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------    -------------- ---------------- ------------------ ------------ ----
VM-lionel IDE            1                0                  None
```
```POWERSHELL
Add-VMDvdDrive -VMName VM-lionel -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName VM.lionel
```
RSULTATS
```PYTHON

VMName    ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------    -------------- ---------------- ------------------ ------------ ----
VM-lionel IDE            0                1                  ISO          C:\Users\Administrator\Documents\Win10_22H...
VM-lionel IDE            1                0                  None
```
# DEMMARER LA MACHINE VIRTUELLE
```POWERSHELL
Start-VM VM-lionel
```
# INSTALLATION DE LA VM AVEC vmconnect
```POWERSHELL
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-lionel
```
# CONNECXION A LA VM
```POWERSHELL
