# 🔑 CREATION DE MA CLE  'WINDOW SERVER 2022'
 pour se faire il vous faudra:
- telecharger l'iso de la version de windows desire.
- avoir un logiciel permettant de creer une clee bootable tels que: Rufus, belenaETCHER,UNetbooting,WINToBootic...
- il vous faudra biensur dispose d'une clee USB pouvant contenir le fichier iso telecharge (minimum 32 G0 pour plus de securite)
  
<img src=images/20230525_105051.jpg width='' height='' > </img>
# 🌧️ formatage des disques dur
cette operation est executer lorsqu'un systeme est deja present sur le server sur lequel vous voulez travailler.
pour pouvoir le formater afin d'y installer un nouveau vous devez lors lors de lallumage de votre server appuyer la touche "F8"

<img src=images/IMG-20230606-WA0036.jpg width='' height='' > </img>
# selection et formatage du disque logique
Apres avoir identifie les logical drives ou disques logiques present sur votre serveur .il vous faudra selectionne le logical drive
sur lequel vous voulez installer votre systeme ( nous choisirons celui de type RAID)
<img src=images/IMG-20230606-WA0002.jpg width='' height='' > </img>
<img src=images/IMG-20230606-WA0018.jpg width='' height='' > </img>
<img src=images/IMG-20230606-WA0031.jpg width='' height='' > </img>
# 🕛 Installation window server 2022 ⏲️
il suffit juste de suivre les etapes qui vont etre affiche a votre ecran au fure et a mesure

<img src=images/IMG-20230606-WA0020.jpg width='' height='' > 
# seclectionner le type d'installation que vous desirez. vous pouvez soit utiliser les partitions par defaut (option 1) soit les  personnaliser vous meme (option 2)
il vous sera egalement demade d'entre une "cle" celle qui vous a ete fournis lors de la creation de votre cle windows serveur 

<img src=images/IMG-20230606-WA0006.jpg width='' height='' >
<img src=images/IMG-20230606-WA0011.jpg width='' height='' >
<img src=images/IMG-20230606-WA0040.jpg width='' height='' >
#  👨‍🏫 SCONFIG : il s'agit ici de configurer vos parametres reseau (pour se faire entrez "1")

<img src=images/1.jpg width='' height='' > 

# ✍️ ATTRIBUTION D'UNE NOUVELLE ADRESSE IP 
IL s'agit ici de 10.13.237.34

<img src=images/7.jpg width='' height='' >

# ✍️ ATTRIBUTION D'UN SUBNET-MASK OU MASQUE DE SOUS RESEAU
on prendra comme subnet-mask 255.255.255.0

<img src=images/3.jpg width='' height='' >

# ✍️CONFIGURATION DE L'ADRESSE DU DNS SERVER
pour cella il faudrai revenir sur les parametres de sconfig et entrer "2"

<img src=images/4.jpg width='' height='' >

# ✍️ ATTRIBUTION DE L'ADRESSE DU DNS SERVEUR
on prendra dans notre cas l'adresse 1.1.1.1

<img src=images/5.jpg width='' height='' > 

# 👩‍🏫 surtout il est primordial a la fin des configurations de ne pas oublier de "sign out" en entrant les touche "Ctrl/ Alt/Delete" et selectionner l'option "sign out" ou cas contraire quelqu'un pourrai avoir acces a votre serveur et changer vos configurations

<img src=images/10.jpg width='' height='' >

