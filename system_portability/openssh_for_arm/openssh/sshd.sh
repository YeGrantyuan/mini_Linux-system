#!/bin/sh 

APP=ssd
SERVER=sshd server...
App_DIR="/usr/local/sbin/sshd"


usage() {
	echo "Usage: `basename $0` <start/staop/restart>"
	exit 1
}

start() {
	echo "Starting $SERVER"
	$App_DIR
}

stop() {}

