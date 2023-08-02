# 🅰️  Creation de la VM

 ⚙️ **Com 1 :**
 ```bash
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Valentin.vhdx" -SizeBytes 32GB -Dynamic
 ```
Cette commande crée un nouveau disque virtuel (VHD) avec une taille de 64GB et un format dynamique. Elle prépare le disque virtuel sur lequel la machine virtuelle sera installée. 

<img src=<img src=images/IMG-1.jpg width='' height=''> 

 🖼️ **Commande 2 :**
 ```bash
 Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
   Cette commande monte une image disque à partir d'un fichier ISO de Windows 10. L'image disque ISO contient les fichiers d'installation de Windows 10.Résultat ↓
<img src=images/IMG-2.jpg  width='' height='' >
8. 💽 **Commande 3 :** `Get-PSDrive -PSProvider FileSystem`
   Cette commande affiche les lecteurs de disque disponibles sur le système. Elle permet de vérifier les lecteurs de disque actuellement montés.Résultat ↓

<img src=images/IMG-3.jpg  width='' height='' >
4. 🖥️ **Commande 4 :** `$VM = New-VM -Name VM-Valentin -Path "$ENV:USERPROFILE\Documents" -MemoryStartupBytes 8GB -VHDPath "$ENV:USERPROFILE\Documents\VM-Valentin.vhdx"`
   Cette commande crée une nouvelle machine virtuelle (VM) avec le nom "VM-Valentin". La VM est configurée avec 8GB de mémoire et le chemin du disque virtuel est spécifié.Résultat ↓

<img src=i width='' height='' >
5. 💻 **Commande 5 :** `Get-VM`
   Cette commande affiche les informations sur toutes les machines virtuelles présentes. Elle est utilisée pour vérifier si la machine virtuelle "VM-RIAD" a été créée avec succès.Résultat ↓
<img src=images/IMG-4.jpg width='' height='' >

6. 📀 **Commande 6 :** `Get-VMDVDDrive -VMName "VM-RIAD"`
   Cette commande récupère les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD". Elle permet de vérifier si un lecteur DVD virtuel est attaché à la machine virtuelle.Résultat ↓
<img src=images/IMG-5.jpg width='' height='' >
7. ➕ **Commande 7 :** `Add-VMDvdDrive -VMName "VM-Valentin" -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"`
   Cette commande ajoute un lecteur DVD à la machine virtuelle "VM-Valentin" en utilisant le chemin du fichier ISO spécifié. Elle permet d'attacher un lecteur DVD virtuel contenant l'image disque ISO de Windows 10 à la machine virtuelle.

8. 📀 **Commande 8 :** `Get-VMDVDDrive -VMName "VM-Valentin"`
   Cette commande vérifie les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD" pour confirmer qu'il a été ajouté avec succès.Résultat ↓

9. ▶️ **Commande 9 :** `Start-VM VM-Valentin`
   Cette commande démarre la machine virtuelle "VM-Valentin".

10. 🌐 **Commande 10 :** `$HostName = [System.Net.DNS]::GetHostByName($Null).HostName`
   Cette ligne de code récupère le nom d'hôte de la machine virtuelle.
   
11. 🔌 **Commande 11 :** `vmconnect $HostName VM-Valentin`
   Cette commande ouvre une connexion à distance avec la machine virtuelle "VM-Valentin" en utilisant le nom d'hôte récupéré précédemment.
   
12. 🔒 **Commande 12 :** `$cred = Get-Credential`
   Cette commande stocke les informations d'identification dans la variable $cred en utilisant la commande Get-Credential.Résultat ↓
<img src= width='' height='' >
13. 💻 **Commande 13 :** `Enter-PSSession -VMName VM-Valentin -Credential $cred`
Cette commande établit une session PowerShell à distance avec la machine virtuelle "VM-Valentin" en utilisant les informations d'identification fournies dans la variable $cred.Résultat ↓
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
[VM-Valentin]: PS C:\Users\Othman\Documents> New-NetIPAddress -InterfaceAlias "ethernet 2" -IPAddress 10.13.237.156 -AddressFamily IPv4 -DefaultGateway 10.13.237.1 -PrefixLength 24
```
Verifier l'adresse IP
<img src=images/IMG-12.jpg width='' height=''>
