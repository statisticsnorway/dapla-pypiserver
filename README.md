# Dapla PyPiServer

A `pypiserver` instance with password protection on uploads and downloads. Only packages on this server should be downloadable from JupyterLab instances.

The `dapla-pypiserver-updater`(https://github.com/statisticsnorway/dapla-pypiserver-updater) retrieves whitelisted packages (whitelist found in updater repo) from PyPI, and uploads them to this pypiserver. Go to the updater repo to make requests to add packages or specific versions to the whitelist.

When a user of JupyterLab wants to install a new Python package, or a specific version of a Python package, they can use a terminal window or a bash script to execute standard `pip` commands:
- `pip search <package-name>` to list all available versions of a package. 
- `pip install <package-name>` to install the latest available version of a package. 
- `pip install <package-name>==<version>` to install a specific version of a package. 
- `pip install --upgrade <package-name>` to upgrade an already installed package to the latest version. 
- `pip install --upgrade <package-name>==<version>` to upgrade an already installed package to a specific version. 
