#!/usr/bin/env python

import pygtk
pygtk.require('2.0')
import pynotify
import sys

if __name__ == '__main__':
    if not pynotify.init("TestCaps"):
        sys.exit(1)

    info = pynotify.get_server_info()

    print "Name:         " + info["name"]
    print "Vendor:       " + info["vendor"]
    print "Version:      " + info["version"]
    print "Spec Version: " + info["spec-version"]
    print "Capabilities:"

    caps = pynotify.get_server_caps()

    if caps is None:
        print "Failed to receive server caps."
        sys.exit(1)

    for cap in caps:
        print "\t" + cap
