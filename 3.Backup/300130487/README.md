#  🥇SAUVEGARDE
Capturer le disque utilisé par une machine virtuelle(VM) en plus de l'image WIM

🔤CAPTURER LE DISQUE UTLISÉ PAR UNE VM:
Lancer la commande DISKPART
```POWERSHELL
Diskpart
```
RESULTAT
```PYTHON
Microsoft DiskPart version 10.0.17763.1

Copyright (C) Microsoft Corporation.
On computer: WIN-2U28H0SD9S1

DISKPART>
```
Dans l'utilitaire DISKPART selectionner et attacher le disque virtuel à sauvegarder
```POWERSHELL
DISKPART> select vdisk file="C:\Users\Administrator\Documents\VM-Archange.Vhdx"

DISKPART> attach vdisk
```

