#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import pynotify
import sys
import time

if __name__ == '__main__':
    if not pynotify.init("Replace Test"):
        sys.exit(1)

    n = pynotify.Notification("Summary", "First message")
    n.set_timeout(0)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)

    time.sleep(3)

    n.update("Second Summary", "First mesage was replaced")
    n.set_timeout(pynotify.EXPIRES_DEFAULT)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)
