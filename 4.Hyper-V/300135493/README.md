# Hyper-v
```powershell
 $VM = New-VM -Name VM-Lassine -Path "$ENV:USERPROFILE\Documents" `
                         -MemoryStartupBytes 4GB `
                         -VHDPath "$ENV:USERPROFILE\Documents\VM-Lassine.vhdx"
```
