#!/usr/bin/env bash

# Setup a Python package structure
# Call with ./setup_pkg.sh <new-package-name>

# Set behaivor
set -o errexit
# set -o xtrace

# Make sure you pass in a package name
if [ -z ${1} ] ; then
	echo "Usage: setup_pkg.sh <new-package-name>"
    exit 1
fi

if [ -z ${PACKAGE_DIR+x} ] ; then
	echo "Setup the package directory variable PACKAGE_DIR prior to running"
	exit 1
fi

if [ ! -d "${PACKAGE_DIR}" ] ; then
    mkdir ${PACKAGE_DIR}
fi

if [ -d "${PACKAGE_DIR}/$1" ] ; then
	echo "Removing existing ${PACKAGE_DIR}/$1..."
    rm -rf "${PACKAGE_DIR}/$1"
fi

mkdir ${PACKAGE_DIR}/$1
mkdir ${PACKAGE_DIR}/$1/docs

mkdir ${PACKAGE_DIR}/$1/$1
mkdir ${PACKAGE_DIR}/$1/$1/data
mkdir ${PACKAGE_DIR}/$1/$1/tmp
mkdir ${PACKAGE_DIR}/$1/$1/example

touch ${PACKAGE_DIR}/$1/CHANGES.txt
touch ${PACKAGE_DIR}/$1/LICENSE.txt
touch ${PACKAGE_DIR}/$1/MANIFEST.in
touch ${PACKAGE_DIR}/$1/setup.py
touch ${PACKAGE_DIR}/$1/$1/__init__.py

echo "New package directory ${PACKAGE_DIR}/$1 built."
