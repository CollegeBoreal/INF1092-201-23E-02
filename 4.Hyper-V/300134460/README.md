# hyper-v
# 🅰️ creation de la machine virtuelle
''' powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-abdramane.vhdx" -SizeBytes 32GB -Dynamic 
 > resultat
''' python
ComputerName            : WIN-IS274F34TJO
Path                    : C:\Users\Administrator\Documents\VM-abdramane.vhdx
VhdFormat               : VHDX
VhdType                 : Dynamic
FileSize                : 4194304
Size                    : 34359738368
MinimumSize             :
LogicalSectorSize       : 512
PhysicalSectorSize      : 4096
BlockSize               : 33554432
ParentPath              :
DiskIdentifier          : 567F457B-01D9-4A56-869D-201206544876
FragmentationPercentage : 0
Alignment               : 1
Attached                : False
DiskNumber              :
IsPMEMCompatible        : False
AddressAbstractionType  : None
Number                  :
'''
-[ ] monter l'image disque en DVD
'''powershell
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
> resultat
''' python
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
'''powershell
Get-PSDrive -PSProvider FileSystem
> resultat
''' python
Name           Used (GB)     Free (GB) Provider      Root                                           CurrentLocation
----           ---------     --------- --------      ----                                           ---------------
C                  39.00        233.79 FileSystem    C:\                                        Users\Administrator
D                   5.72          0.00 FileSystem    D:\
-[ ] creation de la machine virtuelle
''' powershell
$VM = New-VM -Name VM-abdramane -Path "$ENV:USERPROFILE\Documents" `
                        -MemoryStartupBytes 4GB `
                        -VHDPath "$ENV:USERPROFILE\Documents\VM-abdramane.vhdx"
''' powershell
Get-VM
> resultat
''' python
VM-abdramane Off     0           0                 00:00:00           Operating normally 10.0
VM-Maiga     Running 0           4096              2.11:51:59.0280000 Operating normally 10.0
-[ ] ajouter le disque de demarrage
''' powershell
Get-VMDVDDrive -VMName $VM.VMName
> resultat
''' python
VMName       ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------       -------------- ---------------- ------------------ ------------ ----
VM-abdramane IDE            1                0                  None
''' powershell
Add-VMDvdDrive -VMName $VM.VMName -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
''' powershell
Get-VMDVDDrive -VMName $VM.VMName
> resultat
'''python
VMName       ControllerType ControllerNumber ControllerLocation DvdMediaType Path
------       -------------- ---------------- ------------------ ------------ ----
VM-abdramane IDE            0                1                  ISO          C:\Users\Administrator\Documents\Win10_22H2...
VM-abdramane IDE            1                0                  None
-[ ] demarrer la machine virtuelle
''' powershell
Start-VM VM-abdramane
🅱️ Installation de la VM
-[ ] installer la machine virtuelle avec vmconnect
''' powershell
$HostName = [System.Net.DNS]::GetHostByName($Null).HostName
vmconnect $HostName VM-abdramane
🆎 Connexion a la VM
-[ ] recuperer les informations
''' powershell
Get-VM
> resultat
''' python
Name         State   CPUUsage(%) MemoryAssigned(M) Uptime             Status             Version
----         -----   ----------- ----------------- ------             ------             -------
VM-abdramane Running 6           4096              00:23:40.3880000   Operating normally 10.0
VM-Maiga     Running 0           4096              2.13:03:31.9720000 Operating normally 10.0
-[ ] collecter les informations d'identification (nom d'utilisateur et mot de passe) d'un utilisateur
''' powershell
$cred = Get-Credential
> resultat
''' python
cmdlet Get-Credential at command pipeline position 1
Supply values for the following parameters:
Credential
-[ ] etablir une session interactive a distance avec la VM
''' powershell
Enter-PSSession -VMName VM-Brice -Credential $cred
> resultat
''' python
Enter-PSSession : The credential is invalid.
At line:1 char:1
+ Enter-PSSession -VMName VM-abdramane -Credential $cred
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (:) [Enter-PSSession], PSDirectException
    + FullyQualifiedErrorId : CreateRemoteRunspaceForVMFailed,Microsoft.PowerShell.Commands.EnterPSSessionCommand
🅾️ Connexion a l'internet
🎈Creation du commutateur (switch) virtuel externe
''' powershell
 Get-NetAdapter
 > resultat
''' python
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#51       9 Disconnected 3C-4A-92-F3-3F-70          0 bps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#49       7 Up           3C-4A-92-F3-3F-74         1 Gbps
Ethernet 4                QLogic BCM5709C Gigabit Ethernet ...#50       6 Disconnected 3C-4A-92-F3-3F-76          0 bps
Ethernet 3                QLogic BCM5709C Gigabit Ethernet ...#52       2 Disconnected 3C-4A-92-F3-3F-72          0 bps
-[ ] choisir la carte qui a son etat a up
''' powershell
 $net = Get-NetAdapter -Name 'Ethernet 2'
 -[ ] creer le switch virtuelle
 ''' powershell
 New-VMSwitch -Name "External VM Switch" -AllowManagementOS $True -NetAdapterName $net.Name
 > resultat
''' python
External VM Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client) #2
-[ ] verification du switch virtuelle
''' powershell
get-netadapter
> resultat
''' python
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#51       9 Disconnected 3C-4A-92-F3-3F-70          0 bps
vEthernet (External VM... Hyper-V Virtual Ethernet Adapter             12 Up           3C-4A-92-F3-3F-74         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#49       7 Up           3C-4A-92-F3-3F-74         1 Gbps
Ethernet 4                QLogic BCM5709C Gigabit Ethernet ...#50       6 Disconnected 3C-4A-92-F3-3F-76          0 bps
Ethernet 3                QLogic BCM5709C Gigabit Ethernet ...#52       2 Disconnected 3C-4A-92-F3-3F-72          0 bps
