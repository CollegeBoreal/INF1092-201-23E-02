
- [ ] Installer [Choco](https://chocolatey.org/)

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; 
     [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
     iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

- [ ] Installer un application de votre choix

```powershell
choco install musescore -y
```

<img src=../../images/hyper-v_musescore.png width=50% height=50% > </img>
