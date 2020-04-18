#add user
useradd -m -s /bin/bash -U $1 -u $2 -p $(openssl passwd -1 $3)
cp -pr /home/vagrant/.ssh /home/$1/
chown -R $1:$1 /home/$1
echo "%$1 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$1