#!/bin/bash

# author： mengchenyun
# date  :  2017-01-10

# wget "https://github.com/alibaba/jstorm/releases/download/2.1.1/jstorm-2.1.1.zip"
ip1=$1
ip2=$2
ip3=$3
unzip -o jstorm-2.1.1 -d /home/mengchenyun/
echo 'export JSTORM_HOME=/home/mengchenyun/jstorm-2.1.1' >> /etc/profile
echo 'PATH=$PATH:$JSTORM_HOME/bin' >> /etc/profile
cp -f /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml /home/mengchenyun/jstorm-2.1.1/conf/storm_bak.yaml
echo 'storm.zookeeper.servers:' > /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo "- \"$ip1\"" >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo "- \"$ip2\"" >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo "- \"$ip3\"" >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo "nimbus.host: \"$ip1\"" >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo "storm.zookeeper.root: \"/jstorm\"" >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo 'storm.local.dir: "%JSTORM_HOME%/data"' >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo 'supervisor.slots.ports:' >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo '- 6800' >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo '- 6801' >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo '- 6802' >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml
echo '- 6803' >> /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml

mkdir ~/.jstorm
cp -f /home/mengchenyun/jstorm-2.1.1/conf/storm.yaml ~/.jstorm
