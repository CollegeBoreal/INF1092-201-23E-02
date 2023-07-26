# Capturer le disque utilisé par une machine virtuelle (VM) en plus de l'image WIM


## :a: capturer le disque utilisé par une VM :

 - [ ] Lancer la commande `diskpart`

```powershell
diskpart
```
> Response:
```
Microsoft DiskPart version 10.0.20348.1

Copyright (C) Microsoft Corporation.
On computer: WIN-77KAV1BUA4O

DISKPART>
```

```
DISKPART> select vdisk file="C:\Users\Brice\Documents\VM-Brice.vhdx"
DISKPART> attach vdisk
DISKPART> exit
```

```powershell
DISM /Capture-Image `
     /ImageFile:"$env:USERPROFILE\Documents\export\VM-Brice.wim" `
     /CaptureDir:"F:" `
     /Name:"VM-Brice" `
     /Description:"Image de la VM de Brice" `
     /Compress:Maximum
```

```powershell
Get-Item $env:USERPROFILE\Documents\export\VM-Brice.wim
```
> Response:
```powershell
    Directory: C:\Users\Brice\Documents\export


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         7/18/2023  11:32 AM     7593479385 VM-Brice.wim
```
