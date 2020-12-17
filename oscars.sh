#!/bin/bash

function NoVALID ()
{
    echo "Error: Opció no valida"
    sleep 3s
    clear
}



function MENU ()
{
echo 
"
--------------------------------------------------------- 
Base de Dades d’actors i actrius guanyadors/es de l’Oscar  ---------------------------------------------------------
1.Històric d’Oscars.
2.Qui va guanyar ...? 
3.Ets un Expert? 
4.Altes, baixes i modificacions. 
0.Sortir. 
" 
}

function DESENVOLUPAMENT ()
{
case $opcio in 

0) exit ;;

1 | 2 | 3 | 4)
    echo "En desenvolupament"
    read -n 1 -s
    clear
;;

*) NoVALID

esac
}

while true 
do

MENU
echo "Escull una opció: "
read opcio

DESENVOLUPAMENT

done
