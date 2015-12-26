#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import pynotify
import sys

if __name__ == '__main__':
    if not pynotify.init("XY"):
        sys.exit(1)

    n = pynotify.Notification("X, Y Test",
                              "This notification should point to 150, 10")
    n.set_hint("x", 150)
    n.set_hint("y", 10)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)
