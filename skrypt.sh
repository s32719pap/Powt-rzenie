#!/bin/bash
parametr1="2022|2023"
parametr2_3="[0-9]+"
if [ $# != 3 ]
then
echo "Zła ilość parametrów"
exit 1
fi
if ! [[ $1 =~ $parametr1 ]]
then
echo "Zły wybór roku"
exit 2
fi
if ! [[ $2 =~ $parametr2_3 ]]
then 
echo "Parametr 2 musi być liczbą"
exit 3
fi
if ! [[ $3 =~ $parametr2_3 ]]
then
echo "Parametr 3 musi być Liczbą"
exit 4
fi
mkdir "Kartki Świąteczne" "Pozostałe" "Prace domowe" "Zadania"
cd "Kartki Świąteczne"
mkdir Kotki Pieski
cd ../Pozostałe
mkdir "Listy zakupów" Przepisy
cd "Listy zakupów"
mkdir "Święta 2022" "Święta 2023"
cd ../..
cd Pozostałe/Przepisy
touch Lista_zakupów_2022.txt Lista_zakupów_2023.txt
echo -e "
świeża mięta
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
1 l barszczu w kartonie
">Lista_zakupów_$1.txt
mv Lista_zakupów_2022.txt ../"Listy zakupów"/"Święta 2022"
mv Lista_zakupów_2023.txt ../"Listy zakupów"/"Święta 2023"
cd ../"Listy zakupów"/"Święta $1"
egrep '[1-9]+\s(kg)\s' Lista_zakupów_$1.txt > ../"Ciężkie zakupy.txt"
cd ..
head -$2 "Ciężkie zakupy.txt" | tail -$3 > "Wybrane zakupy.txt"
indeks=`whoami`
data=`date +%Y-%m-%d`
cd ../..
tar -czf Powtórzenie_${data}_${indeks}.tar.gz Powtórzenie*
