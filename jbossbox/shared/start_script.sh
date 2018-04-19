#!/bin/bash

# set bashrc file for vagrant image
echo "setting bashrc file for vagrant image...";
cp /vagrant/shared/script.sh /home/vagrant/.bashrc;
echo "...OK";

# source new bashrc file
echo "sourcing new bashrc file...";
source /home/vagrant/.bashrc;
echo "...OK";