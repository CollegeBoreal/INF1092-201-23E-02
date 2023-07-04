
- [ ] Copy ISO File (être très patient) from [Download Windows 10 Disc Image (ISO File)](https://www.microsoft.com/en-us/software-download/windows10ISO)

```powershell
Copy-Item -Path "E:\Win10_22H2_English_x64v1.iso" -Destination "$ENV:USERPROFILE\Documents"
```

- [ ] Créer le disque virtuel pour la machine virtuelle

```PowerShell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -SizeBytes 32GB -Dynamic 
```
> Reponse :
```python

ComputerName            : WIN-77KAV1BUA4O
Path                    : C:\Users\Brice\Documents\VM-Brice.vhdx
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

- [ ] Monter l'image dique en DVD

```powershell
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
> Response:
```python


Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM3
FileSize          : 6140975104
ImagePath         : C:\Users\Brice\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 3
Size              : 6140975104
StorageType       : 1
PSComputerName    :

```

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Response:
```python

Name           Used (GB)     Free (GB) Provider      Root                                                           CurrentLocation
----           ---------     --------- --------      ----                                                           ---------------
C                  59.80        212.99 FileSystem    C:\                                                      Users\Brice\Documents
D                                      FileSystem    D:\
E              179496.88      58904.14 FileSystem    \\TSCLIENT\Downloads
F                                      FileSystem    F:\
G                   5.44          0.00 FileSystem    G:\
H                   5.72          0.00 FileSystem    H:\

```

- [ ] Créer la machine virtuelle

```powershell
$VM = New-VM -Name VM-Brice -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Brice.vhdx"
```

```powershell
Get-VM
```
> Response :
```python
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Brice Off   0           0                 00:00:00 Operating normally 10.0
```

- [ ] Ajouter le disque de démarrage

```powershell
Get-VMDVDDrive -VMName $VM.VMName
```
> Response :
```python

VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Brice IDE            1                0                  None

```

```powershell
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```

```powershell
Get-VMDVDDrive -VMName $VM.VMName
```
> Response :
```python

VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Brice IDE            0                1                  ISO          C:\Users\Brice\Documents\Win10_22H2_English_x64v1.iso
VM-Brice IDE            1                0                  None

```

```powershell
Set-VMFirmware $VM.VMName -FirstBootDevice $DVD
```

```powershell
Start-VM VM-Brice
```

```powershell
Stop-VM -Name VM-Brice -Force
```

```powershell
Remove-VM -Name VM-Brice -Force
```

```powershell
Remove-Item -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -Force
```


```powershell
Remove-Item -Path "$ENV:USERPROFILE\Documents\VM-Brice"  -Force 
```


```powershell
Start-VM -Name VM-Brice
```

```powershell
Get-VM
```
> Response:
```python

Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Brice Running 0           4096              00:00:08.5860000 Operating normally 10.0
```

```powershell
Get-VM
```
> Response:
```python
Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Brice Running 0           4096              00:00:10.2960000 Operating normally 9.0
```

```powershell
$cred = Get-Credential
```
> Response:
```python

cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
```

```
PS > Enter-PSSession -VMName "VM-Brice" -Credential $cred
```
> Response :
```python
Enter-PSSession : An error has occurred which Windows PowerShell cannot handle. A remote session might have ended.
At line:1 char:1
+ Enter-PSSession -VMName "VM-Brice" -Credential $cred
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Enter-PSSession], PSRemotingDataStructureException
    + FullyQualifiedErrorId : CreateRemoteRunspaceForVMFailed,Microsoft.PowerShell.Commands.EnterPSSessionCommand
```


# References


- [ ] [Managing Hyper-V VMs using PowerShell Direct](https://www.red-gate.com/simple-talk/sysadmin/powershell/managing-hyper-v-vms-using-powershell-direct/)
- [ ] [How to map network drive using PowerShell on Windows 10](https://pureinfotech.com/map-network-drive-powershell-windows-10/)
- [ ] [PowerShell Hyper-V VM creation and boot](https://stackoverflow.com/questions/61144238/powershell-hyper-v-vm-creation-and-boot)
- [ ] [How To Easily Create a Hyper-V VM Using Powershell](https://www.danielengberg.com/create-hyper-v-vm-powershell/)
