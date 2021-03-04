# Dapla PyPiServer

A `pypiserver` instance with password protection on uploads and downloads. Only packages on this server should be downloadable from JupyterLab instances.

The file `Packages.txt` contains a list of packages that are downloaded and built into the pypiserver's docker image.

If you want to add a new python package (or a specific version of a package) to the pypiserver, simply create a new branch on this repository, and write the name of the package on a new line in the file Packages.txt. Then make a pull request to the main branch, and request a review from someone in the DAPLA team.

If you need a specific version of a package, simply list it like you would using the `pip install` command, so for instance `pandas==1.2.0` if you want version 1.2.0 of the pandas library.

When a user of JupyterLab wants to install a new Python package, or a specific version of a Python package, they can use a terminal window or a bash script to execute standard `pip` commands:
- `pip search <package-name>` to list all available versions of a package. 
- `pip install <package-name>` to install the latest available version of a package. 
- `pip install <package-name>==<version>` to install a specific version of a package. 
- `pip install --upgrade <package-name>` to upgrade an already installed package to the latest version. 
- `pip install --upgrade <package-name>==<version>` to upgrade an already installed package to a specific version. 
