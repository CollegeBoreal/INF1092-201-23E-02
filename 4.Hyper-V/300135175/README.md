# 📋 **Guide de création de machine virtuelle avec Hyper-V** 💡💻
par Riad 👨‍💻

1. 📦 **New-VHD** - Cette commande crée un nouveau disque virtuel (VHD) avec une taille de 64GB et un format dynamique.
2. 💿 **Mount-DiskImage** - Cette commande monte une image disque à partir d'un fichier ISO de Windows 10.
3. 💾 **Get-PSDrive** - Cette commande affiche les lecteurs de disque disponibles sur le système.
4. 💻 **$VM = New-VM** - Cette commande crée une nouvelle machine virtuelle (VM) avec le nom "VM-RIAD", une configuration de mémoire de 8GB et le chemin du disque VHD spécifié.
5. 🖥️ **Get-VM** - Cette commande affiche les informations sur toutes les machines virtuelles présentes.
6. 💿 **Get-VMDVDDrive** - Cette commande récupère les informations sur le lecteur DVD d'une machine virtuelle spécifique (dans ce cas "VM-RIAD").
7. ➕ **Add-VMDvdDrive** - Cette commande ajoute un lecteur DVD à la machine virtuelle "VM-RIAD" en utilisant le chemin du fichier ISO spécifié.
8. 💿 **Get-VMDVDDrive** - Cette commande vérifie les informations sur le lecteur DVD de la machine virtuelle "VM-RIAD" pour confirmer qu'il a été ajouté avec succès.
9. ▶️ **Start-VM** - Cette commande démarre la machine virtuelle "VM-RIAD".
10. 🌐 **$HostName = [System.Net.DNS]::GetHostByName($Null).HostName** - Cette ligne de code récupère le nom d'hôte de la machine virtuelle.
11. 🔗 **vmconnect $HostName VM-RIAD** - Cette commande ouvre une connexion à distance avec la machine virtuelle "VM-RIAD" en utilisant le nom d'hôte récupéré précédemment.
12. 🔐 **$cred = Get-Credential** - Cette commande stocke les informations d'identification dans la variable $cred en utilisant la commande Get-Credential.
13. 💻 **Enter-PSSession -VMName VM-RIAD -Credential $cred** - Cette commande établit une session PowerShell à distance avec la machine virtuelle "VM-RIAD" en utilisant les informations d'identification fournies dans la variable $cred.


