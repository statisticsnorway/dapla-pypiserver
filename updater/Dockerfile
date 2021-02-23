FROM python3.9-apline

#RUN apt-get -y clean all && apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
RUN apk update && apk upgrade
RUN pip install pypi-uploader
COPY ../Packages.txt packages.txt
COPY upload.sh upload.sh
CMD ["./upload.sh", "packages.txt"]