#!/bin/bash
echo "*** pwd ***"
pwd
echo "*** ls ***"
ls
#echo "*** upgrade pip ***"
#python3 -m pip install --upgrade pip
#echo "*** 'python3 -m pip download'-ing all Python packages in '/packages.txt' to the directory '$SERVED_PACKAGES_DIRECTORY' . . . ***"
#while read -r in; do python3 -m pip download -d "$SERVED_PACKAGES_DIRECTORY" "$in"; done < "/packages.txt"
#echo "*** launching pypi-server, serving packages from '$SERVED_PACKAGES_DIRECTORY' . . . ***"
pypi-server --disable-fallback -P credentials/htpasswd.txt -a update,download -d "$SERVED_PACKAGES_DIRECTORY"
echo "*** pypi-server launched! ***"
