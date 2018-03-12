# This file has the information about which *.sls script will run first
# If its not in this list, it will not run on provision
base:
  '*':
    - utils
    - jboss
    - nginx
    - postgresql
    - dcm4chee
