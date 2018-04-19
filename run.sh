(cd ./jbossbox; vagrant halt --force;);
vboxmanage hostonlyif remove vboxnet1
vboxmanage hostonlyif remove vboxnet0
boxmanage hostonlyif create
vboxmanage hostonlyif ipconfig --ip 192.168.68.8 vboxnet0
vagrant global-status
(cd ./jbossbox/; vagrant up --provision;);