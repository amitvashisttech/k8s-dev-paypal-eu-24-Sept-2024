#!/bin/bash

echo "******************** Installing CRIO ***********************"

apt-get update
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

swapoff -a

# Create the .conf file to load the modules at bootup
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF


sudo modprobe overlay
sudo modprobe br_netfilter


# Set up required sysctl params, these persist across reboots.
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward         = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system


OS=xUbuntu_20.04
VERSION=1.23

# Add Kubic Repo
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" | \
sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list


# Import Public Key
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | \
sudo apt-key add -


# Add CRI Repo
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" | \
sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list


# Import Public Key
curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | \
sudo apt-key add -




sudo apt update
sudo apt install cri-o cri-o-runc cri-tools -y

sudo systemctl enable crio.service
sudo systemctl start crio.service
sudo crictl info



echo "******************** Installing kubernetes *********************"


sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list



sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl



echo "******************* Deploying kubernetes ***********************"

# Fix Me - Update the "apiserver-advertise-address" with your master node ip.
#kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address="" --cri-socket unix://var/run/crio/crio.sock
#export KUBECONFIG=/etc/kubernetes/admin.conf


sleep 1 

#echo "******************* Deploying kubernetes - Calico Network ***********************"
#kubectl  apply -f calico.yaml





#kubectl apply -f calico.yaml
#kubectl apply -f https://docs.projectcalico.org/archive/v3.13/manifests/calico.yaml

#kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# DigitalOcean without firewall (IP-in-IP allowed) - or any other cloud / on-prem that supports IP-in-IP traffic
# kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
# kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml


# DigitalOcean with firewall (VxLAN with Flannel) - could be resolved in the future by allowing IP-in-IP in the firewall settings
#kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
#kuGbectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/canal/canal.yaml

#kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
#kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

