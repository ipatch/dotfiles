#!/usr/bin/env python

# URL: https://gist.github.com/derjanb/9f6c10168e63c3dc3cf0
# TODO: NOTE:, appeared to not work with python v3.9.x

# Linux usage: ./extract_tampermonkey_script.py "/home/<USER>/.config/<BROWSER>/Default/Local Extension Settings/<EXTENSION_ID>"
#        i.e.: ./extract_tampermonkey_script.py "/home/foo/.config/google-chrome-beta/Default/Local Extension Settings/gcalenpjmijncebpfijmoaglllgpjagf"

#   Mac usage: ./extract_tampermonkey_script.py "/Users/<USER>/Library/Application Support/Google/Chrome/Default/Local Extension Settings/<EXTENSION_ID>/"

#        i.e.: ./extract_tampermonkey_script.py "/Users/foo/Library/Application Support/Google/Chrome/Default/Local Extension Settings/dhdgffkkebhmkfjojejmpbldmpobfkfo/"

import leveldb
import sys
import re
import json
import codecs

pattern = re.compile("^@source(.*)$")

db = leveldb.LevelDB(sys.argv[1:][0])

for k,v in db.RangeIter():
    m = pattern.match(k)
    if m:
        name = re.sub("[\W\b]", "_", m.groups()[0].strip())
        full_name = "%s.user.js" % name

        print "Writing to %s" % full_name

        content = json.JSONDecoder(encoding='UTF-8').decode(v)['value']

        with codecs.open(full_name, 'w', 'utf-8') as text_file:
            text_file.write(content)
