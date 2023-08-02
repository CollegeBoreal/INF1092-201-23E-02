```poershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Therra.vhdx" -SizeBytes 32GB -Dynamic
```
> Resultat
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

# Hyper-V

# 🅰️ Creation de la VM
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
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Desktop\Win10_22H2_English_x64v1.iso"
```
```powershell
Get-VMDVDDrive -VMName $VM.VMName
```
> Resulta
```python
VMName     ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------     -------------- ---------------- ------------------ ------------ ----
VM-Lassine IDE            0                1                  ISO          C:\Users\Administrator\Desktop\Win10_22H2_English_x64v1.iso
VM-Lassine IDE            1                0                  None
```

```powershell
Start-VM VM-Lassine
```
# 🅱️ Installation de la VM

```powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
```
```powershell
vmconnect $HostName VM-Lassine
```
# 🆎 Connexion à la VM
Installation de Windows sur la VM
<img src=images/IMG_20230705_165846.jpg width='' height='' > </img>
<img src=images/IMG_20230705_170004.jpg width='' height='' > </img>
<img src=images/IMG_20230705_170020.jpg width='' height='' > </img>
<img src=images/IMG_20230705_170103.jpg width='' height='' > </img>
<img src=images/IMG_20230705_170133.jpg width='' height='' > </img>
<img src=images/IMG_20230705_180701.jpg width='' height='' > </img>
<img src=images/IMG_20230705_181347.jpg width='' height='' > </img>
# - [X] Configuration du Réseaux de la VM
:1: Switch virtuelle
```powershell
 Get-NetAdapter
```
> Resultat
```python

```
```powershell
 $net = Get-NetAdapter -Name 'Ethernet'
```
```powershell
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```
```powershell
get-netadapter
```
> Resulatt
```python
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#47       8 Disconnected 98-4B-E1-66-E7-14          0 bps
vEthernet (External VM... Hyper-V Virtual Ethernet Adapter             19 Up           98-4B-E1-66-E7-16         1 Gbps
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#48       2 Up           98-4B-E1-66-E7-16         1 Gbps
```
:2: Conexion carte resseaux >> Carte virtuelle
```powershell
$vm = Get-VM "VM-Lassine"
```
```powershell
$networkAdapter = Get-VMNetworkAdapter -VM $vm
```
```powershell
$networkAdapter
```
```python
Name            IsManagementOs VMName     SwitchName MacAddress   Status IPAddresses
----            -------------- ------     ---------- ----------   ------ -----------
Network Adapter False          VM-Lassine            00155DED2700 {Ok}   {169.254.76.58, fe80::f866:f17d:9c5d:14df}
```
```powershell
Connect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter -SwitchName "External VM Switch"
```
```powershell
Get-VMNetworkAdapter -VM $vm
```
```python
Name            IsManagementOs VMName     SwitchName         MacAddress   Status IPAddresses
----            -------------- ------     ----------         ----------   ------ -----------
Network Adapter False          VM-Lassine External VM Switch 00155DED2700 {Ok}   {10.13.237.139, fe80::f866:f17d:9c5d:14df}
```
### Entrez dans la machine virtuelle
```powershell
Enter-PSSession -VMName VM-Lassine -Credential $cred
```
> Resultat
```python
[VM-Lassine]: PS C:\Users\Lassine\Documents>
```
```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.139" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```
> Resultat
```python

IPAddress         : 10.13.237.139
InterfaceIndex    : 13
InterfaceAlias    : Ethernet
AddressFamily     : IPv4
Type              : Unicast
PrefixLength      : 24
PrefixOrigin      : Manual
SuffixOrigin      : Manual
AddressState      : Tentative
ValidLifetime     : Infinite ([TimeSpan]::MaxValue)
PreferredLifetime : Infinite ([TimeSpan]::MaxValue)
SkipAsSource      : False
PolicyStore       : ActiveStore

IPAddress         : 10.13.237.139
InterfaceIndex    : 13
InterfaceAlias    : Ethernet
AddressFamily     : IPv4
Type              : Unicast
PrefixLength      : 24
PrefixOrigin      : Manual
SuffixOrigin      : Manual
AddressState      : Invalid
ValidLifetime     : Infinite ([TimeSpan]::MaxValue)
PreferredLifetime : Infinite ([TimeSpan]::MaxValue)
SkipAsSource      : False
PolicyStore       : PersistentStore
```
```powershell
Get-DnsClientServerAddress
```
> Resultat
```python
InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            13 IPv4    {}
Ethernet                            13 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
```
```powershell
[VM-Lassine]: PS C:\Users\Lassine\Documents> Set-DNSClientServerAddress "Ethernet" -ServerAddresses ("1.1.1.1","8.8.8.8")
[VM-Lassine]: PS C:\Users\Lassine\Documents> Get-DnsClientServerAddress
```
> Resultat
```python

InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            13 IPv4    {1.1.1.1, 8.8.8.8}
Ethernet                            13 IPv6    {}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
```
```powershell
[VM-Lassine]: PS C:\Users\Lassine\Documents> Test-NetConnection -ComputerName "google.com"
```
> Resultat
```python
ComputerName           : google.com
RemoteAddress          : 142.251.41.78
InterfaceAlias         : Ethernet
SourceAddress          : 10.13.237.139
PingSucceeded          : True
PingReplyDetails (RTT) : 18 ms
```
