#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import gobject
import gtk
import gtk.gdk
import pynotify
import sys
import random

exposed_signal_id = 0
count = 0

def handle_closed(n):
    print "Closing."

def emit_notification(x, y):
    n = pynotify.Notification("X, Y Test",
        "This notification should point to %d, %d." % (x, y))
    n.set_hint("x", x)
    n.set_hint("y", y)
    n.connect('closed', handle_closed)
    n.show()

def popup_random_bubble():
    display = gtk.gdk.display_get_default()
    screen = display.get_default_screen()
    screen_x2 = screen.get_width() - 1
    screen_y2 = screen.get_height() - 1

    x = random.randint(0, screen_x2)
    y = random.randint(0, screen_y2)
    emit_notification(x, y)
    return True


if __name__ == '__main__':
    if not pynotify.init("XY Stress"):
        sys.exit(1)

    gobject.timeout_add(1000, popup_random_bubble)

    gtk.main()
