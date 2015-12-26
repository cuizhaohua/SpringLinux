#!/bin/sh
ICAROOT=/opt/Citrix/ICAClient 
export ICAROOT
$ICAROOT/wfica -associate -fileparam $1
