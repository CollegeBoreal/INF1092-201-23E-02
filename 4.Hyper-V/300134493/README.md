# Hyper-V

# 🅰️  Creation de la VM
```powershell
 New-VHD -Path "$ENV:USERPROFILE\Documents\VM-Fousseyni.vhdx" -SizeBytes 32GB -Dynamic
```
> Resultat :
```python
# Monter l'image disque en DVD

```powershell
Mount-DiskImage -ImagePath "$ENV:USERPROFILE\Documents\Win10_22H2_English_x64v1.iso"
```
> Resultat :
```python

