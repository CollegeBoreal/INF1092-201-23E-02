
```powershell
DISM /Capture-Image `
     /ImageFile:"C:\Users\Brice\Documents\export\VM-Brice.wim" `
     /CaptureDir:"C:\Users\Brice\Documents\VM-Brice" `
     /Capture-Image:"C:\Users\Brice\Documents\VM-Brice.vhdx" `
     /Name:"VM-Brice" `
     /Description:"Image de la VM de Brice" `
     /Compress:Maximum
```
