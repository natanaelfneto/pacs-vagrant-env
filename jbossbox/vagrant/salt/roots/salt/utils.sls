# This *.sls script contains common tools for development
# It does not reqiure extra information
# pkg tag means "install via package mananer with this name"

htop:
  pkg:
    - installed

vim:
  pkg:
    - installed

nano:
  pkg:
    - installed

git:
  pkg:
    - installed

w3m:
  pkg:
    - w3m

curl:
  pkg:
    - curl
