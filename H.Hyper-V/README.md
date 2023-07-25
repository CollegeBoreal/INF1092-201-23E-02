# Hyper-V

| TOC |
|-----|
| [Qu'est ce que la Virtualisation?](#catgpt-quest-ce-que-la-Virtualisation) |
| [qu'estce que Hyper V?](#catgpt-quest-ce-que-hyper-v) |
| [Comment installer Hyper-V sur windows server en utilisant powershell?](#catgpt-comment-installer-hyper-v-sur-windows-server-en-utilisant-powershell) |
| [Qu'est-ce que PowerShell?](#catgpt-quest-ce-que-powershell) |
| [Comment se connecter a une VM sous WindowsServer en utilisant PowerShell ?](#catgpt-comment-se-connecter-a-une-vm-sous-windowsserver-en-utilisant-powershell-)

### :cat:GPT Qu'est ce que la Virtualisation?

<img src=images/Hyper-V.png width=75% height=75% > </img>


La virtualisation est une technologie qui permet de créer des versions virtuelles d'un matériel informatique, d'un système d'exploitation, d'une application ou d'une ressource, afin de les utiliser de manière isolée et indépendante de l'environnement physique sous-jacent.

La virtualisation permet de maximiser l'utilisation des ressources matérielles en exécutant plusieurs systèmes ou applications sur une seule machine physique, appelée hôte. Chaque système ou application s'exécute dans son propre environnement virtuel, appelé machine virtuelle, qui est isolé des autres machines virtuelles et de l'hôte.

La virtualisation présente plusieurs avantages :

1. Consolidation des ressources : Elle permet de consolider plusieurs serveurs physiques en une seule machine physique, ce qui réduit les coûts d'achat, de maintenance et de consommation d'énergie.

2. Isolation et sécurité : Chaque machine virtuelle fonctionne de manière isolée, ce qui garantit que les problèmes ou les pannes d'une machine virtuelle n'affectent pas les autres. Cela améliore la sécurité et la fiabilité des applications.

3. Gestion simplifiée : La virtualisation facilite la gestion des systèmes informatiques en permettant la création, la duplication, le démarrage, l'arrêt et la migration des machines virtuelles de manière flexible et centralisée.

4. Test et développement : Les environnements virtuels offrent un espace sûr pour tester et développer des applications sans affecter les systèmes de production.

5. Haute disponibilité et reprise après sinistre : La virtualisation permet la migration en direct des machines virtuelles d'un serveur physique à un autre, ce qui permet une haute disponibilité des applications et facilite la reprise après sinistre.

La virtualisation est largement utilisée dans les centres de données, les environnements de développement et de test, ainsi que dans les solutions de cloud computing, où elle permet de fournir des services d'infrastructure flexibles et évolutifs.

En résumé, la virtualisation est une technologie qui permet de créer des environnements virtuels isolés pour exécuter plusieurs systèmes ou applications sur une seule machine physique, offrant ainsi une meilleure utilisation des ressources, une gestion simplifiée, une sécurité améliorée et une flexibilité accrue.

### :cat:GPT Qu'est-ce que Hyper V?


Hyper-V est une technologie de virtualisation de Microsoft intégrée aux systèmes d'exploitation Windows, tels que Windows 10 Pro, Enterprise et Education, ainsi que Windows Server. Il permet de créer et de gérer des machines virtuelles sur un seul ordinateur physique.

Avec Hyper-V, vous pouvez exécuter plusieurs systèmes d'exploitation et applications isolés les uns des autres, chacun dans sa propre machine virtuelle. Chaque machine virtuelle dispose de son propre matériel virtuel, y compris le processeur, la mémoire, le stockage et les interfaces réseau. Cela permet d'exécuter différents systèmes d'exploitation et configurations logicielles sur un seul ordinateur physique.

Hyper-V offre également des fonctionnalités avancées telles que la prise en charge des snapshots (instantanés) pour capturer et restaurer l'état d'une machine virtuelle à un moment donné, la migration en direct pour déplacer des machines virtuelles en cours d'exécution d'un hôte Hyper-V à un autre, et la gestion centralisée des machines virtuelles à l'aide d'outils tels que System Center Virtual Machine Manager.

En résumé, Hyper-V est une technologie de virtualisation puissante qui permet aux utilisateurs de créer et de gérer des environnements de machines virtuelles sur leurs ordinateurs Windows, ce qui facilite le déploiement et la gestion d'applications et de systèmes d'exploitation isolés.

##### :cat:GPT Comment installer Hyper-V sur windows server en utilisant powershell?

- [ ] Hyper-V
  - [ ] Windows Features
- [ ] Powershell
  - [ ] PowerShell Hyper-V Module 
- [ ] Services

<img src=images/revision-1.png width=75% height=75% > </img>


Pour installer le rôle Hyper-V sur Windows Server à l'aide de PowerShell, vous pouvez suivre les étapes suivantes :

1. Ouvrez une session PowerShell en tant qu'administrateur.

2. Exécutez la commande suivante pour installer le rôle Hyper-V :
```powershell
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```
Cette commande installe le rôle Hyper-V ainsi que les outils de gestion associés. L'option `-Restart` redémarre le serveur automatiquement si nécessaire.

3. Attendez que l'installation soit terminée et que le serveur redémarre si nécessaire.

Après le redémarrage, le rôle Hyper-V sera installé sur votre serveur Windows et vous pourrez commencer à utiliser Hyper-V pour créer et gérer des machines virtuelles.

Veuillez noter que l'installation du rôle Hyper-V peut nécessiter des privilèges d'administration et que le redémarrage du serveur peut entraîner une interruption temporaire des services en cours d'exécution. Assurez-vous d'effectuer cette opération pendant une période appropriée où une interruption de service est acceptable.

N'hésitez pas à adapter ces instructions en fonction de votre environnement spécifique.

##### :cat:GPT Qu'est-ce que PowerShell?


PowerShell est un environnement de ligne de commande et un langage de script développé par Microsoft. Il a été conçu pour l'automatisation des tâches administratives et la gestion des systèmes d'exploitation Windows. PowerShell offre une interface puissante permettant aux administrateurs système et aux développeurs de gérer et d'automatiser divers aspects du système d'exploitation Windows.

Voici quelques caractéristiques clés de PowerShell :

1. Interface en ligne de commande : PowerShell fournit une interface en ligne de commande (CLI) interactive qui permet aux utilisateurs de saisir des commandes et d'interagir avec le système d'exploitation.

2. Langage de script : PowerShell est également un langage de script complet qui permet de créer des scripts pour automatiser des tâches répétitives et complexes. Il prend en charge les boucles, les conditions, les fonctions, les variables et d'autres concepts de programmation.

3. Gestion des objets : PowerShell manipule les objets plutôt que de simples chaînes de caractères. Il utilise une approche basée sur les objets pour gérer les ressources du système, ce qui permet d'accéder facilement aux propriétés et aux méthodes des objets.

4. Extensibilité : PowerShell est hautement extensible. Il permet aux utilisateurs de créer et d'importer des modules qui ajoutent de nouvelles fonctionnalités et commandes à l'environnement.

5. Prise en charge de la gestion à distance : PowerShell offre des fonctionnalités de gestion à distance, ce qui signifie que vous pouvez exécuter des commandes PowerShell sur des machines distantes et gérer ces machines à partir d'un emplacement centralisé.

PowerShell est devenu un outil essentiel pour les administrateurs système et les développeurs Windows, car il permet d'automatiser des tâches courantes, de gérer les configurations système, de diagnostiquer et de résoudre des problèmes, et d'effectuer des opérations de gestion des systèmes à grande échelle.


##### :cat:GPT Comment se connecter a une VM sous WindowsServer en utilisant PowerShell ?


<img src=images/revision-2.png width=75% height=75% > </img>


Pour vous connecter à une machine virtuelle (VM) sous Windows Server en utilisant PowerShell, vous pouvez utiliser la commande `Enter-PSSession` (pour les machines virtuelles Windows) ou `ssh` (pour les machines virtuelles Linux). Voici comment procéder :

1. Assurez-vous que la machine virtuelle est en cours d'exécution et que vous avez les droits d'accès appropriés pour vous y connecter.

2. Ouvrez PowerShell en tant qu'administrateur sur votre machine locale.

3. Pour vous connecter à une VM Windows, utilisez la commande `Enter-PSSession` avec l'adresse IP de la VM et les informations d'identification appropriées :

   ```powershell
   Enter-PSSession -VMName NomDeLaVM -Credential (Get-Credential)
   ```

   Remplacez "NomDeLaVM" par le nom de votre machine virtuelle et entrez les informations d'identification de connexion lorsque vous y êtes invité.

4. Pour vous connecter à une VM Linux, utilisez la commande `ssh` avec l'adresse IP de la VM et les informations d'identification appropriées :

   ```powershell
   ssh Utilisateur@AdresseIPDeLaVM
   ```

   Remplacez "Utilisateur" par votre nom d'utilisateur sur la VM et "AdresseIPDeLaVM" par l'adresse IP de votre machine virtuelle.

5. Une fois la connexion établie, vous serez dans une session distante sur la machine virtuelle, et vous pouvez exécuter des commandes et des scripts directement sur la VM à partir de votre PowerShell local.

N'oubliez pas de fermer la session distante lorsque vous avez terminé en utilisant la commande `Exit-PSSession` (pour les machines virtuelles Windows) ou simplement en fermant la fenêtre PowerShell (pour les machines virtuelles Linux).

##### :cat:GPT Est-ce que la creation d'une VM  Switch est nescessaire?

Oui, la création d'une VM Switch est nécessaire si vous souhaitez permettre à vos machines virtuelles d'accéder au réseau externe ou de communiquer entre elles. Un Virtual Switch (communément appelé VM Switch) agit comme un pont entre les interfaces réseau virtuelles des machines virtuelles et l'adaptateur réseau physique de l'hôte (serveur) ou d'autres machines virtuelles.

Lorsque vous créez une machine virtuelle, vous avez la possibilité de choisir une VM Switch existante ou d'en créer une nouvelle. Voici quelques cas où la création d'une VM Switch est nécessaire :

1. Accès au réseau externe : Si vous souhaitez que votre machine virtuelle accède au réseau externe (Internet, réseau local, etc.), vous devez associer la VM à une VM Switch qui est liée à un adaptateur réseau physique connecté à votre réseau.

2. Communication entre machines virtuelles : Si vous avez plusieurs machines virtuelles sur un même hôte et que vous voulez qu'elles puissent communiquer entre elles, vous pouvez utiliser une VM Switch interne ou privée. Une VM Switch interne permet aux machines virtuelles de communiquer entre elles et avec l'hôte, mais elles n'ont pas d'accès au réseau externe. Une VM Switch privée ne permet que la communication entre les machines virtuelles sans accès au réseau externe ou à l'hôte.

3. Isolation des machines virtuelles : Vous pouvez utiliser une VM Switch privée pour isoler les machines virtuelles les unes des autres et de l'hôte, afin de créer un environnement de test ou de développement sécurisé.

En résumé, la création d'une VM Switch est nécessaire pour configurer la connectivité réseau de vos machines virtuelles et déterminer comment elles communiquent avec le réseau externe et entre elles. Vous pouvez créer différentes VM Switch en fonction des besoins spécifiques de votre environnement virtuel.

Pour créer une VM Switch à l'aide de PowerShell, vous pouvez utiliser la commande suivante : New-VMSwitch

Voici la syntaxe générale de la commande New-VMSwitch :

```powershell
New-VMSwitch -Name <NomSwitch> -SwitchType <TypeSwitch> -NetAdapterName <NomAdaptateur> [-AllowManagementOS <$true | $false>] [-Notes <Description>] [-MinimumBandwidthMode <Weight | Absolute>] [-MinimumBandwidthWeight <Valeur>] [-MinimumBandwidthAbsolute <Valeur>] [-CimSession <CimSession[]>] [-ThrottleLimit <Int32>] [-AsJob] [-WhatIf] [-Confirm]
```

Explications des principaux paramètres :

- `<NomSwitch>` : Le nom que vous souhaitez donner à votre VM Switch.
- `<TypeSwitch>` : Le type de VM Switch que vous voulez créer (External, Internal, Private).
- `<NomAdaptateur>` : Le nom de l'adaptateur réseau physique auquel vous souhaitez associer la VM Switch. Vous pouvez obtenir la liste des adaptateurs réseau disponibles en utilisant la commande `Get-NetAdapter`.
- `-AllowManagementOS` : Spécifiez `$true` si vous souhaitez que l'hôte ait également accès à la VM Switch, ou `$false` pour limiter l'accès uniquement aux machines virtuelles.
- `-Notes` : Une description ou des notes optionnelles pour la VM Switch.
- `-MinimumBandwidthMode`, `-MinimumBandwidthWeight`, `-MinimumBandwidthAbsolute` : Ces paramètres sont utilisés pour configurer la bande passante minimale pour la VM Switch, ils sont optionnels.

Voici un exemple de commande pour créer une VM Switch de type "External" liée à l'adaptateur réseau physique nommé "Ethernet" et permettant à l'hôte d'y accéder :

```powershell
New-VMSwitch -Name "MonSwitch" -SwitchType External -NetAdapterName "Ethernet" -AllowManagementOS $true
```

N'oubliez pas de lancer PowerShell en tant qu'administrateur pour exécuter cette commande, car la création d'une VM Switch nécessite des privilèges administratifs.
