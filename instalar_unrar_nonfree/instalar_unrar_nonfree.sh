#!/bin/bash

apt-get remove unrar-free

apt-get update

cd $(mktemp -d)

apt-get build-dep unrar-nonfree

apt-get source -b unrar-nonfree

dpkg -i unrar*.deb
