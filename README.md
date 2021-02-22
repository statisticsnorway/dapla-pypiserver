# Dapla PyPiServer

The `server` is a `pypiserver` instance with password protection on uploads. Only packages on this server should be downloadable from JupyterLab.

The `updater` reads the `Packages` file, gets those packages from PyPI, and uploads them to the `server`.

When a user of JupyterLab wants to request a new Python package, or a specific version of a Python package, they can make a pull request to the `Packages` list adding a new line.
