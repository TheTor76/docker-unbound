#!/usr/bin/env bash

unbound-anchor -r /var/lib/unbound/root.hints -a /var/lib/unbound/root.key -v -f /anchor-resolv.conf;
chown unbound:unbound /var/lib/unbound/root.key;
