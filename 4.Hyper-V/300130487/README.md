# CREATION DU DISQUE VIRTUEL POUR LA MACHINE VIRTUELLE 
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Archange.vhdx" -SizeBytes 32GB -Dynamic
```
Resultat 
```PYTHON

ComputerName            : WIN-2U28H0SD9S1
Path                    : C:\Users\Administrator\Documents\VM-Archange.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : A61C1A66-5AD3-4C99-B5D7-C03C33253035
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
# MONTAGE DU DISQUE EN DVD
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Resultat 
```PYTHON
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM0
FileSize          : 6140975104
ImagePath         : C:\Users\Administrator\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 0
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```
```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```
Resultat
```PYTHON
Name           Used (GB)     Free (GB) Provider      Root                                                                     CurrentLocation
----           ---------     --------- --------      ----                                                                     ---------------
C                  23,13        249,73 FileSystem    C:\                                                                  Users\Administrator
D                   5,72          0,00 FileSystem    D:\
Z                  60,96        211,83 FileSystem    \\10.13.237.25\Users
```
#  Créer la machine virtuelle
```POWERSHELL
$VM = New-VM -Name VM-Archange -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Archange.vhdx"
Get-VM
```
# AJOUT DU DISQUE DE DEMARRAGE
```POWERSHELL
Get-VMDVDDrive -VMName VM-Archange
```
RESULTAT
```PYTHON
VMName      ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------      -------------- ---------------- ------------------ ------------ ----
VM-Archange IDE            1                0                  None
```
# COMMANDES
```POWERSHELL

Add-VMDvdDrive -VMName VM-Archange -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"

Get-VMDVDDrive -VMName VM-Archange
```
RESULTAT
```PYTHON

VMName      ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------      -------------- ---------------- ------------------ ------------ ----
VM-Archange IDE            0                1                  ISO          C:\Users\Administrator\Documents\Win10_22H2_English_x64v1.iso
VM-Archange IDE            1                0                  None
```
# 🎈 DEMARRER LA MACHINE VIRTUELLE 
```POWERSHELL
Start-VM VM-Archange
```
# 🥇CONNEXION A LA VM
```POWERSHELL
Get-VM
```
RESULTAT
```PYTHON

Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Archange Running 0           4096              00:00:08.5860000 Operating normally 9.0
```
# 🎌Collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur.
```POWERSHELL
$cred = Get-Credential
```
RESULTAT
```PYTHON
cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
```
# 🥉CREATION DU SWITCH VIRTUEL 
selction de l'interface up (disponible)
```POWERSHELL
 $net = Get-NetAdapter -Name 'Ethernet'
```
Création du switch virtuel
```POWERSHELL
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```
resultat
```PYTHON
Name               SwitchType NetAdapterInterfaceDescription
----               ---------- ------------------------------
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```
 Vérifier que la Switch Virtuelle (le commutateur virtuel) à bien été crée
 ```POWERSHELL
get-netadapter
```
RESULTAT
```PYTHON

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
vEthernet (External VM... Hyper-V Virtual Ethernet Adapter             21 Up           78-E7-D1-65-6A-EC         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      11 Disconnected 78-E7-D1-65-6A-EE          0 bps
```
# 😎  Établir une session interactive à distance avec la VM
```POWERSHELL
Enter-PSSession -VMName VM-Archange -Credential $cred
```
RESULTAT
```PYTHON
[VM-Archange]: PS C:\Users\Archange\Documents>
OU ERREUR ❎
Enter-PSSession : The credential is invalid.
At line:1 char:1
+ Enter-PSSession -VMName VM-Archange -Credential $cred
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (:) [Enter-PSSession], PSDirectException
    + FullyQualifiedErrorId : CreateRemoteRunspaceForVMFailed,Microsoft.PowerShell.Commands.EnterPSSessionCommand
```
# ASSINGATION D'UNE ADDRESSE IP À LA MACHINE
```POWERSHELL
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.138" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```
CONFIGURER LES ADDRESSES DNS
```POWERSHELL
Get-DnsClientServerAddress
```
RESULTAT
```PYTHON

InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            11 IPv4    {}
Ethernet                            11 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec...
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {}
```
# 🔤 Assigner des adresses IP à la configuration DNS 1.1.1.1 étant le DNS de CloudFare, 8.8.8.8 étant le DN de Google
```POWERSHELL
Set-DNSClientServerAddress "Ethernet" -ServerAddresses ("1.1.1.1","8.8.8.8")
```
Visualiser la configuration
```POWERSHELL
Get-DnsClientServerAddress
```
RESULTAT
```PYTHON

InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            11 IPv4    {1.1.1.1, 8.8.8.8}
Ethernet                            11 IPv6    {}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {}
```
Tester la connection
```POWERSHELL
Test-NetConnection -ComputerName "google.com"
```
RESULTAT
```PYTHON


ComputerName           : google.com
RemoteAddress          : 142.251.32.78
InterfaceAlias         : Ethernet
SourceAddress          : 10.13.237.125
PingSucceeded          : True
PingReplyDetails (RTT) : 15 ms
```
# ⚠️ DÉTRUIRE LA MACHINE 👽
```POWERSHELL
Stop-VM -Name VM-Archange -Force
```
Supprimer la VM
```POWERSHELL
Remove-VM -Name VM-Archange -Force
```
Supprimer le disque
```POWERSHELL
Remove-Item -Path "$ENV:USERPROFILE\Documents\VM-Archange.vhdx" -Force
```
SUPPRIMER LES INFORMATIONS DE LA VM
```POWERSHELL
Remove-Item -Path "$ENV:USERPROFILE\Documents\VM-Archange"  -Force
``` 








