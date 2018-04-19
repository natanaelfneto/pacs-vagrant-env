(cd ./jbossbox; vagrant halt --force;);
vboxmanage hostonlyif remove vboxnet1
vboxmanage hostonlyif remove vboxnet0
vboxmanage hostonlyif create
vagrant global-status
(cd ./jbossbox/; vagrant up --provision;);