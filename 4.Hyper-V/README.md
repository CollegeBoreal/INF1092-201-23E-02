# :four: Hyper V 

:tada: [Participation](.scripts/Participation.md)

## Qu'est-ce que Hyper V

<img src=images/Hyper-V.png width='' height='' > </img>

## :one: Installer le role [Hyper V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/install-the-hyper-v-role-on-windows-server) sur Windows Server 

À l'aide du Module `ServerManager`, utiliser ses commandes [`WindowsFeature`](.docs/WF.md) pour installer le Service `Hyper-V`

```powershell
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```


### :pushpin: Tester le role Hyper V et les outils de gestion `RSAT - Remote Server Administration Tools`

```powershell
Get-WindowsFeature *Hyper*
```
> Response:
```python

Display Name                                            Name                       Install State
------------                                            ----                       -------------
[X] Hyper-V                                             Hyper-V                        Installed
        [X] Hyper-V Management Tools                    RSAT-Hyper-V-Tools             Installed
            [X] Hyper-V Module for Windows PowerShell   Hyper-V-PowerShell             Installed
```

Uniquement avec `Desktop Experience` (Hyper-V GUI Management Tools)

```powershell
Get-WindowsFeature *Hyper*
```
> Response :
```python

Display Name                                            Name                       Install State
------------                                            ----                       -------------
[ ] Hyper-V                                             Hyper-V                        Available
        [ ] Hyper-V Management Tools                    RSAT-Hyper-V-Tools             Available
            [ ] Hyper-V GUI Management Tools            Hyper-V-Tools                  Available
            [ ] Hyper-V Module for Windows PowerShell   Hyper-V-PowerShell             Available
```


## :ab: Implémentation de sa machine virtuelle

:pushpin: Créer la machine virtuelle en suivant le modèle suivant

[:point_right: Installer sa machine virtuelle](.docs/VM.md)

:pushpin: Pour se connecter à sa machine virtuelle utiliser:

[:point_right: Remote Desktop Connection](.docs/RDC.md)

:pushpin: Le page suivante permet le changement des:

[:point_right: Paramètres de sa machine virtuelle](.docs/IP.md)

## :cl: Créer votre propre page

- [ ] Page :id:/`README.md`

Créer votre page permettant la documentation de la création de votre propre machine virtuelle

- [ ] Un exemple de page se trouve dans le lien ci-dessous:

[:point_right: Example](300098957)

# References

- [ ] [How to Install the Hyper-V PowerShell Module (updated for Windows Server 2019)](https://www.altaro.com/hyper-v/install-hyper-v-powershell-module/)

- [ ] [Microsoft wants to move Windows fully to the cloud](https://www.theverge.com/2023/6/27/23775117/microsoft-windows-11-cloud-consumer-strategy)
- [ ] [RSAT - Remote Server Administration Tools](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/manage/remotely-manage-hyper-v-hosts)

- [ ] [Hyper-V](https://learn.microsoft.com/en-us/powershell/module/hyper-v/?view=windowsserver2022-ps)

## Modules 

- [ ] Server Manager

```powershell
Get-Module ServerManager
```
> Response :
```python

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Script     2.0.0.0    ServerManager                       {Get-WindowsFeature, Install-WindowsFeature, Uninstall-Win...

```

```
PS> Get-Module -ListAvailable *Hyper*


    Directory: C:\Windows\system32\WindowsPowerShell\v1.0\Modules


ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Binary     2.0.0.0    Hyper-V                             {Add-VMAssignableDevice, Add-VMDvdDrive, Add-VMFibreChan...
Binary     1.1        Hyper-V                             {Add-VMDvdDrive, Add-VMFibreChannelHba, Add-VMHardDiskDr...

```

- [ ]  Voir les commandes Powershell pour le role Hyper V

```
PS> Get-Command -Module Hyper-V
```

### :pushpin: Installer les Options individuellement (Si non installé par la commande globale)

```
PS> Install-WindowsFeature -Name Hyper-V-PowerShell
 
PS> # Install Hyper-V Manager and the PowerShell module (HVM only available on GUI systems)
PS> Install-WindowsFeature -Name RSAT-Hyper-V-Tools
 
PS> # Install the Hyper-V hypervisor and all tools (method #1)
PS> Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
 
PS> # Install the Hyper-V hypervisor and all tools (method #2)
PS> Install-WindowsFeature -Name Hyper-V, RSAT-Hyper-V-Tools
```




