# This *.sls script contains common tools for development
# It does not reqiure extra information
# pkg tag means "install via package mananer with this name"

htop:
  pkg:
    - htop

vim:
  pkg:
    - vim

nano:
  pkg:
    - nano

git:
  pkg:
    - git

w3m:
  pkg:
    - w3m

curl:
  pkg:
    - curl
