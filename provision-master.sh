# install dependencies
sh /vagrant/provision-common.sh

# initialize kubernetes
kubeadm init --apiserver-advertise-address="192.168.50.10" --apiserver-cert-extra-sans="192.168.50.10"  --node-name k8s-master --pod-network-cidr=192.168.0.0/16

# setup kube config files
mkdir -p /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
yes | cp -i /etc/kubernetes/admin.conf /vagrant/config
chown vagrant:vagrant /home/vagrant/.kube/config

# install calico
KUBECONFIG=/home/vagrant/.kube/config kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# generate join command
kubeadm token create --print-join-command > /vagrant/join-master
