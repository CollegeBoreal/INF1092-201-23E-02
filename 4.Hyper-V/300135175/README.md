
</head>
<body>
    <h1>C'est Riad &#9728;&#129418;</h1>
</body>
</html>


1. New-VHD -Path "$ENV:USERPROFILE\Documents\VM-RIAD.vhdx" -SizeBytes 64GB -Dynamic :
   Cette commande crée un nouveau disque virtuel (VHD) avec un chemin spécifié, dans ce cas "$ENV:USERPROFILE\Documents\VM-RIAD.vhdx". Le disque virtuel sera d'une taille de 64 Go et sera configuré avec une allocation dynamique, ce qui signifie qu'il ne prendra que l'espace réellement utilisé par les fichiers stockés.

2. Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso" :
   Cette commande monte une image disque ISO spécifiée, dans ce cas "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso". Cela permet d'accéder au contenu de l'image ISO comme s'il était sur un lecteur de CD/DVD physique.

3. Get-PSDrive -PSProvider FileSystem :
   Cette commande récupère tous les lecteurs de l'ordinateur actuel qui utilisent le fournisseur FileSystem. Cela inclut les lecteurs de disque dur, les lecteurs réseau et d'autres types de lecteurs.

4. $VM = New-VM -Name VM-RIAD -Path "$ENV:USERPROFILE\Documents" -MemoryStartupBytes 8GB -VHDPath "$ENV:USERPROFILE\Documents\VM-RIAD.vhdx" :
   Cette commande crée une nouvelle machine virtuelle (VM) avec le nom "VM-RIAD". La VM sera stockée dans le répertoire spécifié, dans ce cas "$ENV:USERPROFILE\Documents". Elle aura 8 Go de mémoire de démarrage et utilisera le disque virtuel spécifié.

5. Get-VM :
   Cette commande récupère des informations sur toutes les machines virtuelles présentes sur l'hôte de virtualisation. Elle peut être utilisée pour obtenir une liste des VM existantes et obtenir des détails sur chaque VM.

6. Get-VMDVDDrive -VMName "VM-RIAD" :
   Cette commande récupère les informations sur le lecteur de CD/DVD d'une machine virtuelle spécifiée, dans ce cas "VM-RIAD". Cela inclut des détails tels que le nom du lecteur, le type de lecteur, etc.

7. Add-VMDvdDrive -VMName "VM-RIAD" -Path "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso" :
   Cette commande ajoute un lecteur de CD/DVD à une machine virtuelle spécifiée, dans ce cas "VM-RIAD". Le lecteur sera configuré pour utiliser l'image ISO spécifiée.

8. Get-VMDVDDrive -VMName "VM-RIAD" :
   Cette commande récupère à nouveau les informations sur le lecteur de CD/DVD de la machine virtuelle "VM-RIAD". Cela permet de vérifier si le lecteur a été ajouté correctement.

9. Start-VM VM-RIAD :
   Cette commande démarre la machine virtuelle "VM-RIAD". La VM commencera à s'exécuter à partir de l'état actuel dans lequel elle se trouvait lorsqu'elle a été arrêtée ou mise en veille.

10. $HostName = [System.Net.DNS]::GetHostByName($Null).HostName :
    Cette commande récupère le nom d'hôte de l'ordinateur local et l'assigne à la variable $HostName.

11. vmconnect $HostName VM-RIAD :
    Cette commande ouvre la connexion à distance à la machine virtuelle "VM-RIAD" en utilisant le nom d'hôte récupéré précédemment. Cela permet d'accéder à la VM via une connexion à distance.

12. $cred = Get-Credential :
    Cette commande ouvre une boîte de dialogue pour récupérer les informations d'identification de l'utilisateur. Les informations d'identification entrées seront assignées à la variable $cred pour une utilisation ultérieure.

13. Enter-PSSession -VMName VM-RIAD -Credential $cred :
    Cette commande ouvre une session PSSession pour interagir avec la machine virtuelle "VM-RIAD" en utilisant les informations d'identification fournies dans la variable $cred.
