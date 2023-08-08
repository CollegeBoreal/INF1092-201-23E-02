# Création du disque virtuelle pour la machine
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Hakim.vhdx" -SizeBytes 32GB -Dynamic 
```
Resultat
```Python
ComputerName            : WIN-QK6U295MSEU
Path                    : C:\Users\Administrateur\Documents\VM-Hakim.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 6CE9DE50-514C-4DC2-BCC4-0C05CBD9C207
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
# Monter l'image disque en DVD (pas utile)
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Resultat
```Python
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM0
FileSize          : 6140975104
ImagePath         : C:\Users\Administrateur\Documents\Win10_22H2_English_x64v1.iso
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
```python
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  25,44        247,31 FileSystem    C:\                                           Users\Administrateur
D                   5,72          0,00 FileSystem    D:\
Z                  61,11        211,68 FileSystem    \\10.13.237.25\Users
```
# Créer la machine virtuelle
```POWERSHELL
$VM = New-VM -Name VM-Hakim -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Hakim.vhdx"
Get-VM
```
Resultat
```Python
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status                Version
----     ----- ----------- ----------------- ------   ------                -------
VM-Hakim Off   0           0                 00:00:00 Fonctionnement normal 10.0
```
# Ajouter le disque de démarrage
```POWERSHELL
Get-VMDVDDrive -VMName VM-Hakim
```
Resultat
```Python
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Hakim IDE            1                0                  None
```
```POWERSHELL
Add-VMDvdDrive -VMName VM-Hakim -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName VM-Hakim
```
Resultat
```Python
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Hakim IDE            0                1                  ISO          C:\Users\Administrateur\Documents\Win10_22H...
VM-Hakim IDE            1                0                  None
```
# Démarrer la machine virtuelle
```POWERSHELL
Start-VM VM-Hakim
```
# Installer la machine virtuelle avec vmconnect
```POWERSHELL
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-Hakim
```
# CONNEXION A LA MACHINE VIRTUELLE
```POWERSHELL
GET-VM 
```
Resultat
```Python
Name     State   CPUUsage(%) MemoryAssigned(M) Uptime              Status                Version
----     -----   ----------- ----------------- ------              ------                -------
VM-Hakim Running 4           4096              21.09:48:55.8980000 Fonctionnement normal 10.0
```
# Collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur.
```POWERSHELL
$cred = Get-Credential
```
Resultat
```Python
applet de commande Get-Credential à la position 1 du pipeline de la commande
Fournissez des valeurs pour les paramètres suivants :
Credential
```
# CREATION DU SWITCH VIRTUEL
```POWERSHELL
$net = Get-NetAdapter -Name 'Ethernet'
New-VMSwitch -Name "Hakim VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```
Resultat
```Python
Name            SwitchType NetAdapterInterfaceDescription
----            ---------- ------------------------------
Hakim VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```
# Vérifier que la Switch Virtuelle (le commutateur virtuel) à bien été crée
```POWERSHELL
get-netadapter
```
Resultat
```Python
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      15 Disconnected 18-A9-05-3B-DD-BE          0 bps
vEthernet (Hakim VM Sw... Hyper-V Virtual Ethernet Adapter             19 Up           18-A9-05-3B-DD-BC         1 Gbps
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47       5 Up           18-A9-05-3B-DD-BC         1 Gbps
```
# Etablir une session interactive à distance avec la VM
 ```POWERSHELL
Enter-PSSession -VMName VM-Hakim -Credential $cred
```
Resultat
```Python
```
# ASSINGATION D'UNE ADDRESSE IP À LA MACHINE
```POWERSHELL
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.129" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```
Resultat
```Python
```
# CONFIGURER LES ADDRESSES DNS
```POWERSHELL
Get-DnsClientServerAddress
```
Resultat
```Python
InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                             6 IPv4    {}
Ethernet                             6 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
```

# Assigner le DNS 1.1.1.1 étant le DNS de CloudFare, 8.8.8.8 étant le DN de Google
```POWERSHELL
Set-DNSClientServerAddress "Ethernet" -ServerAddresses ("1.1.1.1","8.8.8.8")
```
# Visualiser la configuration
```POWERSHELL
Get-DnsClientServerAddress
```
Resultat
```Python
InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                             6 IPv4    {1.1.1.1, 8.8.8.8}
Ethernet                             6 IPv6    {}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
```






