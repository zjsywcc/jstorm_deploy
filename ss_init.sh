sudo cp shadowsocks.json /home/mengchenyun
sudo apt-get install supervisor
touch /etc/supervisor/conf.d/ss.conf
echo '[program:shadowsocks]' >> /etc/supervisor/conf.d/ss.conf
echo 'command=sslocal -c /home/mengchenyun/shadowsocks.json' >> /etc/supervisor/conf.d/ss.conf
echo 'autostart=true' >> /etc/supervisor/conf.d/ss.conf
echo 'autorestart=true' >> /etc/supervisor/conf.d/ss.conf
echo 'user=root' >> /etc/supervisor/conf.d/ss.conf
echo 'log_stderr=true' >> /etc/supervisor/conf.d/ss.conf
echo 'logfile=/var/log/shadowsocks.log' >> /etc/supervisor/conf.d/ss.conf
sudo cp /usr/bin/sslocal /bin
sudo service supervisor restart
export http_proxy="http://127.0.0.1:8585/"
ps -ef|grep sslocal
