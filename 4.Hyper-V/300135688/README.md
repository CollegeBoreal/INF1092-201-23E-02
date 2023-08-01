# creation du disque virtuel VM-Massil
```POWERSHELL
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Massil.vhdx" -SizeBytes 32GB -Dynamic 
```
resultats :
```PYTHON
ComputerName            : WIN-F8M1G3SNO23
Path                    : C:\Users\Administrateur\Documents\VM-Massil.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 20EFEC9E-35E1-4568-8A10-E127841FF15B
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
```
# montage du disque en DVD :
```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Resultats: 
```python
Attached          : True
BlockSize         : 0
DevicePath        : \\.\CDROM1
FileSize          : 6140975104
ImagePath         : C:\Users\Administrateur\Documents\Win10_22H2_English_x64v1.iso
LogicalSectorSize : 2048
Number            : 1
Size              : 6140975104
StorageType       : 1
PSComputerName    :
```
```POWERSHELL
Get-PSDrive -PSProvider FileSystem
```
RESULTATS :
```PYTHON
Name           Used (GB)     Free (GB) Provider      Root                                                                                                                       CurrentLocation
----           ---------     --------- --------      ----                                                                                                                       ---------------
C                  23,97        248,78 FileSystem    C:\                                                                                                                   Users\Administrateur
D                   5,72          0,00 FileSystem    D:\
E                                      FileSystem    E:\
```

# creation de la machine virtuelle :
```POWERSHELL
$VM = New-VM -Name VM-Massil -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-Massil.vhdx"
Get-VM
```
RESULTAT :
```PYTHON
Name      State CPUUsage(%) MemoryAssigned(M) Uptime   Status                Version
----      ----- ----------- ----------------- ------   ------                -------
VM-Massil Off   0           0                 00:00:00 Fonctionnement normal 10.0
```
# Ajout du disque de demarrage :
```POWERSHELL
Get-VMDVDDrive -VMName VM-Massil
```
resultat :
```PYTHON
VMName    ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------    -------------- ---------------- ------------------ ------------ ----
VM-Massil IDE            1                0                  None
```
```POWERSHELL
Add-VMDvdDrive -VMName VM-Massil -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
Get-VMDVDDrive -VMName VM-Massil
```
resultats :
```python
VMName    ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------    -------------- ---------------- ------------------ ------------ ----
VM-Massil IDE            0                1                  ISO          C:\Users\Administrateur\Documents\Win10_22H2_English_x64v1.iso
VM-Massil IDE            1                0                  None
```
# demarrage de la machine virtuelle 
```POWERSHELL
Start-VM VM-Massil
```
#installation de la VM avec vmconnect
```POWERSHELL
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-Massil
```
#creation du switch
```powershell
 Get-NetAdapter
```
resultat:
```python

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      11 Disconnected 78-E7-D1-65-6A-EE          0 bps
```
 ```powershell
 $net = Get-NetAdapter -Name 'Ethernet'
New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName "Ethernet"
 ```
resultat
 ```python
Name               SwitchType NetAdapterInterfaceDescription
----               ---------- ------------------------------
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```
#Établir une session interactive à distance avec la VM
```powershell
Enter-PSSession -VMName VM-Massil -Credential $cred
```
resultat 
```python
[VM-Massil] : PS C:\Users\Massil\Documents>
```

##exit
#Vérifier que la Switch Virtuelle (le commutateur virtuel) à bien été crée
```powershell
get-netadapter
```
#verification par la commande :
```PowerShell
$vm
```
#resultat:
```Python

Name      State   CPUUsage(%) MemoryAssigned(M) Uptime              Status                Version
----      -----   ----------- ----------------- ------              ------                -------
VM-Massil Running 0           4096              16.10:55:57.9870000 Fonctionnement normal 10.0
```
#📍 Assigner une carte réseau virtuelle à la machine virtuelle
```PowerShell
$vm = Get-VM "VM-Massil"
```
#confirmationque ca marche  par la commande :
```PowerShell
$vm
```
#resultat :
```Python
Name      State   CPUUsage(%) MemoryAssigned(M) Uptime              Status                Version
----      -----   ----------- ----------------- ------              ------                -------
VM-Massil Running 0           4096              16.10:55:57.9870000 Fonctionnement normal 10.0
```
#Assigner les valeurs de la carte réseau de la machine à la variable $networkAdapter
```PowerShell
$networkAdapter = Get-VMNetworkAdapter -VM $vm
```
#Vérifier que la variable $networkAdapter à bien la bonne information:
```PowerShell
$networkAdapter
```
#resultat :
```Python
Name         IsManagementOs VMName    SwitchName MacAddress   Status IPAddresses
----         -------------- ------    ---------- ----------   ------ -----------
Carte réseau False          VM-Massil            00155DED1E01 {Ok}   {169.254.121.20, 10.13.237.130, fe80::6be4:2bf6:8cf4:8601}
```
#ici, ov va cnnecter la carte réseau de la VM à la switch virtuelle :
```PowerShell
 Connect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter -SwitchName "External VM Switch"
```
#Vérifier l'assignation en regardant le nom de la colonne SwitchName :
```PowerShell
Get-VMNetworkAdapter -VM $vm
```
#resultat :
```Python
Name         IsManagementOs VMName    SwitchName         MacAddress   Status IPAddresses
----         -------------- ------    ----------         ----------   ------ -----------
Carte réseau False          VM-Massil External VM Switch 00155DED1E01 {Ok}   {10.13.237.130, fe80::6be4:2bf6:8cf4:8601}
```
#a present on va rentrer dans la machine virtuelle créer :
```PowerShell
 Enter-PSSession -VMName VM-Massil -Credential $cred
```
#par la commande 
```PowerShell
 Get-NetAdapter
```
#résultat :
```Python

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Microsoft Hyper-V Network Adapter             8 Up           00-15-5D-ED-1E-01         1 Gbps
```
#On va pinger google pour tester :
```PowerShell
ping google.com
```
#résultat :
```Python

Pinging google.com [142.251.32.78] with 32 bytes of data:
Reply from 142.251.32.78: bytes=32 time=15ms TTL=109
Reply from 142.251.32.78: bytes=32 time=15ms TTL=109
Reply from 142.251.32.78: bytes=32 time=23ms TTL=109
Reply from 142.251.32.78: bytes=32 time=15ms TTL=109

Ping statistics for 142.251.32.78:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 15ms, Maximum = 23ms, Average = 17ms
```
#attribution de l'addresse ip a la VM-Massil
```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.130" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```
#ceci va afficher un msg d'erreur :
```powershell
New-NetIPAddress : Instance MSFT_NetIPAddress already exists
    + CategoryInfo          : InvalidArgument: (MSFT_NetIPAddress:ROOT/StandardCimv2/MSFT_NetIPAddress) [New-NetIPAddress], CimException
    + FullyQualifiedErrorId : Windows System Error 87,New-NetIPAddress
```
#disant que l'adresse ip que j'ai donné est deja existante, car je l'ai deja crée graphiquement au paravant, donc a présent je vais la 
supprimer graphiquement aussi , en image ci dessous avant avoir supprimer toute ces données entrer :

```powershell
WhatsApp Image 2023-08-01 at 18.38.38.jpg
```
<img src="images/WhatsApp Image 2023-08-01 at 18.38.38.jpg" width="600" height="500" > </img>



