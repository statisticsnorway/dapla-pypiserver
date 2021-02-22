FROM python

RUN pip install pypi-uploader
COPY ../Packages.txt packages.txt
COPY upload.sh upload.sh
CMD ["./upload.sh", "packages.txt"]