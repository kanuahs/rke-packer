#!/bin/sh -eux

clustername=$(printenv HOSTNAME)
user=$(printenv USER)

sed -ie 's/HOSTNAME/$clustername/g' /home/$user/cluster.yaml;
