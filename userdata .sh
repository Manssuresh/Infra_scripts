#!/bin/bash
#Install apache
yum install httpd -y
systemctl start httpd
systemctl enable httpd
#Install nginx
#!/bin/bash
yum install nginx -y
systemctl start nginx
systemctl enable nginx
cd /tmp
wget https://www.free-css.com/assets/files/free-css-templates/download/page292/simply-amazed.zip
unzip simply-amazed.zip
rm -rf simply-amazed.zip 
cd 2123_simply_amazed
#backslash before cp tp avoid prompt for overwrite
\cp -rf * /usr/share//nginx/html/
#INSTALL JAVA
#!/bin/bash
yum install java -y
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



