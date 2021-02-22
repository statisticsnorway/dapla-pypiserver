FROM python

RUN pip install pypi-uploader
COPY ../Packages.txt packages.txt
COPY upload.sh upload.sh
ENV PYPISERVER_ADDRESS="$PYPI_ADDRESS"
ENV PYPISERVER_USERNAME="$PYPI_ADMIN_USERNAME"
ENV PYPISERVER_PASSWORD="$PYPI_ADMIN_PASSWORD"
CMD ["./upload.sh", "packages.txt"]