#!/bin/bash


echo ""
echo ""
read -p "Mi a fájl neve? " fajl                     # A fájl nevének megadása
echo ""                                             
read -p "Segédrács legmagasabb pontja? " racs       # A segédrács -1,-1-ből indul. Formátuma: x,y
echo ""
read -p "Mi az első pont? " elso                    # Használhatóak az angol ábécé betűi, vagy számok
echo ""
read -p "Mi az utolsó pont? " mennyi                # Használhatóak az angol ábécé betűi, vagy számok
echo ""
echo ""


n=0                                                 # Az index nullázása

for i in $( eval echo {$elso..$mennyi} )            # Az első ponttól az utolsóig
do
read -p "$i koordináta? " koor1                     # A koordináták beolvasása

koor+=("${koor1}")                                  # A koordináták elmentése tömbben

(( n++ ))                                           # Az index csökkentése
done

# A fajl kigeneralasa


echo '''\documentclass[10pt,a4paper]{article}
\usepackage[utf8]{inputenc}
\usepackage[magyar]{babel}
\usepackage[T1]{fontenc}
\usepackage{tikz}
\usepackage{pdflscape}
\usepackage[left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}
\pagenumbering{gobble} 

\begin{document}

\begin{center}
{\Huge \textbf{FELADAT}}
\end{center}

\vspace{0.5cm}

\input{00_leiras.txt}

\newpage
\begin{landscape}
\begin{center}
\begin{tikzpicture}[scale=1] ''' >> $fajl.tex

echo "\draw [help lines, black!20] (-1,-1) grid ($racs);" >> $fajl.tex      # A segédrács beírása



n=0                                                         # Az index nullázása

for i in $( eval echo {$elso..$mennyi} )                    # Az első ponttól az utolsóig
do
echo "\coordinate ($i) at (${koor[$n]});" >> $fajl.tex      # Megcímkézni a koordinátákat
(( n++ ))                                                   # Az index növelése
done


n=0                                                         # Az index nullázása

echo "" >> $fajl.tex                                        # üres sorok bevitele
echo "" >> $fajl.tex
echo "\draw []" >> $fajl.tex                                # A rajzolás megkezdésének beírása

for i in $( eval echo {$elso..$mennyi} )                    # Az első ponttól az utolsóig
do
# echo "($i)--"                                             
printf "($i)--" >> $fajl.tex                                # Rajzolja be a poligont - pontjait és a köztük lévő vonalat
(( n++ ))                                                   # Az index növelése
done

echo "($elso);" >> $fajl.tex                                # A poligon utolsó pontjának összekötése az elsővel

n=0                                                         # Az index növelése

for i in $( eval echo {$elso..$mennyi} )                    # Az első ponttól az utolsóig
do                                                          
echo "\node [] at ($i) {$i};" >> $fajl.tex                  # A címkék kiírása a pontokhoz, üres opcionális paraméterrel a korrekcióhoz
(( n++ ))                                                   # Az index növelése
done

# A fájl beírásának folytatása

echo '''\end{tikzpicture}
\end{center}
\end{landscape}
\newpage
\begin{tikzpicture}[scale=2,xscale=1.2]
\draw [help lines, black!10] (-1,-1) grid (6,11);

\path (0,0) coordinate(A) [below] node {A};
\path (0,10) coordinate(B) [above] node {B};
\path (2,10) coordinate(C) [above] node {C};
\path (0,6) coordinate(D) [left] node {D};
\path (2,6) coordinate(E) [above] node {E};
\path (2,0) coordinate(F) [below] node {F};
\path (1,9) coordinate(G) [left] node {G};
\path (1,7) coordinate(H) [below] node {H};
\path (1,5) coordinate(I) [above] node {I};
\path (1,1) coordinate(J) [left] node {J};
\path (2,5) coordinate(K) [above] node {K};
\path (2,1) coordinate(L) [below] node {L};
\path (2,9) coordinate(M) [above] node {M};
\path (2,7) coordinate(N) [below] node {N};

\draw (F)--(A)--(B)--(C);
\draw (D)--(E);
\draw (L)--(J)--(I)--(K);
\draw (N)--(H)--(G)--(M);

\draw (C) arc (90:-90:2);
\draw (M) arc (90:-90:1);

\draw (K) arc (90:-90:2);
\draw (E) arc (90:-90:3);
\end{tikzpicture}

\end{document}''' >> $fajl.tex

##### Fordítás ####

#pdflatex $fajl.tex

#rm -Rfv *.aux
#rm -Rfv *.log
#rm -Rfv *.gz

echo ""
echo "A fájl kész!"                                 # Visszajelzés a sikeres műveletekről
echo ""

