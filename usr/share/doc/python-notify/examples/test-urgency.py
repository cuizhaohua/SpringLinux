#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import pynotify
import sys

if __name__ == '__main__':
    if not pynotify.init("Urgency"):
        sys.exit(1)

    # Low Urgency
    n = pynotify.Notification("Low Urgency", "Joe signed online.")
    n.set_urgency(pynotify.URGENCY_LOW)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)


    # Normal Urgency
    n = pynotify.Notification("Normal Urgency",
                              "You have a meeting in 10 minutes.")
    n.set_urgency(pynotify.URGENCY_NORMAL)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)


    # Critical Urgency
    n = pynotify.Notification("Critical Urgency",
                              "This message will self-destruct in 10 seconds.")
    n.set_urgency(pynotify.URGENCY_CRITICAL)
    n.set_timeout(10000) # 10 seconds

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)
