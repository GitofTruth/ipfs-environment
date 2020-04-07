

# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
apt-get install -y git

# # Apache
# apt-get install -y apache2

# # Enable Apache Mods
# a2enmod rewrite

# #Add Onrej PPA Repo
# apt-add-repository ppa:ondrej/php
# apt-get update

# # Install PHP
# apt-get install -y php7.2

# # PHP Apache Mod
# apt-get install -y libapache2-mod-php7.2

# # Restart Apache
# service apache2 restart

# # PHP Mods
# apt-get install -y php7.2-common
# apt-get install -y php7.2-mcrypt
# apt-get install -y php7.2-zip

# # Set MySQL Pass
# debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
# debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# # Install MySQL
# apt-get install -y mysql-server

# # PHP-MYSQL lib
# apt-get install -y php7.2-mysql

# # Restart Apache
# sudo service apache2 restart

# install golang
GOREL=go1.13.3.linux-amd64.tar.gz
wget -q https://dl.google.com/go/$GOREL
tar xfz $GOREL
mv go /usr/local/go
rm -f $GOREL
PATH=$PATH:/usr/local/go/bin
echo 'PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.bashrc


# IPFS
curl -LO https://dist.ipfs.io/go-ipfs/v0.4.23/go-ipfs_v0.4.23_linux-amd64.tar.gz
tar -zxvf go-ipfs_v0.4.23_linux-amd64.tar.gz
sudo mv go-ipfs/ipfs /usr/local/bin/


#add peer2 user
useradd -m -s /bin/bash -U peer2 -u 666 
cp -pr /home/vagrant/.ssh /home/peer2/
chown -R peer2:peer2 /home/peer2
echo "%peer2 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/peer2
