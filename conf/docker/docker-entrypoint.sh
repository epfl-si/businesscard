#!/usr/bin/env bash
###############################################################
# Get tequila certificate fingerprint
###############################################################
export TEQUILA_FINGERPRINT=`openssl s_client -connect $TEQUILA_HOST:443 < /dev/null 2>/dev/null | openssl x509 -fingerprint -noout -in /dev/stdin | sed "s/ Fingerprint=/$/g" | sed "s/SHA1/sha1/g"`

###############################################################
# Substitute env vars in config files
###############################################################
envsubst < "/home/dinfo/tequila.conf" > "/tmp/tequila.conf"
cat /tmp/tequila.conf > /etc/tequila.conf
envsubst < "/home/dinfo/25-businesscard.epfl.ch.conf" > "/tmp/apache.conf"
cat /tmp/apache.conf > /etc/apache2/sites-available/25-businesscard.epfl.ch.conf

apachectl -e debug -D FOREGROUND