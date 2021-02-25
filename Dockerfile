FROM python:3.9-alpine

#RUN apt-get -y clean all && apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
RUN apk update && apk upgrade
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pypiserver
RUN python3 -m pip install passlib
RUN mkdir /credentials
COPY htpasswd.txt credentials/htpasswd.txt
ENV SERVED_PACKAGES_DIRECTORY=/root/packages
RUN mkdir $SERVED_PACKAGES_DIRECTORY
RUN pip config set global.target $SERVED_PACKAGES_DIRECTORY

EXPOSE 8080

ENTRYPOINT ["pypi-server"]
CMD ["--disable-fallback","-P","credentials/htpasswd.txt","-a","update,download,list","-d","$SERVED_PACKAGES_DIRECTORY"]