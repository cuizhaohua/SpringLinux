#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import pynotify
import sys

if __name__ == '__main__':
    if not pynotify.init("Markup"):
        sys.exit(1)

    n = pynotify.Notification("Summary",
        "Some <b>bold</b>, <u>underlined</u>, <i>italic</i>, " +
        "<a href='http://www.google.com'>linked</a> text")

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)
