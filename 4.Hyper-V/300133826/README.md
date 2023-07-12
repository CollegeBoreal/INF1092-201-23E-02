# CREATION DE LA MACHINE VIRTUELLE VM-OTHMAN

1️⃣ Installer le role Hyper V sur Windows Server

```POWERSHELL
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```


<img src="images/WhatsApp Image 2023-07-12 at 3.19.2811 PM.jpeg" width="253" height="337" > </img>



:two: Créer le disque virtuel pour la machine virtuelle

```POWERSHELL
New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Brice.vhdx" -SizeBytes 32GB -Dynamic
```

<img src="images/2WhatsApp Image 2023-07-12 at 3.19.29 PM.jpeg" width="253" height="337" > </img>

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

:three: Monter l'image disque en DVD :

```POWERSHELL
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```

<img src="images/WhatsApp Image 2023-07-12 at 3.19.30 PM (1).jpeg" width="253" height="337" > </img>








