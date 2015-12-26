#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import gtk
import pynotify
import sys

def default_cb(n, action):
    assert action == "default"
    print "You clicked the default action"
    n.close()
    gtk.main_quit()

if __name__ == '__main__':
    if not pynotify.init("Default Action Test"):
        sys.exit(1)

    n = pynotify.Notification("Matt is online")
    n.set_category("presence.online")
    n.add_action("default", "Default Action", default_cb)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)

    gtk.main()
