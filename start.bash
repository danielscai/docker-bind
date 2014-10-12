#!/bin/bash

#
# start.bash
#

BIND="/etc/bind"
OVERRIDE="/bind-override"

CONFIG="named.conf"
OPTIONS="named.conf.options"
LOCAL="named.conf.local"
MINE="db.mine"

PIDFILE="/var/run/named/named.pid"

cd "$BIND"

# Symlink option file
if [[ -f "$OVERRIDE/$OPTIONS" ]]; then
  rm -fr "$OPTIONS"
  ln -s "$OVERRIDE/$OPTIONS" "$OPTIONS"
fi

# Symlink local file
if [[ -f "$OVERRIDE/$LOCAL" ]]; then
  rm -fr "$LOCAL"
  ln -s "$OVERRIDE/$LOCAL" "$LOCAL"
fi

# Symlink config file.
if [[ -f "$OVERRIDE/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$OVERRIDE/$CONFIG" "$CONFIG"
fi

# Symlink db.mine file.
if [[ -f "$OVERRIDE/$MINE" ]]; then
  rm -f "$MINE"
  ln -s "$OVERRIDE/$MINE" "$MINE"
fi

/usr/sbin/named -u bind -f
