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
# montage du disque en DVD :
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Resultats: 
```python
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM1
FileSize          : 6140975104
ImagePath         : C:\Users\Administrateur\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 1
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```
```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```
RESULTATS :
```PYTHON
Name           Used (GB)     Free (GB) Provider      Root                                                                                                                       CurrentLocation
----           ---------     --------- --------      ----                                                                                                                       ---------------
C                  23,97        248,78 FileSystem    C:\                                                                                                                   Users\Administrateur
D                   5,72          0,00 FileSystem    D:\
E                                      FileSystem    E:\
```

# creation de la machine virtuelle :
```POWERSHELL
$VM = New-VM -Name VM-Massil -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Massil.vhdx"
Get-VM
```
RESULTAT :
```PYTHON
Name      State CPUUsage(%) MemoryAssigned(M) Uptime   Status                Version
----      ----- ----------- ----------------- ------   ------                -------
VM-Massil Off   0           0                 00:00:00 Fonctionnement normal 10.0
```
# Ajout du disque de demarrage :
```POWERSHELL
Get-VMDVDDrive -VMName VM-Massil
```
resultat :
```PYTHON
VMName    ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------    -------------- ---------------- ------------------ ------------ ----
VM-Massil IDE            1                0                  None
```
```POWERSHELL
Add-VMDvdDrive -VMName VM-Massil -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName VM-Massil
```
resultats :
```python
VMName    ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------    -------------- ---------------- ------------------ ------------ ----
VM-Massil IDE            0                1                  ISO          C:\Users\Administrateur\Documents\Win10_22H2_English_x64v1.iso
VM-Massil IDE            1                0                  None
```
# demarrage de la machine virtuelle 
```POWERSHELL
Start-VM VM-Massil
```
#installation de la VM avec vmconnect
```POWERSHELL
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-Massil
```
#creation du switch
```powershell
 Get-NetAdapter
```
resultat:
```python

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      11 Disconnected 78-E7-D1-65-6A-EE          0 bps
```
 ```powershell
 $net = Get-NetAdapter -Name 'Ethernet'
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName "Ethernet"
 ```
resultat
 ```python
Name               SwitchType NetAdapterInterfaceDescription
----               ---------- ------------------------------
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```
#Établir une session interactive à distance avec la VM
```powershell
Enter-PSSession -VMName VM-Massil -Credential $cred
```
resultat 
```python
[VM-Massil] : PS C:\Users\Massil\Documents>
```
#attribution de l'addresse ip a la VM-Massil

