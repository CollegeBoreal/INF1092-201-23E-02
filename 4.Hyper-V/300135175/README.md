# 📋 **Guide de création de machine virtuelle avec Hyper-V** 💡💻
par Riad 👨‍💻

note : le numerotage des commandes n'est pas exacte parceque il ya des commande pour just afficher et dautre pour exucuter

1. ⚙️ **Commande 1 :** `New-VHD -Path "$ENV:USERPROFILE\Documents\VM-RIAD.vhdx" -SizeBytes 64GB -Dynamic`
   Cette commande crée un nouveau disque virtuel (VHD) avec une taille de 64GB et un format dynamique. Elle prépare le disque virtuel sur lequel la machine virtuelle sera installée. Résultat ↓
<img src=/images/1111111.jpg width='' height='' >

2. 🖼️ **Commande 2 :** `Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"`
   Cette commande monte une image disque à partir d'un fichier ISO de Windows 10. L'image disque ISO contient les fichiers d'installation de Windows 10.Résultat ↓

<img src= width='' height='' >
3. 💽 **Commande 3 :** `Get-PSDrive -PSProvider FileSystem`
   Cette commande affiche les lecteurs de disque disponibles sur le système. Elle permet de vérifier les lecteurs de disque actuellement montés.Résultat ↓

<img src= width='' height='' >
4. 🖥️ **Commande 4 :** `$VM = New-VM -Name VM-RIAD -Path "$ENV:USERPROFILE\Documents" -MemoryStartupBytes 8GB -VHDPath "$ENV:USERPROFILE\Documents\VM-RIAD.vhdx"`
   Cette commande crée une nouvelle machine virtuelle (VM) avec le nom "VM-RIAD". La VM est configurée avec 8GB de mémoire et le chemin du disque virtuel est spécifié.Résultat ↓

<img src= width='' height='' >
5. 💻 **Commande 5 :** `Get-VM`
   Cette commande affiche les informations sur toutes les machines virtuelles présentes. Elle est utilisée pour vérifier si la machine virtuelle "VM-RIAD" a été créée avec succès.Résultat ↓
<img src= width='' height='' >

6. 📀 **Commande 6 :** `Get-VMDVDDrive -VMName "VM-RIAD"`
   Cette commande récupère les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD". Elle permet de vérifier si un lecteur DVD virtuel est attaché à la machine virtuelle.Résultat ↓
<img src= width='' height='' >
7. ➕ **Commande 7 :** `Add-VMDvdDrive -VMName "VM-RIAD" -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"`
   Cette commande ajoute un lecteur DVD à la machine virtuelle "VM-RIAD" en utilisant le chemin du fichier ISO spécifié. Elle permet d'attacher un lecteur DVD virtuel contenant l'image disque ISO de Windows 10 à la machine virtuelle.Résultat ↓
<img src=images/1111111.jpg width='' height='' >
8. 📀 **Commande 8 :** `Get-VMDVDDrive -VMName "VM-RIAD"`
   Cette commande vérifie les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD" pour confirmer qu'il a été ajouté avec succès.Résultat ↓
<img src= width='' height='' >
9. ▶️ **Commande 9 :** `Start-VM VM-RIAD`
   Cette commande démarre la machine virtuelle "VM-RIAD".Résultat ↓
<img src= width='' height='' >
10. 🌐 **Commande 10 :** `$HostName = [System.Net.DNS]::GetHostByName($Null).HostName`
   Cette ligne de code récupère le nom d'hôte de la machine virtuelle.Résultat ↓
<img src= width='' height='' >
11. 🔌 **Commande 11 :** `vmconnect $HostName VM-RIAD`
   Cette commande ouvre une connexion à distance avec la machine virtuelle "VM-RIAD" en utilisant le nom d'hôte récupéré précédemment.Résultat ↓
<img src= width='' height='' >
12. 🔒 **Commande 12 :** `$cred = Get-Credential`
   Cette commande stocke les informations d'identification dans la variable $cred en utilisant la commande Get-Credential.Résultat ↓
<img src= width='' height='' >
13. 💻 **Commande 13 :** `Enter-PSSession -VMName VM-RIAD -Credential $cred`
Cette commande établit une session PowerShell à distance avec la machine virtuelle "VM-RIAD" en utilisant les informations d'identification fournies dans la variable $cred.Résultat ↓
<img src= width='' height='' >
