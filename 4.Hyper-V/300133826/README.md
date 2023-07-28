# CREATION DE LA MACHINE VIRTUELLE VM-Othman

1️⃣ Installer le role Hyper V sur Windows Server

```POWERSHELL
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```


<img src="images/WhatsApp Image 2023-07-12 at 3.19.2811 PM.jpeg" width="253" height="337" > </img>



:two: Créer le disque virtuel pour la machine virtuelle

```POWERSHELL
New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -SizeBytes 32GB -Dynamic
```



Reponse:

```PYTON
ComputerName            : WIN-TJQ7DKNAHHUSI

Path                    : C:\Users\Administrators\Documents\VM-Brice.vhdx

VhdFormat               : VHDX

VhdType                 : Dynamic

FileSize                : 4194304

Size                    : 34359738368

MinimumSize             :

LogicalSectorSize       : 512

PhysicalSectorSize      : 4096

BlockSize               : 33554432

ParentPath              :

DiskIdentifier          : 7CD12920-A21F-4B93-8EBD-B93A4DD71DIUW

FragmentationPercentage : 0

Alignment               : 1

Attached                : False

DiskNumber              :

IsPMEMCompatible        : False

AddressAbstractionType  : None

Number                  :
```

<img src="images/2WhatsApp Image 2023-07-12 at 3.19.29 PM.jpeg" width="253" height="337" > </img>

3️⃣ Monter l'image disque en DVD :

```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```




```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```
<img src="images/WhatsApp Image 2023-07-12 at 3.19.30 PM (1).jpeg" width="253" height="337" > </img>


4️⃣ Créer la machine virtuelle :
```POWERSHELL
$VM = New-VM -Name VM-Othman -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Brice.vhdx"
```
```POWERSHELL
Get-VM
```
Response :
```PYTHON
Name     State CPUUsage(%) MemoryAssigned(M) Uptime   Status             Version
----     ----- ----------- ----------------- ------   ------             -------
VM-Othman Off   0           0                 05:02:03 Operating normally 10.0
```
<img src="images/WhatsApp Image 2023-07-12 at 3.19.31 PM.jpeg" width="253" height="337" > </img>

5️⃣ Ajouter le disque de démarrage:
```POWERSHELL
Get-VMDVDDrive -VMName $VM.VMName
```
Reponse:
```POWERSHELL
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Othman IDE            1                0                  None
```

```POWERSHELL
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```

```POWERSHELL
Get-VMDVDDrive -VMName $VM.VMName
```
Reponse:
```POWERSHELL
VMName   ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------   -------------- ---------------- ------------------ ------------ ----
VM-Othman IDE            0                1                  ISO          C:\Users\Brice\Documents\Win10_22H2_English_x64v1.iso
VM-Othman IDE            1                0                  None
```

<img src="images/WhatsApp Image 2023-07-12 at 3.19.33 PM (1).jpeg" width="253" height="337" > </img>

6️⃣ Démarrer la machine virtuelle:
```powershell
Start-VM VM-Othman
```

# Installation de la VM

1️⃣  Installer la machine virtuelle avec vmconnect :
```powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
```
```powershell
vmconnect $HostName VM-Othman
```
# Connexion à la VM 
1️⃣ Récupérer les informations sur la VM :
```powershell
Get-VM
```
return:
```powershell
Name     State   CPUUsage(%) MemoryAssigned(M) Uptime           Status             Version
----     -----   ----------- ----------------- ------           ------             -------
VM-Othman Running 0           4096              00:00:08.5860000 Operating normally 10.0
```
2️⃣ Collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur :
```powershell
$cred = Get-Credential
```
reponse:
```powershell
cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
```
3️⃣ Établir une session interactive à distance avec la VM :
```powershell
Enter-PSSession -VMName VM-Othman -Credential $cred
```
reponse:
```powershell
[VM-Othman]: PS C:\Users\Administrators\Documents>
```

# Connexion a internet
📍 Création du commutateur (Switch) virtuel externe sur le serveur
1️⃣ Déterminer les adaptateurs réseaux (Cartes Ethernets):
```powershell
Get-NetAdapter
```
Response:
```powershell
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
```
2️⃣ Choisir la carte qui a son état à Up (Disponible), prendre le nom de la carte et l'assigner à une variable $net
```powershell
$net = Get-NetAdapter -Name 'Ethernet'
```
3️⃣ Créer la Switch Virtuelle (le commutateur virtuel) grâce à la variable $net récupérée ci-dessus
```powershell
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
```
Reponse:
```powershell
Name               SwitchType NetAdapterInterfaceDescription
----               ---------- ------------------------------
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```
4️⃣ Vérifier que la Switch Virtuelle (le commutateur virtuel) à bien été crée
```powershell
get-netadapter
```
Reponse:
```powershell
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
vEthernet (External VM... Hyper-V Virtual Ethernet Adapter             21 Up           78-E7-D1-65-6A-EC         1 Gbp
```

# Assigner une carte réseau virtuelle à la machine virtuelle
1️⃣ Récupérer les paramètres de la VM :
```powershell
$vm = Get-VM "Bistarine"
```
2️⃣ Assigner les valeurs de la carte réseau de la machine à la variable $networkAdapter
```powershell
$networkAdapter = Get-VMNetworkAdapter -VM $vm
```
3️⃣ Vérifier que la variable $networkAdapter à bien la bonne information
```powershell
$networkAdapter
```
Response:
```powershell
Name            IsManagementOs VMName   SwitchName MacAddress   Status IPAddresses
----            -------------- ------   ---------- ----------   ------ -----------
Network Adapter False          VM-Brice            00155D50F10D {Ok}   {169.254.143.210}
```
4️⃣ connecter la carte réseau de la VM à la switch virtuelle
```powershell
Connect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter -SwitchName "External VM Switch"
```
5️⃣ Vérifier l'assignation en regardant le nom de la colonne SwitchName
```powershell
Get-VMNetworkAdapter -VM $vm
```
Response:
```powershell
Name            IsManagementOs VMName   SwitchName         MacAddress   Status IPAddresses
----            -------------- ------   ----------         ----------   ------ -----------
Network Adapter False          VM-Brice External VM Switch 00155D50F10D {Ok}   {169.254.143.210}
```
# Assigner une adresse à la machine virtuelle
1️⃣  Se connecter à la machine virtuelle par la session PSSession et utiliser les instructions de connexion suivantes:
```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.132" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```
# Configurer les adresses DNS
1️⃣ Visualiser la configuration présente
```powershell
Get-DnsClientServerAddress
```
Response:
```powershell
nterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            11 IPv4    {}
Ethernet                            11 IPv6    {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec...
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {}
```
2️⃣ Assigner des adresses IP à la configuration DNS 1.1.1.1 étant le DNS de CloudFare, 8.8.8.8 étant le DN de Google
```powershell
Set-DNSClientServerAddress "Ethernet" -ServerAddresses ("1.1.1.1","8.8.8.8")
```
3️⃣ Visualiser la nouvelle configuration
```powershell
Get-DnsClientServerAddress
```
Reponse:
```powershell
InterfaceAlias               Interface Address ServerAddresses
                             Index     Family
--------------               --------- ------- ---------------
Ethernet                            11 IPv4    {1.1.1.1, 8.8.8.8}
Ethernet                            11 IPv6    {}
Loopback Pseudo-Interface 1          1 IPv4    {}
Loopback Pseudo-Interface 1          1 IPv6    {}
```








