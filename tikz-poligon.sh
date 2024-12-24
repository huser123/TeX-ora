#!/bin/bash

echo ""
echo ""
read -p "Mi az első pont? " elso                    # Használhatóak az angol ábécé betűi, vagy számok
echo ""
read -p "Mi az utolsó pont? " mennyi                # Használhatóak az angol ábécé betűi, vagy számok
echo ""
echo ""


n=0                                                 # Az index nullázása

for i in $( eval echo {$elso..$mennyi} )            # Az első ponttól az utolsóig
do
read -p "$i koordináta? " koor1                     # A koordináták bekérése, a koordináták formátuma x,y

koor+=("${koor1}")                                  # A koordináták elmentése tömbben

(( n++ ))                                           # Az index növelése
done

echo ""
echo "==============="                              # Az adatok kiírásának elkezdése
echo ""

n=0                                                 # Az index nullázása

for i in $( eval echo {$elso..$mennyi} )            # Az első ponttól az utolsóig
do
echo "\coordinate ($i) at (${koor[$n]});"           # A koordináták felcímkézése
(( n++ ))                                           # Az index növelése
done


n=0                                                 # Az index nullázása

echo ""
echo ""
echo "\draw []"                                     # A rajz parancs kiírása

for i in $( eval echo {$elso..$mennyi} )            # Az elősőtől az utolsóig
do
# echo "($i)--"
printf "($i)--"                                     # A poligon pontjainak és szárainak kirajzolása
(( n++ ))                                           # Az index növelése
done

echo "($elso);"                                     # A poligon utolsó pontjának összekötése az elsővel
echo ""
echo ""


n=0                                                 # Az index nullázása

for i in $( eval echo {$elso..$mennyi} )            # Az első ponttól az utolsóig
do
echo "\node [] at ($i) {$i};"                       # Az indexek címkézése, üres opcionális paraméterrel a korrekcióhoz
(( n++ ))                                           # Az index növelése
done

echo ""
echo ""

#echo "\path ($koor) coordinate($i) [] node {$i};"
