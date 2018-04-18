#!/bin/bash

# begin of vagrant auto script
echo 'begin of vagrant auto script';

# updating and upgrading machine
sudo apt-get autoremove -y
sudo apt-get clean
sudo apt-get update;

# check if its the first time run of the vagrant image
echo "check if its the first time run of the vagrant image...";
if [ ! -f "/vagrant/pacs/firt_time_run" ]; then
    echo "first time run upgrade..."
    sudo apt-get -y upgrade;
    touch "/vagrant/pacs/firt_time_run";
    echo "...OK"
fi;

# installing debug requirements
sudo apt-get install -y git;
sudo apt-get install -y nano;
sudo apt-get install -y w3m;
sudo apt-get install -y vim;
sudo apt-get install -y curl;
sudo apt-get install -y zip;
sudo apt-get install -y unzip;

# installing basic jboss requiremnets
sudo apt-get install -y python-pip;

# set script common variables
if [ ! $HOME ]; then
    HOME='/home/vagrant';
fi;
ASSETS="/vagrant/shared/assets";
PACS_DIR="/vagrant/pacs";
DCM_ZIP="$ASSETS/dcm4chee-2.18.1-psql.zip";
JBOSS_ZIP="$ASSETS/jboss-4.2.3.GA.zip";

# check if java command exists
echo 'check if java command exists...';
if [ `command -v java` ]; then 
    echo 'java is already installed, skipping...';
else 
    echo 'java is not yet installed, installing...';
    sudo apt-get purge -y java*;
    sudo apt-get autoremove;
    sudo add-apt-repository ppa:webupd8team/java;
    sudo apt-get update;
    sudo apt-get install -y openjdk-8-jdk;
fi;

# check if JAVA_HOME is configured
echo 'check if JAVA_HOME is configured...';
if [ $JAVA_HOME ]; then
    printf 'JAVA_HOME points to: %s' $JAVA_HOME;
else
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk;
    export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
    printf 'setting JAVA_HOME to: %s' $JAVA_HOME;
fi;

# re-check java and JAVA_HOME with javac command line
if [ `command -v javac` ]; then
    javac -version;
else
    echo 'something went wrong on java installation or the JAVA_HOME setup...'; break; exit;
fi;

# check if shared assets is properly located
if [ ! -f "$DCM_ZIP" ]; then
    echo "dcm4chee 2.18.1 PostgreSQL file not found!";
fi;
if [ ! -f "$JBOSS_ZIP" ]; then
    echo "JBOSS 4.2.3 GA file not found!";
fi;

# check if PACS folder exists
if [ ! -d "$PACS_DIR" ]; then
    printf "creating folder for pacs at: %s" $PACS_DIR
    mkdir $PACS_DIR;
fi;
if [ ! -d "$PACS_DIR" ]; then
    echo "something prevent PACS folder from being created"; break; exit;
fi;

if [ -d "$PACS_DIR" ]; then
    if [ `command -v javac` ]; then
        # check if dcm4chee is properly located
        echo "check if dcm4chee is properly located..."    
        if [ ! -d "$PACS_DIR/dcm4chee-2.18.1-psql" ]; then
            echo "dcm4chee 2.18.1 PostgreSQL not found, fixing it...";
            unzip $DCM_ZIP -d $PACS_DIR;
            echo "...OK";
        fi;
        # check if jboss is properly located
        echo "check if jboss is properly located..."
        if [ ! -d "$PACS_DIR/jboss-4.2.3.GA" ]; then
            echo "JBOSS 4.2.3 GA not found, fixing it...";
            unzip $JBOSS_ZIP -d $PACS_DIR;
            echo "...OK";
        fi;
        # check if libclib_jiio.so file is properly located
        echo "check if libclib_jiio.so file is properly located..."
        if [ ! -f "$PACS_DIR/jboss-4.2.3.GA/libclib_jiio.so.config" ]; then
            echo "JBOSS 4.2.3 GA libclib_jiio.so file replacement not found, fixing it...";
            sudo rm "$PACS_DIR/dcm4chee-2.18.1-psql/bin/native/libclib_jiio.so";
            sudo cp "$LIB_FILE" "$PACS_DIR/dcm4chee-2.18.1-psql/bin/native/libclib_jiio.so";
            sudo touch "$PACS_DIR/jboss-4.2.3.GA/libclib_jiio.so.config";
            echo "...OK";
        fi;
        # check if JBOSS is installed
        echo "check if JBOSS is installed..."
        if [ ! -f "$PACS_DIR/jboss-4.2.3.GA/jboss_install.config" ]; then
            echo "JBOSS 4.2.3 GA installation not found, fixing it...";
            sudo sh "$PACS_DIR/dcm4chee-2.18.1-psql/bin/install_jboss.sh" "$PACS_DIR/jboss-4.2.3.GA"
            sudo touch "$PACS_DIR/jboss-4.2.3.GA/jboss_install.config";
            echo "...OK";
        fi;
    else
        printf "could not find java!\n";
    fi; # end of java check
else
    printf "could not find pacs dir!\n";
fi; # end of pacs dir check

sudo apt-get autoremove -y
sudo apt-get clean
# end of vagrant auto script
echo 'end of vagrant auto script';