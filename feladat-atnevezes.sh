#!/bin/bash

read -p "Mi a feladatok kiterjesztése? (pont nélkül) " kiterjesztes

#A nevek beolvasása a tömbökbe

szerda=(
"Vezetéknév_Keresztnév"
"Vezetéknév_Keresztnév"
)

kedd1=(
"Vezetéknév_Keresztnév"
"Vezetéknév_Keresztnév"
)

kedd2=(
"Vezetéknév_Keresztnév"
"Vezetéknév_Keresztnév"
)


# A szeparált mappák létrehozása

echo ""
echo "A könyvtársak létrehozása:"
echo ""

mkdir -v szerda
mkdir -v kedd1
mkdir -v kedd2


# A kész feladatok nevekhez rendelése


############ SZERDA ##########

echo ""
echo "A szerdai csapat feladatainak kiosztása:"
echo ""

szam=0

for i in $(ls *.$kiterjesztes)
do

cp -v $i szerda/${szerda[$szam]}.$kiterjesztes

#echo ${nevsor[$szam]}

(( szam++ ))

done

############ KEDD1 ##########

echo ""
echo "A keddi ELSŐ csapat feladatainak kiosztása:"
echo ""

szam=0

for i in $(ls *.$kiterjesztes)
do

cp -v $i kedd1/${kedd1[$szam]}.$kiterjesztes

#echo ${nevsor[$szam]}

(( szam++ ))

done

############ KEDD2 ##########

echo ""
echo "A keddi MÁSODIK csapat feladatainak kiosztása:"
echo ""

szam=0

for i in $(ls *.$kiterjesztes)
do

cp -v $i kedd2/${kedd2[$szam]}.$kiterjesztes

#echo ${nevsor[$szam]}

(( szam++ ))

done

#########################

echo ""
echo ""
echo ""
echo "A feladatok kiosztása elkészült!"
echo ""
echo ""
