sudo rm -rf ~/.ipfs

ipfs init
echo -e "/key/swarm/psk/1.0.0/\n/base16/\n91103cdcf9bb04dd3ff511859f447e53eb6f9a667774d9a28460ef1900bef812" > ~/.ipfs/swarm.key
ipfs bootstrap rm --all
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

