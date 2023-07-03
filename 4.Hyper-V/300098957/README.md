
- [ ] Copy ISO File (être très patient)

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
Size                    : 5368709120
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : A5A20510-8125-41DA-82C5-15A727DC1B0B
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
DevicePath        : \\.\CDROM1
FileSize          : 603045888
ImagePath         : C:\Users\Brice\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 1
Size              : 603045888
StorageType       : 1
PSComputerName    :
```

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Response:
```python

Name           Used (GB)     Free (GB) Provider      Root                                                             CurrentLocation
----           ---------     --------- --------      ----                                                             ---------------
C                  26.90        245.89 FileSystem    C:\                                                             Windows\system32
D                                      FileSystem    D:\
E              179336.02      59065.01 FileSystem    \\TSCLIENT\Downloads
F                   0.56          0.00 FileSystem    F:\
```

- [ ] Créer la machine virtuelle

```powershell
$VM = New-VM -Name VM-Brice -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Brice.vhdx"
```
> Response :
```python
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Brice Off   0           0                 00:00:00 Operating normally 10.0
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
