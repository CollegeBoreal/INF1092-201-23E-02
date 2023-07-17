

```powershell
 $net = Get-NetAdapter -Name 'Ethernet'
```

```powershell
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```
> Response:
```powershell
Name               SwitchType NetAdapterInterfaceDescription
----               ---------- ------------------------------
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```

# References

- [ ] [Create a Virtual Switch with PowerShell](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network#create-a-virtual-switch-with-powershell)
