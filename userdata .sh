#!/bin/bash
#Install apache
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo apache >> /etc/hostname
hostnamectl set-hostname apache
#Install nginx
#!/bin/bash
yum install nginx -y
systemctl start nginx
systemctl enable nginx
echo nginx >> /etc/hostname
hostnamectl set-hostname nginx
cd /tmp
wget https://www.free-css.com/assets/files/free-css-templates/download/page292/simply-amazed.zip
unzip simply-amazed.zip
rm -rf simply-amazed.zip 
cd 2123_simply_amazed
#backslash before cp tp avoid prompt for overwrite
\cp -rf * /usr/share/nginx/html/nginx

#INSTALL TOMCAT
#!/bin/bash
yum install java -y
echo tomcat >> /etc/hostname
hostnamectl set-hostname tomcat
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76-windows-x64.zip
unzip apache-tomcat-9.0.76-windows-x64.zip
rm -rf apache-tomcat-9.0.76-windows-x64.zip
mv apache-tomcat-9.0.76 tomcat9
cd tomcat9/bin
chmod 744 catalina.sh
chmod 744 startup.sh
sh startup.sh
cd /tmp
wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/10g/r3/cluster/session_state/files/shoppingcart.zip
unzip shoppingcart.zip
cp shoppingcart.war /opt/tomcat9/webapps


#INSTALL JENKINS

#!/bin/bash
echo jenkins > /etc/hostname
hostnamectl set-hostname jenkins
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo dnf install java-11-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
yum install git -y

#INSTALL maven
#!/bin/bash
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
tar -xzvf apache-maven-3.8.8-bin.tar.gz
rm -rf apache-maven-3.8.8-bin.tar.gz
mv apache-maven-3.8.8 maven 
ln -s /opt/maven/bin/mvn /usr/bin/mvn


#INSTALL docker
#!/bin/bash
yum install docker -y
systemctl start docker
systemctl enable docker
#DOCKER COMPOSE
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compos
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version


#INSTALL TERRAFORM
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#INSTALL kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#INSTALL aws-iam-authenticator
curl -Lo aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.9/aws-iam-authenticator_0.5.9_linux_amd64
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

