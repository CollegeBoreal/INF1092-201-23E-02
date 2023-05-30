# Connexion à distance à Windows

:tada: [Participation](.scripts/Participation.md)

# Vérification Prof

Sous [@PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.3)

#### :one: Entrer la commande ci-dessous, 

* Taper Enter et Donner `B0r34l$` comme mot de passe

```powershell
$Password = Read-Host -AsSecureString 
```

#### :two: Créer l'utilisateur

```powershell
New-LocalUser "Brice" -Password $Password -FullName "Brice" -Description "Prof. "
```


#### :three: Donner les droits administrateurs à l'utilisateur

```powershell
Add-LocalGroupMember -Group "Administrators" -Member "Brice"
```

#### :four: Ne jamais faire expirer le mot de passe

```powershell
Set-LocalUser "Brice" -AccountNeverExpires
```

#### :x: Donner un autre mot de passe

```powershell
Set-LocalUser "Brice" -Password (ConvertTo-SecureString -AsPlainText "B0r34l$" -Force)
```

#### :o: Verification


```powershell
Get-LocalGroupMember -Group "Administrators"
```
> Retourne :
```yaml

ObjectClass Name                   PrincipalSource
----------- ----                   ---------------
User        <SERVEUR>\Administrator Local
User        <SERVEUR>\Brice         Local
```



### :key: OS Level

#### :keyboard: ServerCore 

```powershell
Get-ComputerInfo -Property WindowsProductName, OsServerLevel
```
> Retourne :
```yaml
WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    ServerCore
```
#### :desktop_computer: FullServer 

```powershell
Get-ComputerInfo -Property WindowsProductName, OsServerLevel
```
> Retourne :
```yaml

WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    FullServer
```

```powershell
Get-ComputerInfo -Property Windows*, Hyper*
```
> Retourne :
```yaml

WindowsBuildLabEx                                 : 17763.1.amd64fre.rs5_release.180914-1434
WindowsCurrentVersion                             : 6.3
WindowsEditionId                                  : ServerDatacenterACor
WindowsInstallationType                           : Server Core
WindowsInstallDateFromRegistry                    : 1/11/2020 5:24:35 AM
WindowsProductId                                  : 00000-00000-00000-00000
WindowsProductName                                : Windows Server Datacenter
WindowsRegisteredOrganization                     :
WindowsRegisteredOwner                            :
WindowsSystemRoot                                 : C:\Windows
WindowsVersion                                    : 1809
HyperVisorPresent                                 : False
HyperVRequirementDataExecutionPreventionAvailable : True
HyperVRequirementSecondLevelAddressTranslation    : True
HyperVRequirementVirtualizationFirmwareEnabled    : True
HyperVRequirementVMMonitorModeExtensions          : True
```


# Références

https://pureinfotech.com/create-new-user-account-powershell-windows-10/
- [ ] [Contain your excitement: Updates on Windows Server 2022 and Containerd](https://techcommunity.microsoft.com/t5/containers/contain-your-excitement-updates-on-windows-server-2022-and/ba-p/2820015)
