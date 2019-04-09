#!/bin/sh -eux

# Update and upgrade
apt-get -y update
apt-get -y upgrade
apt-get -y install cryptsetup build-essential libssl-dev libreadline-dev zlib1g-dev linux-source dkms nfs-common python-minimal apt-transport-https