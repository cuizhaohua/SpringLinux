#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import pynotify
import sys
import gtk
import os

if __name__ == '__main__':
    if not pynotify.init("Images Test"):
        sys.exit(1)

    # Stock icon
    n = pynotify.Notification("Icon Test", "Testing stock icon",
                              "stock_samples")

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)

    # Image URI
    uri = "file://" + os.path.abspath(os.path.curdir) + "/applet-critical.png"
    print "Sending " + uri

    n = pynotify.Notification("Alert!", "Testing URI icons", uri)
    if not n.show():
        print "Failed to send notification"
        sys.exit(1)

    # Raw image
    n = pynotify.Notification("Raw image test",
                              "Testing sending raw pixbufs")
    helper = gtk.Button()
    icon = helper.render_icon(gtk.STOCK_DIALOG_QUESTION, gtk.ICON_SIZE_DIALOG)
    n.set_icon_from_pixbuf(icon)

    if not n.show():
        print "Failed to send notification"
        sys.exit(1)
