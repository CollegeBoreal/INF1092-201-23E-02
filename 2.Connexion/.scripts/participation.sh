#!/bin/sh

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only
   
echo "# Participation au `date +"%d-%m-%Y %H:%M"`"
echo ""


echo "| Table des matières            | Description                                             |"
echo "|-------------------------------|---------------------------------------------------------|"
echo "| :a: [Présence](#a-présence)   | L'étudiant.e a fait son travail    :heavy_check_mark:   |"
echo "| :b: [Précision](#b-précision) | L'étudiant.e a réussi son travail  :tada:               |"

echo ""
echo "## Légende"
echo ""

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| :id:      | Utilisateur à remplacer | Windows Product Name (Windows Server :question_mark:)  | :key: OS Level |"
echo "|------|-----------|-------------------------|---------------------------------------------|----------------|"

i=0
NONE="NONE"

for id in "${ETUDIANTS[@]}"
do
   URL="<image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image>"
   FILE=${id}/README.md
   FOLDER=${id}/images
   SERVER=${SERVERS[$i]}
   OK="| ${i} | [${id}](../${FILE}) ${URL} | ${SERVER} |"
   KO="| ${i} | [${id}](../${FILE}) ${URL} | :x: |"
   if [ ${SERVER} == ${NONE} ]; then
       echo ${KO}
   else
       echo ${OK}
   fi
   let "i++"
done
