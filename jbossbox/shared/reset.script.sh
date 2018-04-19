#!/bin/bash

# remove all java content
sudo apt-get purge -y java*;

# remove all postgres content and disable it
sudo systemctl stop postgresql;
sudo apt-get remove -y postgresql;
sudo apt-get remove -y postgresql-contrib;

# remove pacs dir and its content
sudo rm -rf $PACS_DIR

# remove root user bashrc file and flag
sudo rm /root/sudo_bashrc.conf;
sudo rm /vagrant/shared/sudo_script.sh /root/.bashrc;

# remove postgres user bashrc file and flag
sudo rm /usr/lib/postgresql/postgres_bashrc.conf;
sudo rm /vagrant/shared/psql_script.sh /usr/lib/postgresql/.bashrc_profile;

# autoremove and clear for apt
sudo apt-get autoremove;
sudo apt-get clean;

