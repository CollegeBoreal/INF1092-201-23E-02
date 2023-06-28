# Remote Desktop Connection

Pour partager un disque en utilisant l'application Remote Desktop Connection, vous pouvez suivre ces étapes :

1. Lancez l'application Remote Desktop Connection : Vous pouvez trouver l'application Remote Desktop Connection en recherchant "Remote Desktop Connection" dans le menu Démarrer ou en exécutant la commande "mstsc" dans la boîte de dialogue Exécuter.

2. Connectez-vous à l'ordinateur distant : Entrez l'adresse IP ou le nom d'hôte de l'ordinateur distant auquel vous souhaitez vous connecter dans le champ "Ordinateur" de l'application Remote Desktop Connection. Cliquez ensuite sur "Se connecter".

3. Ouvrez les options de connexion : Dans la fenêtre de connexion à distance, cliquez sur le bouton "Options" pour afficher les options de connexion supplémentaires.

4. Accédez à l'onglet "Ressources locales" : Dans les options de connexion, accédez à l'onglet "Ressources locales".

5. Partagez un disque local : Sous la section "Périphériques et ressources locaux", cliquez sur le bouton "Plus" pour afficher les ressources disponibles à partager. Cochez la case en regard du disque local que vous souhaitez partager avec l'ordinateur distant.

6. Connectez-vous à l'ordinateur distant : Cliquez sur le bouton "Se connecter" pour établir la connexion à l'ordinateur distant.

Une fois connecté à l'ordinateur distant, le disque partagé apparaîtra dans l'Explorateur de fichiers de l'ordinateur distant, généralement sous la forme d'un lecteur réseau avec une lettre de lecteur assignée.

Veuillez noter que la possibilité de partager des disques locaux avec l'ordinateur distant dépend de la configuration et des politiques de l'ordinateur distant. Assurez-vous d'avoir les autorisations nécessaires pour partager le disque et que les stratégies de sécurité de l'ordinateur distant le permettent.

## Remote Desktop Connection

<img src=../300098957/images/rdp-export-folder.png width='50%' height='50%' > </img>

```powershell
net use
```
> Response :
```python
New connections will be remembered.


Status       Local     Remote                    Network

-------------------------------------------------------------------------------
                       \\TSCLIENT\Downloads      Microsoft Terminal Services
The command completed successfully.
```

```powershell
New-PSDrive -Name "E" -PSProvider "FileSystem" -Root "\\TSClIENT\Downloads" -Persist
```
> Response:
```
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
E              177865.97      60533.16 FileSystem    \\TSClIENT\Downloads
```

```powershell
Get-PSDrive -PSProvider FileSystem
```
> Response:
```
Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
C                  21.18        251.61 FileSystem    C:\                                  Users\Administrator\Documents
D                                      FileSystem    D:\
E              177874.43      60526.59 FileSystem    \\TSClIENT\Downloads
```


```powershell
Copy-Item -Path "E:\en_machine_learning_server_9.4.7_for_windows_x64_e46c29f6.iso" -Destination "$ENV:USERPROFILE\Documents"
```

