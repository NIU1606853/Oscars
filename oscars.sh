#!/bin/bash

echo -n "---------------------------------------------------------
Base de Dades d’actors i actrius guanyadors/es de l’Oscar
---------------------------------------------------------
1. Històric d’Oscars.
2. Qui va guanyar ...?
3. Ets un Expert?
4. Altes, baixes i modificacions.
0. Sortir."

echo -n "Escull una opció: $OPT"

read $OPT



case $OPT in 
	1 | 2 | 3 | 4)
	echo -n "En desenvolupament"
	;;
	
	0)
	echo -n "-"
	;;
	
esac
