#!/bin/sh

set -e

if [ -z "$1" -o  "${1:0:1}" = '-' ]; then
    cd $HOME
    exec gosu default java -Djava.security.egd=file:/dev/urandom -jar lib/$SB_APP_JAR --spring.profiles.active=${SB_ACTIVE_PROFILES} "$@"
fi

exec "$@"
