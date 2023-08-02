# 🅰️  Creation de la VM

 ⚙️ **Commande 1 :**
 ```bash
 PS> New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Valentin.vhdx" -SizeBytes 32GB -Dynamic
 ```
Cette commande crée un nouveau disque virtuel (VHD) avec une taille de 64GB et un format dynamique. Elle prépare le disque virtuel sur lequel la machine virtuelle sera installée. 

<img src=<img src=images/IMG-1.jpg width='' height=''> 

 🖼️ **Commande 2 :**
 ```bash
 PS> Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
 Cette commande monte une image disque à partir d'un fichier ISO de Windows 10. L'image disque ISO contient les fichiers d'installation de Windows 10.

<img src=images/IMG-2.jpg  width='' height='' >

 💽 **Commande 3 :** 
 ```bash
 PS> Get-PSDrive -PSProvider FileSystem
```
   Cette commande affiche les lecteurs de disque disponibles sur le système. Elle permet de vérifier les lecteurs de disque actuellement montés.

<img src=images/IMG-3.jpg  width='' height='' >

🖥️ **Commande 4 :** 
```bash
PS> $VM = New-VM -Name VM-Valentin -Path "$ENV:USERPROFILE\Documents" -MemoryStartupBytes 8GB -VHDPath "$ENV:USERPROFILE\Documents\VM-Valentin.vhdx"
```
   Cette commande crée une nouvelle machine virtuelle (VM) avec le nom "VM-Valentin". La VM est configurée avec 8GB de mémoire et le chemin du disque virtuel est spécifié.
 
 💻 **Commande 5 :** 
 ```bash
 PS> Get-VM
```
Cette commande affiche les informations sur toutes les machines virtuelles présentes. Elle est utilisée pour vérifier si la machine virtuelle "VM-RIAD" a été créée avec succès.

<img src=images/IMG-4.jpg width='' height='' >

 📀 **Commande 6 :** 
 ```bash
 PS> Get-VMDVDDrive -VMName "VM-Valentin"
 ```
Cette commande récupère les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD". Elle permet de vérifier si un lecteur DVD virtuel est attaché à la machine virtuelle.

<img src=images/IMG-5.jpg width='' height='' >

 ➕ **Commande 7 :**
 ```bash
PS> Add-VMDvdDrive -VMName "VM-Valentin" -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
Cette commande ajoute un lecteur DVD à la machine virtuelle "VM-Valentin" en utilisant le chemin du fichier ISO spécifié. Elle permet d'attacher un lecteur DVD virtuel contenant l'image disque ISO de Windows 10 à la machine virtuelle.

📀 **Commande 8 :** 
```bash
PS> Get-VMDVDDrive -VMName "VM-Valentin"
```
Cette commande vérifie les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD" pour confirmer qu'il a été ajouté avec succès.Résultat ↓

▶️ **Commande 9 :**
```bash
PS> Start-VM VM-Valentin
```
 Cette commande démarre la machine virtuelle "VM-Valentin".

🌐 **Commande 10 :**
```bash
PS> $HostName = [System.Net.DNS]::GetHostByName($Null).HostName
```
 Cette ligne de code récupère le nom d'hôte de la machine virtuelle.
   
 🔌 **Commande 11 :** 
 ```bash
 PS> vmconnect $HostName VM-Valentin
 ```
 Cette commande ouvre une connexion à distance avec la machine virtuelle "VM-Valentin" en utilisant le nom d'hôte récupéré précédemment.
   
 🔒 **Commande 12 :**
```bash
PS> $cred = Get-Credential
```
Cette commande stocke les informations d'identification dans la variable $cred en utilisant la commande Get-Credential.

💻 **Commande 13 :** 
```bash
PS> Enter-PSSession -VMName VM-Valentin -Credential $cred
```
Cette commande établit une session PowerShell à distance avec la machine virtuelle "VM-Valentin" en utilisant les informations d'identification fournies dans la variable $cred.
<img src=images/IMG-6.jpg  width='' height=''>


# 🅰️  Configuration de la VM

## Configuration d'une Machine Virtuelle avec Hyper-V et PowerShell :desktop_computer: :wrench:
Suivez ces étapes pour configurer une machine virtuelle (VM) sur Hyper-V en utilisant PowerShell.
### ajouter le switch new-vswitch -name "external vm switch

### Étape 1(sur le serveur): Obtenez la VM 

Obtenez la VM que vous voulez configurer et stockez l'objet de cette VM dans une variable appelée `$vm`.

```bash
PS C:\Users\Administrator> $vm = Get-VM -Name "vm-Valentin"
```
### Étape 2(sur le serveur): Obtenez l'adaptateur réseau de la VM 

Obtenez l'adaptateur réseau de la VM que vous avez stockée dans la variable `$vm` et stockez cet adaptateur réseau dans une variable appelée `$networkAdapter`.

```bash
PS C:\Users\Administrator> $networkAdapter = Get-VMNetworkAdapter -VM $vm
```
<img src=images/IMG-10.jpg width='' height=''>

### Étape 3(sur le serveur): Connectez l'adaptateur réseau au vSwitch :electric_plug:
Connectez l'adaptateur réseau que vous avez stocké dans la variable `$networkAdapter` à un vSwitch nommé "external vm switch".

```bash
PS C:\Users\Administrator> Connect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter -SwitchName "external vm switch"
```
<img src=<img src=images/IMG-11.jpg width='' height=''> 

### Étape 4: Vérifiez l'adaptateur réseau dans la VM :

À cette étape, vous êtes connecté à votre machine virtuelle. Exécutez la commande `Get-NetAdapter` pour afficher la liste des adaptateurs réseau disponibles dans la machine virtuelle. Cela vous aidera à vérifier si l'adaptateur réseau est correctement connecté au vSwitch.

```bash
PS C:\Users\Administrator> Enter-PSSession -VMName VM-Valentin -Credential $cred
[VM-Valentin]: PS C:\Users\Othman\Documents> Get-NetAdapter
```

### Étape 5: Configurez l'adresse IP dans la VM :globe_with_meridians:

Enfin, configurez une adresse IP statique pour l'interface réseau "ethernet 2" dans la machine virtuelle. Définissez l'adresse IP comme "10.13.237.156", le masque de sous-réseau comme "255.255.255.0" (représenté par `-PrefixLength 24`), et la passerelle par défaut comme "10.13.237.1".

```bash
[VM-Valentin]: PS C:\User\VM-Valentin\Documents> New-NetIPAddress -InterfaceAlias "ethernet 2" -IPAddress 10.13.237.156 -AddressFamily IPv4 -DefaultGateway 10.13.237.1 -PrefixLength 24
```
Verifier l'adresse IP
<img src=images/IMG-12.jpg width='' height=''>


## :o2: Connexion à l'Internet 

:: Sur le serveur Windows :desktop_computer:

# Création du commutateur (Switch) virtuel externe sur le serveur

 Déterminer les adaptateurs réseaux (Cartes Ethernets)

```bash
 Get-NetAdapter
```
> Response:
```powershell
Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47      18 Up           78-E7-D1-65-6A-EC         1 Gbps
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48      11 Disconnected 78-E7-D1-65-6A-EE          0 bps
```

 Alors choisissons la carte qui a son état à `Up` (Disponible), prendre le nom de la carte et l'assigner à une variable `$net`

```bash
 $net = Get-NetAdapter -Name 'Ethernet'
```

# Créer la `Switch Virtuelle` (le commutateur virtuel) grâce à la variable `$net` récupérée ci-dessus

```bash
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
vEthernet (VM-valentin... Hyper-V Virtual Ethernet Adapter             21 Up           78-E7-D1-65-6A-EC         1 Gbps
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
```bash

Name            IsManagementOs VMName   SwitchName MacAddress   Status IPAddresses
----            -------------- ------   ---------- ----------   ------ -----------
Network Adapter False          VM-Valentin            00155D50F10D {Ok}   {169.254.143.210}

```

- [ ] connecter la carte réseau de la VM à la `switch` virtuelle

```bash
Connect-VMNetworkAdapter -VMNetworkAdapter $networkAdapter -SwitchName "External VM Switch"
```
<img src=images/IMG-11.jpg width='' height=''>
- [ ] Vérifier l'assignation en regardant le nom de la colonne `SwitchName`

```
Get-VMNetworkAdapter -VM $vm
```
> Response:
```python
Name            IsManagementOs VMName   SwitchName         MacAddress   Status IPAddresses
----            -------------- ------   ----------         ----------   ------ -----------
Network Adapter False          VM-Valentin External VM Switch 00155D50F10D {Ok}   {169.254.143.210}

```

 Sur la machine virtuelle :computer:

# Assigner une adresse à la machine virtuelle

Grâce à la création du commutateur virtuel externe, on peut maintenant donner une adresse IP à la machine virtuelle

 Se connecter à la machine virtuelle par la session `PSSession` et utiliser les instructions de connexion suivantes:

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.13.237.156" -PrefixLength 24 -DefaultGateway "10.13.237.1"
```

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
