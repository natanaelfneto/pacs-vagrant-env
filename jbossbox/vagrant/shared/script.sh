#!/bin/bash
echo 'begin of vagrant auto script';
sudo apt-get update && sudo apt-get -y upgrade;
# installing debug requirements
sudo apt-get install -y git;
sudo apt-get install -y nano;
sudo apt-get install -y w3m;
sudo apt-get install -y vim;
# installing basic jboss requiremnets
sudo apt-get install -y python-pip;
#check if java command exists
if [ `command -v java` ]; then 
    echo 'java is already installed, skipping...';
else 
    echo 'java is not yet installed, installing...';
    sudo add-apt-repository ppa:webupd8team/java;
    sudo apt-get update;
    sudo apt-get install -y openjdk-8-jdk;
fi;
echo 'end of vagrant auto script';