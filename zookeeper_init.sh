#!/bin/bash

# author： mengchenyun
# date  :  2017-01-09

# $1 路径后缀
# $2 ip1
# $3 ip2
# $4 ip3
num=$1
ip1=$2
ip2=$3
ip3=$4

rm zookeeper-3.4.6.tar.gz
wget http://apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -zxvf zookeeper-3.4.6.tar.gz -C /usr/local
echo "finish unzip zookeeper"
cd /usr/local
echo "enter /usr/local"


mv zookeeper-3.4.6 zookeeper-3.4.6_$num
echo "rename to zookeeper-3.4.6_$num"
cd zookeeper-3.4.6_$num
echo "zookeeper-3.4.6_$num"

mkdir data
mkdir logs
cd conf
touch zoo.cfg
echo "edit zoo.cfg"
echo "tickTime=2000" >> zoo.cfg
echo "initLimit=10" >> zoo.cfg
echo "syncLimit=5" >> zoo.cfg
echo "dataDir=/usr/local/zookeeper-3.4.6_$num/data" >> zoo.cfg
echo "dataLogDir=/usr/local/zookeeper-3.4.6_$num/logs" >> zoo.cfg
echo "clientPort=2181" >> zoo.cfg
echo "server.1=$ip1:2888:3888" >> zoo.cfg
echo "server.2=$ip2:2888:3888" >> zoo.cfg
echo "server.3=$ip3:2888:3888" >> zoo.cfg
cd ../data
touch myid
echo "edit myid"
echo "$num" >> myid

echo "add alias"
echo "alias zks=\"/usr/local/zookeeper-3.4.6_$num/bin/zkServer.sh\"" >> ~/.bashrc
echo "alias zkc=\"/usr/local/zookeeper-3.4.6_$num/bin/zkCli.sh\"" >> ~/.bashrc
source ~/.bashrc
