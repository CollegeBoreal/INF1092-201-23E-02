# Serveurs Windows

<img src="images/LaboratoireWindows.png" width="302" height="319"></img>


|:hash:| :id:      | Utilisateur à remplacer | Windows Product Name (Windows Server 2019)  | :key: OS Level | :whale: (opt)| 
|------|-----------|-------------------------|------------------------------------------------|----------|--------------|
| 01   | 300104524 | Brice@10.13.237.19      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 02   | 300104541 | Brice@10.13.237.41      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 03   | 300106918 | Brice@10.13.237.18      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 04   | 300107361 | Brice@10.13.237.99      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 05   | 300108234 | Brice@10.13.237.55      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 06   | 300110500 | Brice@10.13.237.75      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 07   | 300110529 | Brice@10.13.237.80      |:heavy_check_mark: Datacenter         |  :desktop_computer:|:x:|
| 08   | 300111671 | Brice@10.13.237.63      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 09   | 300111766 | Brice@10.13.237.66      |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 10   | 300112017 | Brice@10.13.237.60      |:heavy_check_mark: Datacenter         |  :desktop_computer:|:heavy_check_mark:|
| 11   | 300112917 | Brice@10.13.237.79      |:heavy_check_mark: Datacenter         |  :desktop_computer:|:x:|
| 12   | 300113775 | Brice@10.13.237.77      |:heavy_check_mark: Datacenter         |  :desktop_computer:|:x:|
|      |           |                         |                                                |          |                  |
| 0A   |           | Brice@10.13.237.4       |:heavy_check_mark: Datacenter |:keyboard:|:heavy_check_mark:|
| 0B   |           | Administrator@10.13.4.242 |:heavy_check_mark: Hyper-V Server 2019        |:keyboard:|:heavy_check_mark:|
| 0C   |           | Brice@10.13.5.47        |:heavy_check_mark: Hyper-V Server 2019          |:keyboard:|:heavy_check_mark:|
| 0C   | 300105201 | Brice@10.13.5.52        |:heavy_check_mark: Hyper-V Server 2019          |:keyboard:|:heavy_check_mark:|

|:hash:| :id:      | Utilisateur à remplacer | Windows Product Name (Windows Server 2019)  | :key: OS Level | :whale: (opt)| 
|------|-----------|-------------------------|------------------------------------------------|----------|--------------|
| 01   | 300104524 | Brice@10.13.4.238       |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 02   | 300104541 | Brice@10.13.2.65        |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 03   | 300106918 | Brice@10.13.2.51        |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 04   | 300107361 | Brice@10.13.5.46        |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 05   | 300108234 | Brice@10.13.4.245       |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 06   | 300110500 | Brice@10.13.5.54        |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 07   | 300110529 | Brice@10.13.2.26        |:heavy_check_mark: Datacenter                   |  :desktop_computer:|:x:|
| 08   | 300111671 | Brice@10.13:5.55        |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 09   | 300111766 | Brice@10.13.5.44        |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 10   | 300112017 | Brice@10.13.2.68        |:heavy_check_mark: Datacenter                   |  :desktop_computer:|:x:|
| 11   | 300112917 | Brice@10.13.2.63        |:heavy_check_mark: Datacenter                   |  :desktop_computer:|:x:|
| 12   | 300113775 | Brice@10.13.5.20        |:heavy_check_mark: Datacenter                   |  :desktop_computer:|:x:|
|      |           |                         |                                                |          |                  |
| 0A   |  :one:    | Brice@10.13.237.4       |:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 0B   |  :one:    |Administrator@10.13.4.242|:heavy_check_mark: Datacenter                   |:keyboard:|:heavy_check_mark:|
| 0C   |  :two:    | Brice@10.13.5.47        |:heavy_check_mark: Hyper-V Server 2019          |:keyboard:|:heavy_check_mark:|



# Vérification Prof

Sous @PowerShell

#### :one: Entrer la commande ci-dessous, 

* Taper Enter et Donner `B0r34l$` comme mot de passe

```
PS > $Password = Read-Host -AsSecureString 
```

#### :two: Créer l'utilisateur

```
PS > New-LocalUser "Brice" -Password $Password -FullName "Brice" -Description "Prof. "
```


#### :three: Donner les droits administrateurs à l'utilisateur

```
PS > Add-LocalGroupMember -Group "Administrators" -Member "Brice"
```

#### :four: Ne jamais faire expirer le mot de passe

```
PS> Set-LocalUser "Brice" -AccountNeverExpires
```

#### :x: Donner un autre mot de passe

```
PS > Set-LocalUser "Brice" -Password (ConvertTo-SecureString -AsPlainText "B0r34l$" -Force)
```

#### :o: Verification


```
PS > Get-LocalGroupMember -Group "Administrators"

ObjectClass Name                   PrincipalSource
----------- ----                   ---------------
User        <SERVEUR>\Administrator Local
User        <SERVEUR>\Brice         Local
```



### :key: OS Level

#### :keyboard: ServerCore 

```
PS > Get-ComputerInfo -Property WindowsProductName, OsServerLevel
WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    ServerCore
```
#### :desktop_computer: FullServer 

```
PS > Get-ComputerInfo -Property WindowsProductName, OsServerLevel

WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    FullServer
```

```
PS C:\> Get-ComputerInfo -Property Windows*, Hyper*


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

### :whale: Docker Engine


# Références

https://pureinfotech.com/create-new-user-account-powershell-windows-10/
