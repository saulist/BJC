#!/usr/bin/env python3

import re

line = '2 Corinthiens 13'

if re.search(r'^(\d\s)?[A-Za-z]+\s\d+', line) :
    bname = line.split(' ')
    bname = bname[0]+' '+bname[1]
    print('regex ok')
    print(bname)
else :
    line = line.split(' ',1)
    bname = line[0]
    print('regex nok')
