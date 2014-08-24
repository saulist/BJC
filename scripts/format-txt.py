#!/usr/bin/env python3

import re
from os import chdir
from glob import glob

# source files
src_dir = '../txt/BJC/'
chdir(src_dir)
list_files = sorted(glob('*.txt'))

# output file
out_file = '../bjc_2014.txt'
data_w = open(out_file,'w')

# browse each source files
for file_name in list_files :
    # get book name
    book_data = re.split('-|\.',file_name)
    book_num = book_data[0]
    book_name = book_data[1]
    # open and read file
    data_r = open(file_name,'r')
    list_lines = data_r.readlines()
    # browse each line of the file
    for line in list_lines :
        line = line.rstrip()
        if (re.search(r'^'+book_name+'\s(\d+)', line)) or not (re.search(r'^\d', line)) :
            line = line.split(' ')
            chapter_num = line.pop().rstrip()
        else :
            line = line.split(' ',1)
            verse_num = line[0].rstrip()
            verse_txt = line.pop().rstrip()
            data_w.write(book_num+'\t'+chapter_num+'\t'+verse_num+'\t'+verse_txt+'\n')
    data_r.close()

data_w.close()

