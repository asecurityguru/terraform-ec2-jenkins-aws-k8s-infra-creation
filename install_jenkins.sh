#!/bin/bash

# Install Updated packages on linux machine
sudo yum update
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
#sudo yum install jenkins java-1.8.0-openjdk-devel -y
#sudo amazon-linux-extras install java-openjdk11
#Java 21 installed (Jenkins now requires Java 21 minimum) and old Java versions commented out
sudo dnf install java-21-amazon-corretto-devel -y
sudo yum install git -y
sudo yum install nodejs npm -y
#Maven now installed from Amazon Linux 2023 repos (old fedorapeople repo is no longer available)
sudo yum install -y maven
sudo update-alternatives --set java /usr/lib/jvm/java-21-amazon-corretto.x86_64/bin/java
sudo yum install jenkins -y
#Jenkins port set to 8081 via systemd override (newer Jenkins packages ship JENKINS_PORT commented out, so the old sed no longer works)
sudo mkdir -p /etc/systemd/system/jenkins.service.d
sudo tee /etc/systemd/system/jenkins.service.d/override.conf <<'EOF'
[Service]
Environment="JENKINS_PORT=8081"
EOF
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo yum install unzip -y
sudo unzip awscliv2.zip  
sudo ./aws/install
#ZAP is installed and can be run as zap.sh
sudo wget https://github.com/zaproxy/zaproxy/releases/download/v2.17.0/ZAP_2_17_0_unix.sh
sudo chmod +x ZAP_2_17_0_unix.sh 
sudo ./ZAP_2_17_0_unix.sh -q
#kubectl updated to v1.30 to match the EKS cluster version created in the README (old 1.23.7 is end-of-life and version-skewed)
curl -o kubectl -L https://dl.k8s.io/release/v1.30.4/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
sudo cp kubectl /usr/local/bin/
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
sudo yum install docker -y
sudo usermod -aG docker $USER
sudo newgrp docker
sudo usermod -aG docker jenkins
sudo newgrp docker
sudo service jenkins restart
sudo systemctl daemon-reload
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo yum install jq -y
