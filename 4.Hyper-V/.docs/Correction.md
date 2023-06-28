-Dynamic 

```powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -SizeBytes 5GB -Credential (Get-Credential)
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

- [ ] Copy ISO File

```powershell
Copy-Item -Path "E:\en-us_windows_server_2022_x64_dvd_620d7eac.iso" -Destination "$ENV:USERPROFILE\Documents"
```

```powershell
New-VM -Name VM-Brice -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -Generation 2 `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Brice.vhdx"
```
> Response :
```python
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Brice Off   0           0                 00:00:00 Operating normally 10.0
```

```
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


## Remote Desktop Connection

```powershell
net use
```
> Response :
```python
New connections will be remembered.


Status       Local     Remote                    Network

-------------------------------------------------------------------------------
                       \\TSCLIENT\Downloads      Microsoft Terminal Services
The command completed successfully.
```

```powershell
New-PSDrive -Name "E" -PSProvider "FileSystem" -Root "\\TSClIENT\Downloads" -Persist
```
> Response:
```
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
E              177865.97      60533.16 FileSystem    \\TSClIENT\Downloads
```

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Response:
```
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  21.18        251.61 FileSystem    C:\                                  Users\Administrator\Documents
D                                      FileSystem    D:\
E              177874.43      60526.59 FileSystem    \\TSClIENT\Downloads
```

# References


- [Managing Hyper-V VMs using PowerShell Direct](https://www.red-gate.com/simple-talk/sysadmin/powershell/managing-hyper-v-vms-using-powershell-direct/)
- [How to map network drive using PowerShell on Windows 10](https://pureinfotech.com/map-network-drive-powershell-windows-10/)
