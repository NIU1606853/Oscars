#!bin/bash

function MENU ()
{
echo 
"
--------------------------------------------------
        Històric d’Oscars
-------------------------------------------------- 
1.1 Mostrar històric d’Oscars a millor actor (alfabètic). 
1.2 Mostrar històric d’Oscars a millor actriu (edat) 
1.3 Mostrar històric d’Oscars (actors/actrius).
"
}

#Opcio escollida per usur@: 1
function Opcio1 ()
{
    Actor=cat oscar_age_male.csv | cut -d, -f4
    AnyM=cat oscar_age_male.csv | cut -d, -f2
    EdatM=cat oscar_age_male.csv | cut -d, -f3
    PeliM=cat oscar_age_male.csv | cut -d, -f5

    RespostaM=paste <(echo "$Actor") <(echo "$AnyM") <(echo "$EdatM") <(echo "$PeliM")
    echo "$RespostaM"
}

#Opcio escollida per usur@: 2
function Opcio2 ()
{
    EdatF=cat oscar_age_female.csv | cut -d, -f3
    Actiu=cat oscar_age_female.csv | cut -d, -f4
    AnyF=cat oscar_age_female.csv | cut -d, -f2
    PeliF=cat oscar_age_female.csv | cut -d, -f5

    RespostaF=paste <(echo "$EdatF") <(echo "$Actiu") <(echo "$AnyF") <(echo "$PeliF")
    echo "$RespostaF"
}

#Opcio escollida per usur@: 3
function RESULTAT ()
{
    echo any: $any 
    echo actor: $actor
    echo edat: $edatH
    echo pel·lícula: $peliH
    echo actriu: $actriu
    echo edat: $edatD
    echo pel·lícula: $peliD
    echo "----------------------------------------------------------------"
}
function RESPOSTES ()
{
    any=cat oscar_age_male.csv | cut -d, -f2 | head -$i | tail +$i

    actor=cut -d, -f4 oscar_age_male.csv | head -$i | tail +$i
    actriu=cut -d, -f4 oscar_age_female.csv | head -$i | tail +$i

    edatH=cut -d, -f3 oscar_age_male.csv | head -$i | tail +$i
    edatD=cut -d, -f3 oscar_age_female.csv | head -$i | tail +$i

    peliH=cut -d, -f5 oscar_age_male.csv | head -$i | tail +$i
    peliD=cut -d, -f5 oscar_age_female.csv | head -$i | tail +$i
}

function NUM_LINIES ()
{
    linies=cat oscar_age_male.csv | wc -l
}

function Opcio3 ()
{
    NUM_LINIES

    i=2
    while [ $i -le $linies ]
    do
        RESPOSTES

        RESULTAT

        let i++
    done
}

#INICI MAIN
MENU

echo "Escull una opcio "
read opcio

case $opcio in
1 ) 
    Opcio1
;;
2 ) 
    Opcio2
;;
3 ) 

echo 
    Opcio3
;;
* ) echo "Error: Opcio no vàlida"
esac
