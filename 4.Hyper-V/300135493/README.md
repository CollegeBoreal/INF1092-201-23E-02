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
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Desktop\Win10_22H2_English_x64v1.iso"
```
> Resultat
```python
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM1
FileSize          : 6140975104
ImagePath         : C:\Users\Administrator\Desktop\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 1
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```
```powershell
Get-PSDrive -PSProvider FileSystem
```
> Resultat
```python
Name           Used (GB)     Free (GB) Provider      Root                                                                                     CurrentLocation
----           ---------     --------- --------      ----                                                                                     ---------------
C                  19.19        253.68 FileSystem    C:\                                                                                  Users\Administrator
D                   5.72          0.00 FileSystem    D:\
F                                      FileSystem    F:\
Z                  60.33        212.46 FileSystem    \\10.13.237.25\Users
```

```powershell
 $VM = New-VM -Name VM-Lassine -Path "$ENV:USERPROFILE\Documents" `
                         -MemoryStartupBytes 4GB `
                         -VHDPath "$ENV:USERPROFILE\Documents\VM-Lassine.vhdx"
```
```powershell
Get-VM
```
> Resultat
```python
Name       State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----       ----- ----------- ----------------- ------   ------             -------
VM-Lassine Off   0           0                 00:00:00 Operating normally 9.0
```

```powershell
Get-VMDVDDrive -VMName $VM.VMName
```
> Resulta
```python
VMName     ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------     -------------- ---------------- ------------------ ------------ ----
VM-Lassine IDE            1                0                  None
```

```powershell
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName $VM.VMName
```
