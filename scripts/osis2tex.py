#!/usr/bin/env python3

### TESTING ###

import xml.etree.ElementTree as etree

# source file
src_file = '../osis/bjc_2014.xml'

tree = etree.parse(src_file)
root = tree.getroot()

print(root.tag)
