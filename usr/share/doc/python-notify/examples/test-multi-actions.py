#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import gtk
import pynotify
import sys

def help_cb(n, action):
    assert action == "help"
    print "You clicked Help"
    n.close()
    gtk.main_quit()

def ignore_cb(n, action):
    assert action == "ignore"
    print "You clicked Ignore"
    n.close()
    gtk.main_quit()

def empty_cb(n, action):
    assert action == "empty"
    print "You clicked Empty Trash"
    n.close()
    gtk.main_quit()

if __name__ == '__main__':
    if not pynotify.init("Multi Action Test"):
        sys.exit(1)

    n = pynotify.Notification("Low disk space",
                              "You can free up some disk space by " +
                              "emptying the trash can.")
    n.set_urgency(pynotify.URGENCY_CRITICAL)
    n.set_category("device")
    n.add_action("help", "Help", help_cb)
    n.add_action("ignore", "Ignore", ignore_cb)
    n.add_action("empty", "Empty Trash", empty_cb)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)

    gtk.main()
