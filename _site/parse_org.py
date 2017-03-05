#!/usr/bin/env python

import re

next_section='^UNDERGRADUATE MENTORING'

with open('/home/ssefick/Downloads/web_page/public_html/CV.md') as infile, open('/home/ssefick/Downloads/web_page/public_html/research.md', 'w') as outfile:
    outfile.write('---\nlayout: page\ntitle: Research\npermalink: /research/\n---\n\n')
    copy = False
    for line in infile:
        if re.match('^PUBLICATIONS', line):
            copy = True
            outfile.write(line)
        elif re.match(next_section, line):
            copy = False
        elif copy:
            outfile.write(line)
            ##print line
