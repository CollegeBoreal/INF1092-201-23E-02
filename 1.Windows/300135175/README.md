# 300135175 &#129409;</p> windows server 2019 installation
:pushpin::pushpin::pushpin: 
 rufus Il permet de créer des clés USB bootables pour l'installation de systèmes d'exploitation tels que Windows, Linux, etc. Vous pouvez utiliser Rufus en sélectionnant l'image ISO du système d'exploitation souhaité, en choisissant le périphérique USB approprié et table de partition mbr ou gpt en lançant le processus de création du support d'installation bootable.<p>
<img src=images/20230517_182725%20(1).jpg width='' height='' > </img>
:pushpin:cet fenetre ca veux dire L'UEFI BIOS prend en charge à la fois les tables de partition GUID (GPT) et les tables de partition Master Boot Record (MBR)
<img src=images/20230517_181628.jpg width='' height='' > </img> 
:pushpin:Assurez-vous que la clé USB contenant l'installation de Windows Server 2019 est insérée dans un port USB de serveur.
<img src= width='' height='' > </img>
:pushpin:Démarrez votre serveur et accédez au menu de démarrage en appuyant sur la touche F11 démarrage .
<img src= width='' height='' > </img>
:pushpin:Dans le menu de démarrage, choisissez la clé USB contenant l'installation de Windows Server 2019 comme périphérique de démarrage.
:pushpin:Le serveur va maintenant booter à partir de la clé USB.
<img src=images
/IMG_20230517_182837.jpg width='' height='' > </img>
<img src=images/20230517_185555.jpg width='' height='' > </img>
:pushpin:Acceptez les termes du contrat de licence.
<img src=images/IMG_20230517_184702.jpg width='' height='' > </img>
:pushpin:Sur l'écran de type d'installation, choisissez l'option "Personnalisée Windows Server Datacenter est une édition de Windows Server axée sur les fonctionnalités avancées de serveur, tandis que Datacenter Desktop Experience comprend une interface utilisateur graphique pour une gestion plus conviviale du serveur, en plus des fonctionnalités avancées du serveur Installer uniquement Windows <img <img src=images/IMG_20230517_184629.jpg width='' height='' > </img>
<img src=images/20230517_183832%20(1).jpg width='' height='' > </img>
:pushpin:Vous verrez maintenant une liste des disques durs disponibles. Sélectionnez le disque dur que vous avez précédemment formaté.et :pushpin:en cas ou vous navez pas utilise raid5 pour le formatage de disque dur et sont encore sature vous pouvez les formate pour assurer un bon foncionnment de system en sellectionnant format ou delete 
images
<img src=images/IMG_20230517_194035.jpg width='' height='' > </img>
:pushpin:Cliquez sur "Suivant" pour lancer le processus d'installation de Windows Server 2019 sur le disque dur sélectionné.(cela prend un peu de temps &#8986;</p>)
<img src=images/IMG_20230517_194113.jpg width='' height='' > </img>
:pushpin:Suivez les instructions supplémentaires à l'écran pour configurer les paramètres de base, tels que le nom d'utilisateur, le mot de passe et les options de réseau.le mdp doit etre compose au min de 6 combinaison de chiffres, de lettres majuscules et de caractères spéciaux
:pushpin:Une fois l'installation terminée, le serveur redémarrera automatiquement.
redémarrage
<img src=images/IMG_20230517_201505.jpg width='' height='' > </img>
le mdp doit etre compose au min de 6 combinaison de chiffres, de lettres majuscules et de caractères spéciaux
<img src=images/IMG_20230517_195730%20(1).jpg width='' height='' > </img>
<img src=images/IMG_20230517_201505.jpg width='' height='' > </img>
:pushpin: tappez la commande "sconfig" pour configurer le reseau de votre serveur
<img src=images/IMG_20230517_201851.jpg width='' height='' > </img>
<img src=images/20230523_175014.jpg width='' height='' > </img>
<img src=images/20230523_174837.jpg width='' height='' > </img>
<img src= width='' height='' > </img>
:pushpin:La dernière étape importante consiste à ne pas oublier d'activer le bureau à distance (Remote Desktop) sur le serveur pour pouvoir l'exploiter à distance. Vous pouvez activer cette fonctionnalité en suivant les étapes suivantes :
<img src=images/en%20rdt%201.jpg width='' height='' > </img>
<img src=images/en%20rdt%202.jpg width='' height='' > </img>
<img src=images/en%20rdt%203.jpg width='' height='' > </img>
<img src=images/en%20rdt%204.jpg width='' height='' > </img>
<img src= width='' height='' > </img>
