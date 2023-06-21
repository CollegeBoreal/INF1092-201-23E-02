# :four: Hyper V 

<img src=images/Hyper-V.png width='' height='' > </img>

## Qu'est-ce que Hyper V


## :one: Installer le role [Hyper V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/install-the-hyper-v-role-on-windows-server) sur Windows Server

```
PS> Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```


### :pushpin: Tester le role Hyper V et les outils de gestion `RSAT`

```
PS> Get-WindowsFeature *Hyper*

Display Name                                            Name                       Install State
------------                                            ----                       -------------
[X] Hyper-V                                             Hyper-V                        Installed
        [X] Hyper-V Management Tools                    RSAT-Hyper-V-Tools             Installed
            [X] Hyper-V Module for Windows PowerShell   Hyper-V-PowerShell             Installed
```

### :pushpin: Installer les modules individuellement (Si non installé par la commande globale)

```
PS> Install-WindowsFeature -Name Hyper-V-PowerShell
 
PS> # Install Hyper-V Manager and the PowerShell module (HVM only available on GUI systems)
PS> Install-WindowsFeature -Name RSAT-Hyper-V-Tools
 
PS> # Install the Hyper-V hypervisor and all tools (method #1)
PS> Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
 
PS> # Install the Hyper-V hypervisor and all tools (method #2)
PS> Install-WindowsFeature -Name Hyper-V, RSAT-Hyper-V-Tools
```


```
PS> Get-Module -ListAvailable *Hyper*


    Directory: C:\Windows\system32\WindowsPowerShell\v1.0\Modules


ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Binary     2.0.0.0    Hyper-V                             {Add-VMAssignableDevice, Add-VMDvdDrive, Add-VMFibreChan...
Binary     1.1        Hyper-V                             {Add-VMDvdDrive, Add-VMFibreChannelHba, Add-VMHardDiskDr...

```

## Voir les commandes Powershell pour le role Hyper V

```
PS> Get-Command -Module Hyper-V
```

## Utilisation de sa machine virtuelle

:pushpin: Création

[:point_right: Installer sa machine virtuelle](.docs/VM.md)

:pushpin: Paramêtres

[:point_right: Paramètres de sa machine virtuelle](.docs/IP.md)


# References

- [ ] [How to Install the Hyper-V PowerShell Module (updated for Windows Server 2019)](https://www.altaro.com/hyper-v/install-hyper-v-powershell-module/)


- [ ] [Hyper-V](https://learn.microsoft.com/en-us/powershell/module/hyper-v/?view=windowsserver2022-ps)
