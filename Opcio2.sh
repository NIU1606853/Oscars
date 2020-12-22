#!bin/bash 

function MENU ()
{
echo "

--------------------------------------------------
              Qui va guanyar ...?
-------------------------------------------------- 
2.1  Mostrar  l’actor  i  l’actriu  que  van  guanyar  un  any  determinat. 
2.2 Mostrar els Oscars a millor actriu guanyats per una actriu determinada. 
2.3 Mostrar els Oscars a millor actriu o actor que ha obtingut una pel·lícula determinada.
"
}


function Opcio1 ()
{

read -p "Introdueix un any: "  any

Actor=`grep -n "$any" oscar_age_male.csv | cut -d, -f4`
Actriu=`grep -n "$any" oscar_age_female.csv | cut -d, -f4`

EdatH=`grep -n "$any" oscar_age_male.csv | cut -d, -f3`
EdatD=`grep -n "$any" oscar_age_female.csv | cut -d, -f3`

PeliH=`grep -n "$any" oscar_age_female.csv | cut -d, -f5`
PeliD=`grep -n "$any" oscar_age_female.csv | cut -d, -f5`

echo "

Guanyadors any $any 
------------------
Oscar a millor actor: $Actor
Edat: $EdatH 
Pel·lícula: $PeliH 
------------------ 
Oscar a millor actriu: $Actriu 
Edat: $EdatD 
Pel·lícula: $PeliD
"
}


function Opcio2 ()
{
read -p "Oscars a millor actriu obtinguts per: "  nom

Edat=`grep -n $nom oscar_age_female.csv | cut -d, -f3`
Any=`grep -n $nom oscar_age_female.csv | cut -d, -f2`
Peli=`grep -n $nom oscar_age_female.csv | cut -d, -f5`

Resposta=`paste <(echo "$Edat") <(echo "$Any") <(echo "$Peli")`


echo " Edat    Any     Pel·lícula "
echo "$Resposta"

}


function Opcio3 ()
{
read -p "Oscars a millor actriu i actor obtinguts per: " Peli

Any=`cat oscar_age_male.csv | grep -n $Peli | cut -d, -f2`
Any=`cat oscar_age_female.csv | grep -n $Peli | cut -d, -f2`

Actiu=`cat oscar_age_female.csv | grep -n $Peli | cut -d, -f4`
Actor=`cat oscar_age_male.csv | grep -n $Peli | cut -d, -f4`

EdatD=`cat oscar_age_female.csv | grep -n $Peli | cut -d, -f3`
EdatH=`cat oscar_age_male.csv | grep -n $Peli | cut -d, -f3`

echo "

Any:$Any
----------------------------------------------
actriu: $Actiu
edat: $EdatD
actor: $Actor
edat: $EdatH
"
}



MENU
read opcio

case $opcio in

1 | 2.1) Opcio1 ;;

2 | 2.2) Opcio2 ;;

3 | 2.3) Opcio3 ;;

esac
