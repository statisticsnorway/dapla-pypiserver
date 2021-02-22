#!/bin/bash
pip install pypi-uploader
while read -r in; do pypiupload packages -i http://localhost:8080 -u admin -p slangepakkevarehus "$in"; done < ../Packages.txt
