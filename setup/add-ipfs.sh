sudo rm -rf ~/.ipfs

ipfs init
ipfs bootstrap rm --all

sudo cp -a /var/local/swarm.key  ~/.ipfs/
ipfs config show

ipfs bootstrap add /ip4/192.168.33.10/tcp/4001/ipfs/QmdDuTgruwB19LZJsNAc3kfoJf8FBw5ZDKG2fAAWJbUUSZ

export LIBP2P_FORCE_PNET=1

sudo rm -rf /etc/systemd/system/ipfs.service

echo "[Unit]
 Description=IPFS Daemon
 After=syslog.target network.target remote-fs.target nss-lookup.target
 [Service]
 Type=simple
 ExecStart=/usr/local/bin/ipfs daemon --enable-namesys-pubsub
 User=$1
 [Install]
 WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/ipfs.service > /dev/null


sudo systemctl daemon-reload
sudo systemctl enable ipfs
sudo systemctl start ipfs
sudo systemctl status ipfs

