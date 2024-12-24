#!/bin/sh

for i in $(ls *.tex)
do

mkdir $i-mappa

cp -v $i $i-mappa/$i

cd $i-mappa

pdflatex *.tex
pdflatex *.tex
pdflatex *.tex

cd ..

done
