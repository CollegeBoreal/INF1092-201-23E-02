# 300135175
:pushpin: utiliser 'rufus' Il permet de créer des clés USB bootables pour l'installation de systèmes d'exploitation tels que Windows, Linux, etc. Vous pouvez utiliser Rufus en sélectionnant l'image ISO du système d'exploitation souhaité, en choisissant le périphérique USB approprié et table de partition mbr ou gpt en lançant le processus de création du support d'installation bootable.
<img src=images/20230517_182725%20(1).jpg width='' height='' > </img>
:pushpin: `sconfig` configuration du réseau 
<img src= width='' height='' > </img>
 cet fenetre ca veux dire L'UEFI BIOS prend en charge à la fois les tables de partition GUID (GPT) et les tables de partition Master Boot Record (MBR)
<img src=images/20230517_181628.jpg width='' height='' > </img> 
Assurez-vous que la clé USB contenant l'installation de Windows Server 2019 est insérée dans un port USB de l'ordinateur.
Démarrez votre ordinateur et accédez au menu de démarrage en appuyant sur la touche F11 démarrage .
Dans le menu de démarrage, choisissez la clé USB contenant l'installation de Windows Server 2019 comme périphérique de démarrage.
L'ordinateur va maintenant démarrer à partir de la clé USB.
Acceptez les termes du contrat de licence.
Sur l'écran de type d'installation, choisissez l'option "Personnalisée Windows Server Datacenter est une édition de Windows Server axée sur les fonctionnalités avancées de serveur, tandis que Datacenter Desktop Experience comprend une interface utilisateur graphique pour une gestion plus conviviale du serveur, en plus des fonctionnalités avancées du serveur Installer uniquement Windows (avancé)".
<img src=images/20230517_183832%20(1).jpg?raw=true width='' height='' > </img>
Vous verrez maintenant une liste des disques durs disponibles. Sélectionnez le disque dur que vous avez précédemment formaté.et en cas ou sont charge vous pouvez les formate pour assurer un bon foncionnment de system
Cliquez sur "Suivant" pour lancer le processus d'installation de Windows Server 2019 sur le disque dur sélectionné.(sa prend un peu de temps)
Suivez les instructions supplémentaires à l'écran pour configurer les paramètres de base, tels que le nom d'utilisateur, le mot de passe et les options de réseau.le mdp doit etre compose au min de 6 combinaison de chiffres, de lettres majuscules et de caractères spéciaux
Une fois l'installation terminée, l'ordinateur redémarrera automatiquement.
redémarrage
la dernier etape il ne faut surtt pas oublier de mettre le serveur en mode enable remote desktop pour pouvoir lexploite en mode remote
vous pouvez le mettre en mode enable en suivant les etapes suivants par sellectionner la commande :7
<img src=images/en%20rdt%201.jpg width='' height='' > </img>
<img src=images/en%20rdt%202.jpg width='' height='' > </img>
<img src=images/en%20rdt%203.jpg width='' height='' > </img>
<img src=images/en%20rdt%204.jpg width='' height='' > </img>
