#!/bin/bash
pip install pypi-uploader
while read -r in; do pypiupload packages -i http://localhost:8080 -u "$1" -p "$2" "$in"; done < ../Packages.txt