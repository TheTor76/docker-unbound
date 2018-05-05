#!/usr/bin/env bash

echo "Updating root anchor";
/update-key.sh;

if [ ! -f /var/log/unbound.log ]; then
  echo "Creating log file";
  touch /var/log/unbound.log;
  chown -R unbound: /var/log/unbound.log;
fi

echo "Starting Unbound";
/usr/sbin/unbound -d -c /etc/unbound/unbound.conf;

echo "Unbound Exited";
