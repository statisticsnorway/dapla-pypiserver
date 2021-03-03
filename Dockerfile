FROM jupyter/all-spark-notebook:95ccda3619d0 as package-dowloader

USER jovyan
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pypi-uploader
USER root
RUN apt update && \
    apt-get -y clean all && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get install --no-install-recommends -y openssh-client r-cran-rglpk glpk-utils libglpk-dev libpoppler-cpp-dev \
    zlib1g-dev libgit2-dev libtesseract-dev libleptonica-dev && \
    rm -rf /var/lib/apt/lists/*
COPY Packages.txt /packages.txt
ENV SERVED_PACKAGES_DIRECTORY=/Users/jovyan/packages
RUN mkdir $SERVED_PACKAGES_DIRECTORY
USER jovyan
RUN echo "" > $SERVED_PACKAGES_DIRECTORY/__init__.py
RUN export PYTHONPATH="${PYTHONPATH}:$SERVED_PACKAGES_DIRECTORY"
RUN echo "*** 'python3 -m pip download'-ing all Python packages in '/packages.txt' to the directory '$SERVED_PACKAGES_DIRECTORY' . . . ***"
RUN while read -r in; do python3 -m pip download -d "$SERVED_PACKAGES_DIRECTORY" "$in"; done < "/packages.txt"

FROM python:3.9-alpine

USER root
#RUN apt-get -y clean all && apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
RUN apk update && apk upgrade
RUN apk add make automake gcc g++ subversion python3-dev
RUN apk add --no-cache --upgrade bash
RUN apk add bash-doc bash-completion
RUN apk add util-linux pciutils usbutils coreutils binutils findutils grep
RUN apk --update --upgrade add gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf-dev
RUN apk add libxml2 libxslt
RUN apk add geos geos-dev
RUN apk add gdal gdal-dev
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
COPY --from=package-dowloader /Users/jovyan/packages $SERVED_PACKAGES_DIRECTORY
RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/bin/bash", "/entrypoint.sh"]
