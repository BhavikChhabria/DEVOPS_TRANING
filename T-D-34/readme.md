Activity Deploying a Kubeadm Cluster

Deploy two EC2 instances, 

T2.medium for Control Node
T2.micro for Worker Node



![alt text](<images/Screenshot from 2024-08-28 15-55-07.png>)

![alt text](<images/Screenshot from 2024-08-28 15-57-10.png>)


1. Log in to Control Node
2. Install Packages
On All Nodes (Control Plane and Workers)
Log in to the control plane node.
Create the Configuration File for containerd:

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
![alt text](<images/Screenshot from 2024-08-28 16-43-03.png>)

Load the Modules:
```
sudo modprobe overlay
sudo modprobe br_netfilter
```
Set the System Configurations for Kubernetes Networking:

![alt text](<images/Screenshot from 2024-08-28 16-43-31.png>)

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

![alt text](<images/Screenshot from 2024-08-28 16-43-48.png>)

Apply the New Settings:

sudo sysctl --system

Install containerd:

sudo apt-get update && sudo apt-get install -y containerd.io

![alt text](<images/Screenshot from 2024-08-28 16-46-13.png>)

Create the Default Configuration File for containerd:

sudo mkdir -p /etc/containerd

![alt text](<images/Screenshot from 2024-08-28 16-46-45.png>)

Generate the Default containerd Configuration and Save It:

sudo containerd config default | sudo tee /etc/containerd/config.toml

![alt text](<images/Screenshot from 2024-08-28 16-47-08.png>)

Restart containerd:

sudo systemctl restart containerd

Verify that containerd is Running:

sudo systemctl status containerd

![alt text](<images/Screenshot from 2024-08-28 16-48-01.png>)

Disable Swap:

sudo swapoff -a

![alt text](<images/Screenshot from 2024-08-28 16-48-18.png>)

Install Dependency Packages:

sudo apt-get update && sudo apt-get install -y apt-transport-https curl

![alt text](<images/Screenshot from 2024-08-28 16-48-41.png>)

Download and Add the GPG Key:

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.27/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

![alt text](<images/Screenshot from 2024-08-28 16-48-57.png>)

Add Kubernetes to the Repository List:

cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.27/deb/ /
EOF



Update the Package Listings:

sudo apt-get update

Install Kubernetes Packages:

sudo apt-get install -y kubelet kubeadm kubectl
Note: If you encounter a dpkg lock message, wait a minute or two and try again.
Turn Off Automatic Updates:

![alt text](<images/Screenshot from 2024-08-28 16-49-47.png>)

sudo apt-mark hold kubelet kubeadm kubectl

![alt text](<images/Screenshot from 2024-08-28 16-56-04.png>)

Log in to Both Worker Nodes and Repeat the Above Steps.
3. Initialize the Cluster
On the Control Plane Node, Initialize the Kubernetes Cluster:

sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.27.11

![alt text](<images/Screenshot from 2024-08-28 16-58-21.png>)

Set kubectl Access:

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

Test Access to the Cluster:

kubectl get nodes
4. Install the Calico Network Add-On
On the Control Plane Node, Install Calico Networking:

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

![alt text](<images/Screenshot from 2024-08-28 16-59-57.png>)

Check the Status of the Control Plane Node:

kubectl get nodes

![alt text](<images/Screenshot from 2024-08-28 17-02-56.png>)

5. Join the Worker Nodes to the Cluster
On the Control Plane Node, Create the Token and Copy the Join Command:

kubeadm token create --print-join-command
Note: Copy the full output starting with kubeadm join.
On Each Worker Node, Paste the Full Join Command:

sudo kubeadm join…

On the Control Plane Node, View the Cluster Status:

kubectl get nodes
Note: You may need to wait a few moments for all nodes to become ready.

![alt text](<images/Screenshot from 2024-08-29 10-16-59.png>)

