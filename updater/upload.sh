#!/bin/bash
pip install pypi-uploader
while read -r in; do pypiupload packages -i "$PYPISERVER_ADDRESS" -u "$PYPISERVER_USERNAME" -p "$PYPISERVER_PASSWORD" "$in"; done < "$1"
