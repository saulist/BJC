#!/bin/bash

old_IFS=$IFS
IFS='
'

for file in $( ls ../txt/BJC/*.txt ); do
	iconv -t utf-8 $file > ${file}.utf8
	rm $file
	mv ${file}.utf8 $file
	sed -i '1s/^\xef\xbb\xbf//' $file
	sed -i 's/ / /g' $file
done

IFS=$old_IFS
