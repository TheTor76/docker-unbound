#!/usr/bin/env bash

echo "Updating root anchor";
/update-key.sh;

echo "Starting Unbound";
/usr/sbin/unbound -d -c /etc/unbound/unbound.conf;
