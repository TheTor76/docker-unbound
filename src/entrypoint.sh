#!/usr/bin/env bash
EXTRA_SCRIPT="";

while getopts s: option
do
 case "${option}"
 in
 s) EXTRA_SCRIPT=${OPTARG};;
 esac
done

if [ -f "$EXTRA_SCRIPT" ]; then
	bash $EXTRA_SCRIPT;
fi

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
