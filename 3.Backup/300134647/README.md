#  Sauvegarde

Capturerons le disque utilisé par une machine virtuelle (VM) en plus de l'image WIM

##  capture du disque utilisé par une VM :
 Lancons la commande `DISKPART`

```powershell
diskpart
```
 Response:
```
Microsoft DiskPart version 10.0.20348.1

Copyright (C) Microsoft Corporation.
On computer: WIN-KDJ5GSJ8GAD

```
<img  src=images/IMG-17.jpg width='' height=''> 

 Dans l'utilitaire `DISKPART` selectionner et attacher le disque virtuel à sauvegarder

```
DISKPART> select vdisk file="C:\Users\Wend\Documents\VM-Valentin.vhdx"
DISKPART> attach vdisk
DISKPART> exit
```
<img src=images/IMG-18.jpg width='' height=''> 

## Créons une image windows

 Utilisons la commande `DSIM` pour capturer l'image Windows

```powershell
DISM /Capture-Image `
     /ImageFile:"$env:USERPROFILE\Documents\export\VM-Valentin.wim" `
     /CaptureDir:"F:" `
     /Name:"VM-Valentin" `
     /Description:"Image de la VM de Valentin" `
     /Compress:Maximum
```
<img  src=images/IMG-19.jpg width='' height=''> 
