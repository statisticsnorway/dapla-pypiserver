FROM python:3.9-alpine

USER root
#RUN apt-get -y clean all && apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
RUN apk update && apk upgrade
RUN apk add --no-cache --upgrade bash
RUN apk add bash-doc bash-completion
RUN apk add util-linux pciutils usbutils coreutils binutils findutils grep
RUN python3 -m pip install --upgrade pip wheel setuptools
RUN python3 -m pip install pypiserver
RUN python3 -m pip install passlib
RUN mkdir /credentials
COPY htpasswd.txt credentials/htpasswd.txt
COPY entrypoint.sh /entrypoint.sh
COPY Packages.txt /packages.txt
ENV SERVED_PACKAGES_DIRECTORY=/root/packages
RUN mkdir $SERVED_PACKAGES_DIRECTORY
RUN echo "" > $SERVED_PACKAGES_DIRECTORY/__init__.py
RUN export PYTHONPATH="${PYTHONPATH}:$SERVED_PACKAGES_DIRECTORY"
#RUN pip config set global.target $SERVED_PACKAGES_DIRECTORY
RUN echo "*** 'python3 -m pip download'-ing all Python packages in '/packages.txt' to the directory '$SERVED_PACKAGES_DIRECTORY' . . . ***"
RUN while read -r in; do python3 -m pip download -d "$SERVED_PACKAGES_DIRECTORY" "$in"; done < "/packages.txt"
RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/bin/bash", "/entrypoint.sh"]
