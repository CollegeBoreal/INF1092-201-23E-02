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
     /ImageFile:"C:\Users\Brice\Documents\export\VM-Brice.wim" `
     /CaptureDir:"F:" `
     /Name:"VM-Brice" `
     /Description:"Image de la VM de Brice" `
     /Compress:Maximum
```

Start 1:46pm
