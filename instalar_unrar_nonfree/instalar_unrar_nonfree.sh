#!/bin/bash

sudo apt-get remove unrar-free

sudo apt-get update

cd $(mktemp -d)

sudo apt-get build-dep unrar-nonfree

sudo apt-get source -b unrar-nonfree

sudo dpkg -i unrar*.deb
