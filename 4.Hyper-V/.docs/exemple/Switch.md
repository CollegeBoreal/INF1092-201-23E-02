

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

```powershell
Get-DnsClientServerAddress
```
> Response:
```powershell

InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            11 IPv4    {}
Ethernet                            11 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec...
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {}
```

```powershell
Set-DNSClientServerAddress "Ethernet" -ServerAddresses ("1.1.1.1","8.8.8.8")
```

```powershell
Get-DnsClientServerAddress
```
> Response:
```powershell

InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            11 IPv4    {1.1.1.1, 8.8.8.8}
Ethernet                            11 IPv6    {}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {}
```

```powershell
Test-NetConnection -ComputerName "google.com"
```
> Response:
```powershell


ComputerName           : google.com
RemoteAddress          : 142.251.32.78
InterfaceAlias         : Ethernet
SourceAddress          : 10.13.237.125
PingSucceeded          : True
PingReplyDetails (RTT) : 15 ms
```

# References

- [ ] [Create a Virtual Switch with PowerShell](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network#create-a-virtual-switch-with-powershell)
