#!/bin/bash
utilisateur(){
echo "saisir le login"
read login
while [ -z $login ]
do
echo "Veuillez saisir un nom!"
read login
done
var=$(who | grep $login | wc -l)
if [ $var == 0 ]; then
echo "$login n'est pas connecté "
else 
port=$(who | grep root | tr -s " " | cut -d" " -f2)
echo "$login est connecté sur les ports $port"
fi
}
mémoire(){
total=$(free -h --giga | grep Mem | tr -s " " | cut -d " " -f2)
used=$(free -h --giga | grep Mem | tr -s " " | cut -d " " -f3)
free=$(free -h --giga | grep Mem | tr -s " " | cut -d " " -f4)

echo "la mémoire total est $total"
echo "la mémoire utilisé est $used"
echo "la mémoire libre est $free"
}


sauvegarde(){
echo "saisir repertoire"
read rep
while [ -z $rep ]
do
echo "Veuillez saisir un répertoire ! "
read rep
done
if [ -d $rep ];then
echo "Le dossier $rep existe !";
else
echo "Le dossier $rep existe pas !";
fi
if [ -d $rep];then
echo "sauvegarder rep? oui\1 non\2"
read save
while [ -z $save ]
do
echo "Veuiller répondre correctement! oui\1 non\2 "
read save
done
else
break
fi
if [ $save == 1 ];then
cp -r $rep /home/save
echo "le dossier $rep est sauvegardé dans /home/save"
else
echo "le dossier $rep n'est pas sauvegardé"
fi
}

Maj(){
apt update 
apt-get update
aptitude update
}


# Menu principal
clear
while true
do
echo ""
echo "---------- Menu Principal ---------------------------------"
echo "- 1. Rechercher une utilisateur connecté et sur quels ports"
echo "- 2. Connaitre l'utilisateur de la mémoire"
echo "- 3. Sauvegarder un repertoire"
echo "- 4. Mettre à jour système d'exploitation"
echo "- q. Quitter -"
echo "- -"
echo "- Quel est votre choix ? -"
echo "-----------------------------------------------------------"
read choix
case $choix in
1) utilisateur ;;
2) mémoire ;;
3) sauvegarde ;;
4) Maj ;;
q) break ;;
esac
done
