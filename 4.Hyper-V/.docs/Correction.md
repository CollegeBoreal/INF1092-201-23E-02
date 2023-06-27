```powershell
 New-VHD -Path "C:\Users\Brice\Documents\MyVM.vhdx" -SizeBytes 5GB -Dynamic
```
> Reponse :
```python


ComputerName            : WIN-BDAG7LU7LU7
Path                    : C:\USers\Brice\Documents\MyVM.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 5368709120
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : D33F0385-E398-491E-9E30-5C4B338D7A89
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```

```powershell
New-VM -Name "VM-Brice" -Path "C:\Users\Brice\Documents" `
                        -MemoryStartupBytes 4GB `
                        -Generation 2 `
                        -VHDPath "C:\Users\Brice\Documents\MyVM.vhdx"
```
> Response :
```python
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Brice Off   0           0                 00:00:00 Operating normally 9.0
```

```powershell
Remove-VM -Name "VM-Brice"-Force
```

```powershell
Remove-Item -Path "C:\Users\Brice\Documents\VM-Brice.vhdx" -Force
```
