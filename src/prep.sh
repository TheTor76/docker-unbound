#!/bin/bash
echo "Getting root hints";
wget ftp://FTP.INTERNIC.NET/domain/named.cache -O /var/lib/unbound/root.hints

echo "Updating root anchor";
unbound-anchor -a /var/lib/unbound/root.key -v;

echo "Creating log file"
touch /var/log/unbound.log

echo "Running chown";
chown -R unbound: /var/lib/unbound/root.key /var/lib/unbound/root.hints /var/log/unbound.log /etc/unbound;

echo "Running chmod";
chmod -R 0444 /etc/unbound/*;
chmod -R 0644 /var/lib/unbound/root.key /var/lib/unbound/root.hints /var/log/unbound.log;
