#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import gtk
import pynotify
import sys

exposed_signal_id = 0
count = 0

def exposed_cb(button, event, n):
    global exposed_signal_id
    button.disconnect(exposed_signal_id)
    if not n.show():
        print "Failed to send notification"
        gtk.main_quit()

def clicked_cb(button, n):
    global count
    count += 1
    n.update("Widget Attachment Test",
             "You clicked the button %s times" % count)
    if not n.show():
        print "Failed to send notification"
        gtk.main_quit()


if __name__ == '__main__':
    if not pynotify.init("Replace Test"):
        sys.exit(1)

    win = gtk.Window(gtk.WINDOW_TOPLEVEL)
    win.show()
    win.connect('delete_event', gtk.main_quit)

    button = gtk.Button("Click here to change notification")
    button.show()
    win.add(button)

    n = pynotify.Notification("Widget Attachment Test",
                              "Button has not been clicked yet", None, button)
    n.set_category("presence.online")
    n.set_timeout(0)

    button.connect('clicked', clicked_cb, n)
    exposed_signal_id = button.connect('expose_event', exposed_cb, n)

    gtk.main()
