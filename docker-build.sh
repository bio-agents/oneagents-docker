#!/bin/sh

# This fetches, builds and installs OpenNebula command line one agents
RELVER=5.8.5

if [ $# -gt 0 ] ; then
	RELVER="$1"
fi

set -e

apt-get update
apt-get -y dist-upgrade
apt-get -y install libxml-xpath-perl nano
apt-get clean autoclean
apt-get autoremove --yes
rm -rf /var/lib/apt/lists/*

cd /tmp
BUILDDIR="$(mktemp -d)"
cd "$BUILDDIR"

git clone --depth 1 -b release-"${RELVER}" https://github.com/OpenNebula/one.git
cd one
./install.sh -c cli
# Version 1.13.0 needs at least ruby 2.6
gem install -v '< 1.13.0' nokogiri
cd /
rm -rf "$BUILDDIR"
