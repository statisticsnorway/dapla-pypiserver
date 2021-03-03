#!/bin/bash
echo "*** launching pypi-server with packages at $SERVED_PACKAGES_DIRECTORY"
pypi-server --disable-fallback -P credentials/htpasswd.txt -a update,download -d "$SERVED_PACKAGES_DIRECTORY"
echo "*** pypi-server launched! ***"
