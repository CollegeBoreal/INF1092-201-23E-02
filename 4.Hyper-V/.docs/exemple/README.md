# :slot_machine: Machine Virtuelle

## :a: Création de la VM 

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

- [ ] Monter l'image disque en DVD (pas utile)

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

- [ ] Démarrer la machine virtuelle

```powershell
Start-VM VM-Brice
```

## :b: Installation de la VM

:bulb: Note: `vmconnect` permet uniquement la connection en mode interactive (GUI - Graphical User Interface - Interface Homme Machine)

- [ ] Installer la machine virtuelle avec [`vmconnect`](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/learn-more/hyper-v-virtual-machine-connect)

```powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
```

```powershell
vmconnect $HostName VM-Brice
```

## :ab: Connexion à la VM

:bulb: Note: `PSSession` permet uniquement la connection en mode CLI (Command Level Interface) pour entrer les commandes `PowerShell` sur la machine virtuelle

- [ ] Récupérer les informations sur la VM

```powershell
Get-VM
```
> Response:
```python

Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Brice Running 0           4096              00:00:08.5860000 Operating normally 10.0
```

- [ ] Collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur.

```powershell
$cred = Get-Credential
```
> Response:
```python

cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
```

- [ ] Établir une session interactive à distance avec la VM

```
Enter-PSSession -VMName VM-Brice -Credential $cred
```
> Response :
```python
[VM-Brice]: PS C:\Users\Brice\Documents>
```

Ou Erreur :x:

> Response :
```python
Enter-PSSession : An error has occurred which Windows PowerShell cannot handle. A remote session might have ended.
At line:1 char:1
+ Enter-PSSession -VMName "VM-Brice" -Credential $cred
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Enter-PSSession], PSRemotingDataStructureException
    + FullyQualifiedErrorId : CreateRemoteRunspaceForVMFailed,Microsoft.PowerShell.Commands.EnterPSSessionCommand
```



## :o2: Connexion à l'Internet :globe_with_meridians:

:one: Sur le serveur Windows :desktop_computer:

#### :round_pushpin: Création du commutateur (Switch) virtuel externe sur le serveur

- [ ] Déterminer les adaptateurs réseaux (Cartes Ethernets)

```powershell
 Get-NetAdapter
```
> Response:
```powershell
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      11 Disconnected 78-E7-D1-65-6A-EE          0 bps
```

- [ ] Choisir la carte qui a son état à `Up` (Disponible), prendre le nom de la carte et l'assigner à une variable `$net`

```powershell
 $net = Get-NetAdapter -Name 'Ethernet'
```

- [ ] Créer la `Switch Virtuelle` (le commutateur virtuel) grâce à la variable `$net` récupérée ci-dessus

```powershell
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```
> Response:
```powershell
Name               SwitchType NetAdapterInterfaceDescription
----               ---------- ------------------------------
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```

- [ ] Vérifier que la `Switch Virtuelle` (le commutateur virtuel) à bien été crée

```powershell
get-netadapter
```
> Response:
```powershell

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
vEthernet (External VM... Hyper-V Virtual Ethernet Adapter             21 Up           78-E7-D1-65-6A-EC         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      11 Disconnected 78-E7-D1-65-6A-EE          0 bps

```

#### :round_pushpin: Assigner une carte réseau virtuelle à la machine virtuelle

- [ ] Récupérer les paramètres de la VM

```
$vm = Get-VM "VM-Brice"
```

- [ ] Assigner les valeurs de la carte réseau de la machine à la variable `$networkAdapter` 

```
$networkAdapter = Get-VMNetworkAdapter -VM $vm
```

- [ ] Vérifier que la variable `$networkAdapter` à bien la bonne information

```
$networkAdapter
```
> Response:
```python

Name            IsManagementOs VMName   SwitchName MacAddress   Status IPAddresses
----            -------------- ------   ---------- ----------   ------ -----------
Network Adapter False          VM-Brice            00155D50F10D {Ok}   {169.254.143.210}

```

- [ ] connecter la carte réseau de la VM à la `switch` virtuelle

```
Connect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter -SwitchName "External VM Switch"
```

- [ ] Vérifier l'assignation en regardant le nom de la colonne `SwitchName`

```
Get-VMNetworkAdapter -VM $vm
```
> Response:
```python
Name            IsManagementOs VMName   SwitchName         MacAddress   Status IPAddresses
----            -------------- ------   ----------         ----------   ------ -----------
Network Adapter False          VM-Brice External VM Switch 00155D50F10D {Ok}   {169.254.143.210}

```

:two: Sur la machine virtuelle :computer:

#### :round_pushpin: Assigner une adresse à la machine virtuelle

Grâce à la création du commutateur virtuel externe, on peut maintenant donner une adresse IP à la machine virtuelle

:warning: Se connecter à la machine virtuelle par la session `PSSession` et utiliser les instructions de connexion suivantes:

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.1XX" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```

:bulb: Notes: 

* `XX` à remplacer avec votre adresse IP et y ajouter un `1` par exemple si mon adresse IP se termine par `25` (10.13.237.25), il faut rajouter `1` avant `25` soit `10.23.237.125`
* Vérifier également que l'`InterfaceAlias` ou l'alias de l'interface réseau se nomme bien `Ethernet` sinon utiliser `Get-NetAdapter` pour récupérer le nom de l'interface

#### :round_pushpin: Configurer les adresses DNS

- [ ] Visualiser la configuration présente

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

- [ ] Assigner des adresses IP à la configuration DNS `1.1.1.1` étant le DNS de `CloudFare`, `8.8.8.8` étant le DN de Google 

```powershell
Set-DNSClientServerAddress "Ethernet" -ServerAddresses ("1.1.1.1","8.8.8.8")
```

- [ ] Visualiser la nouvelle configuration

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

- [ ] Tester la connection externe (ping)

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

## :x: Détruire la machine :skull_and_crossbones:

- [ ] Arreter la VM

```powershell
Stop-VM -Name VM-Brice -Force
```

- [ ] Supprimer la VM

```powershell
Remove-VM -Name VM-Brice -Force
```

- [ ] Supprimer le disque

```powershell
Remove-Item -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -Force
```

- [ ] Supprimer les informations de la VM

```powershell
Remove-Item -Path "$ENV:USERPROFILE\Documents\VM-Brice"  -Force 
```

# References


- [ ] [Managing Hyper-V VMs using PowerShell Direct](https://www.red-gate.com/simple-talk/sysadmin/powershell/managing-hyper-v-vms-using-powershell-direct/)
- [ ] [How to map network drive using PowerShell on Windows 10](https://pureinfotech.com/map-network-drive-powershell-windows-10/)
- [ ] [PowerShell Hyper-V VM creation and boot](https://stackoverflow.com/questions/61144238/powershell-hyper-v-vm-creation-and-boot)
- [ ] [How To Easily Create a Hyper-V VM Using Powershell](https://www.danielengberg.com/create-hyper-v-vm-powershell/)
- [ ] [Create a Virtual Switch with PowerShell](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network#create-a-virtual-switch-with-powershell)
- [ ] Pour Déconnecter une VM Switch

```
Disconnect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter
```

