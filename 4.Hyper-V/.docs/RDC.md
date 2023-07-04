# Remote Desktop Connection

Pour partager un disque en utilisant l'application Remote Desktop Connection, vous pouvez suivre ces étapes :

1. Lancez l'application Remote Desktop Connection : Vous pouvez trouver l'application Remote Desktop Connection en recherchant "Remote Desktop Connection" dans le menu Démarrer ou en exécutant la commande "mstsc" dans la boîte de dialogue Exécuter.

2. Connectez-vous à l'ordinateur distant : Entrez l'adresse IP ou le nom d'hôte de l'ordinateur distant auquel vous souhaitez vous connecter dans le champ "Ordinateur" de l'application Remote Desktop Connection. Cliquez ensuite sur "Se connecter".

3. Ouvrez les options de connexion : Dans la fenêtre de connexion à distance, cliquez sur le bouton "Options" pour afficher les options de connexion supplémentaires.

4. Accédez à l'onglet "Ressources locales" : Dans les options de connexion, accédez à l'onglet "Ressources locales".

5. Partagez un disque local : Sous la section "Périphériques et ressources locaux", cliquez sur le bouton "Plus" pour afficher les ressources disponibles à partager. Cochez la case en regard du disque local que vous souhaitez partager avec l'ordinateur distant.

<img src=../300098957/images/rdp-export-folder.png width='50%' height='50%' > </img>

6. Connectez-vous à l'ordinateur distant : Cliquez sur le bouton "Se connecter" pour établir la connexion à l'ordinateur distant.

Une fois connecté à l'ordinateur distant, le disque partagé apparaîtra dans l'Explorateur de fichiers de l'ordinateur distant, généralement sous la forme d'un lecteur réseau avec une lettre de lecteur assignée.

Veuillez noter que la possibilité de partager des disques locaux avec l'ordinateur distant dépend de la configuration et des politiques de l'ordinateur distant. Assurez-vous d'avoir les autorisations nécessaires pour partager le disque et que les stratégies de sécurité de l'ordinateur distant le permettent.

## :a: Connection Manuelle sur le serveur (Équivalent `net use`)

- [ ] Sans connexion `Samba`

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Response :
```python

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  58.12        214.67 FileSystem    C:\                                            Users\Administrator
D                                      FileSystem    D:\
F                                      FileSystem    F:\
```

- [ ] Avec connexion `Samba`

Note: le lien `\\TSCLIENT\Downloads` 

```powershell
Get-PSDrive -PSProvider FileSystem 
```
> Response :
```python

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  58.13        214.66 FileSystem    C:\                                            Users\Administrator
D                                      FileSystem    D:\
E              179318.16      59082.86 FileSystem    \\TSCLIENT\Downloads
F                                      FileSystem    F:\
```

## :b: Faire la copie à distance

- [ ] Se connecter au serveur avec RDC et faire la copie du fichier désiré (example)

```powershell
Copy-Item -Path "E:\Win10_22H2_English_x64v1.iso" -Destination "$ENV:USERPROFILE\Documents"
```

## :x: Forcer la connexion à un autre disque (si non établit)

```powershell
New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\TSClIENT\Downloads" -Persist
```
> Response:
```
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
Z              177865.97      60533.16 FileSystem    \\TSClIENT\Downloads
```

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Response:
```
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  58.13        214.66 FileSystem    C:\                                            Users\Administrator
D                                      FileSystem    D:\
F                                      FileSystem    F:\
Z              179319.13      59081.58 FileSystem    \\TSClIENT\Downloads
```


# References 

- [Nano Server](https://www.microsoft.com/en-us/download/details.aspx?id=54065)
- [Managing Hyper-V VMs using PowerShell Direct](https://www.red-gate.com/simple-talk/sysadmin/powershell/managing-hyper-v-vms-using-powershell-direct/)
- [What Is Windows Nano Server, and What Are Its Applications?](https://www.parallels.com/blogs/ras/windows-nano-server/)
