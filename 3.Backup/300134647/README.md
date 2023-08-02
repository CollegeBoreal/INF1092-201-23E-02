# Sauvegarde

Capturer le disque utilisé par une machine virtuelle (VM) en plus de l'image WIM


##  capturer le disque utilisé par notre VM :

 - [ ] Lancer la commande `DISKPART`

```powershell
diskpart
```
> Response:
```
Microsoft DiskPart version 10.0.20348.1

Copyright (C) Microsoft Corporation.
On computer: WIN-KDJ5GSJ8GGAD

DISKPART>
```

- [ ] Dans l'utilitaire `DISKPART` selectionner et attacher le disque virtuel à sauvegarder

```
DISKPART> select vdisk file="C:\Users\Brice\Documents\VM-Valentin.vhdx"
DISKPART> attach vdisk
DISKPART> exit
```

## Créons une image windows

 Utilisons  la commande `DSIM` pour capturer l'image Windows 

```powershell
DISM /Capture-Image `
     /ImageFile:"$env:USERPROFILE\Documents\export\VM-Brice.wim" `
     /CaptureDir:"F:" `
     /Name:"VM-Brice" `
     /Description:"Image de la VM de Brice" `
     /Compress:Maximum
```
