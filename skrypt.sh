#!/bin/bash

parametr1="2022|2023"
parametr2=$2
parametr3=$3

if [ $# != 3 ]
then
echo "Zła ilość parametrów'
exit 1
fi

if ! [[ $1 =~ $parametr1 ]]
then
echo "Zły wybór roku"
exit 2
fi



mkdir 'Kartki Świąteczne' 'Pozostałe' 'Prace domowe' 'Zadania'
cd 'Kartki Świąteczne'
mkdir Kotki Pieski
cd ../Pozostałe
mkdir 'Listy zakupów' Przepisy
cd 'Listy zakupów'
mkdir 'Święta 2022' 'Święta 2023'
cd ../..

cd Pozostałe/Przepisy
touch 'Lista zakupów 2022.txt' 'Lista zakupów 2023.txt'
echo "świeża mięta
1 kg jabłek
1 kg cytryn
500 g kiszonej kapusty
1 mała główka świeżej kapusty
80 g suszonych, leśnych grzybów
200 g suszonych jabłek, śliwek, gruszek
4 kg ziemniaków
500 g drobnej, białej fasoli
bułka tarta
1 kg cukru
1 l barszczu w kartonie" > 'Lista zakupów $1.txt'

mv 'Lista zakupów 2022.txt' ../'Listy zakupów'/'Święta 2022'
mv 'Lista zakupów 2023.txt' ../'Listy zakupów'/'Święta 2023'

cd ../'Listy zakupów'/'Święta $1'
egrep '[1-9]+\s(kg)\s' 'Lista zakupów $1.txt' > ../'Ciężkie zakupy.txt'

