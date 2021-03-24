#!/bin/bash
echo "*** launching pypi-server with packages served from $SERVED_PACKAGES_DIRECTORY"
pypi-server --disable-fallback -P credentials/htpasswd.txt -a update,download -d "$SERVED_PACKAGES_DIRECTORY" "$SERVED_PACKAGES_DIRECTORY"
echo "*** this print is after the 'pypi-server' command ***"
