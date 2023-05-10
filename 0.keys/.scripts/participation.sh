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
echo "|:hash:| Boréal :id:                | README.md    |"
echo "|------|----------------------------|--------------|"

i=0

for id in "${ETUDIANTS[@]}"
do
   URL=[${IDS[${i}]} <image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image>](https://github.com/${IDS[${i}]})
   FILE=${id}/README.md
#   OK="| ${i} || [${id}](../${FILE}) - [${IDS[${i}]}]()<image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | :heavy_check_mark: |"
#   KO="| ${i} | [${id}](../${FILE}) - [${IDS[${i}]}]<image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> | :x: |"
    OK="| ${i} | [${id}](../${FILE}) - ${URL} | :heavy_check_mark: |"
    KO="| ${i} | [${id}](../${FILE}) - ${URL} | :x: |"
   if [ -f "$FILE" ]; then
          echo ${OK}
   else
       echo ${KO}
   fi
   let "i++"
done