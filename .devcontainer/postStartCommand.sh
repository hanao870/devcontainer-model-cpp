#!/bin/sh

pip install --no-cache-dir --upgrade pip
sudo pip install --no-cache-dir -r .devcontainer/devpkg_requirements.txt
pre-commit install
pre-commit install-hooks
