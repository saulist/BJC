#!/bin/bash

sed -i 's/ "/ «~/g' ../tex/bjc_2014/*.tex
sed -i 's/" /~» /g' ../tex/bjc_2014/*.tex
sed -i 's/ ~"/ «~/g' ../tex/bjc_2014/*.tex
sed -i 's/",/~»,/g' ../tex/bjc_2014/*.tex
sed -i 's/"~/~»/g' ../tex/bjc_2014/*.tex
sed -i 's/"\./~»\./g' ../tex/bjc_2014/*.tex
sed -i 's/\["/\[«~/g' ../tex/bjc_2014/*.tex
sed -i 's/"\]/~»\]/g' ../tex/bjc_2014/*.tex
sed -i 's/ ~/ «~/g' ../tex/bjc_2014/*.tex
sed -i 's/~ /~» /g' ../tex/bjc_2014/*.tex
sed -i 's/~\./~»\./g' ../tex/bjc_2014/*.tex
sed -i 's/~,/~»,/g' ../tex/bjc_2014/*.tex
sed -i 's/« /«~/g' ../tex/bjc_2014/*.tex
sed -i 's/ »/~»/g' ../tex/bjc_2014/*.tex
sed -i 's/{~/{«~/g' ../tex/bjc_2014/*.tex
sed -i 's/~}/~»}/g' ../tex/bjc_2014/*.tex
sed -i 's/\(~/\(«~/g' ../tex/bjc_2014/*.tex
sed -i 's/~\)/~»\)/g' ../tex/bjc_2014/*.tex

