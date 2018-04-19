(cd ./jbossbox; vagrant halt --force;);
vboxmanage hostonlyif remove vboxnet1
vboxmanage hostonlyif remove vboxnet0
vboxmanage hostonlyif create
sudo ip link set vboxnet0 up
ifconfig vboxnet0 192.168.68.8 netmask 255.255.255.0 up
vagrant global-status
(cd ./jbossbox/; vagrant up --provision;);