#!/usr/bin/env python3

import re
from os import chdir
from glob import glob

# files directories
src_dir = '../txt/BJC/'
out_dir = '../txt/'

# list files in source directory
chdir(src_dir)
list_files = sorted(glob('*.txt'))

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
        line = line.split(' ',1)
        if line[0] == book_name :
            chapter_num = line[1].rstrip()
        else :
            verse_num = line[0].rstrip()
            verse_txt = line[1].rstrip()
            print(book_num+'\t'+chapter_num+'\t'+verse_num+'\t'+verse_txt)
    data_r.close()

