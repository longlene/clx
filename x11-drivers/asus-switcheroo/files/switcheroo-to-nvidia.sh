#!/bin/bash
( /etc/init.d/xdm stop;
/sbin/modprobe nvidia;
/etc/init.d/switcheroo restart;
/etc/init.d/xdm start ) &	
