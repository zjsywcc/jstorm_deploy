#!/bin/bash

# author： mengchenyun
# date  :  2017-01-10

# wget "http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz"
# num start with 0
num=$1
ip1=$2
ip2=$3
ip3=$4
ips=($ip1 $ip2 $ip3)

tar -zxvf kafka_2.11-0.9.0.1.tgz -C /usr/local/
mkdir /usr/local/kafka_2.11-0.9.0.1/kafka-logs
cd /usr/local/kafka_2.11-0.9.0.1/config/

cp server.properties server_bak.properties
sed -i "s/broker.id=0/broker.id=$num/g" server.properties
sed -i "s/#advertised.host.name=<hostname routable by clients>/advertised.host.name=${ips[$num]}/g" server.properties
sed -i "s/log.dirs=\/tmp\/kafka-logs/log.dirs=\/usr\/local\/kafka_2.11-0.9.0.1\/kafka-logs/g" server.properties
sed -i "s/zookeeper.connect=localhost:2181/zookeeper.connect=$ip1:2181,$ip2:2181,$ip3:2181/g" server.properties

cp consumer.properties consumer_bak.properties
sed -i "s/zookeeper.connect=127.0.0.1:2181/zookeeper.connect=$ip1:2181,$ip2:2181,$ip3:2181/g" consumer.properties

cp producer.properties producer_bak.properties
sed -i "s/metadata.broker.list=localhost:9092/metadata.broker.list=$ip1:9092,$ip2:9092,$ip3:9092/g" producer.properties

cp zookeeper.properties zookeeper_bak.properties
echo "initLimit=5" > zookeeper.properties
echo "syncLimit=2" >> zookeeper.properties
echo "server.1=$ip1:2888:3888" >> zookeeper.properties
echo "server.2=$ip2:2888:3888" >> zookeeper.properties
echo "server.3=$ip3:2888:3888" >> zookeeper.properties
echo "clientPort=2181" >> zookeeper.properties
echo "maxClientCnxns=0" >> zookeeper.properties
echo "dataDir=/tmp/zookeeper" >> zookeeper.properties

echo "add alias"
echo "alias kafb='nohup  /usr/local/kafka_2.11-0.9.0.1/bin/kafka-server-start.sh /usr/local/kafka_2.11-0.9.0.1/config/server.properties & jps'" >> ~/.bashrc
echo "alias kafe='nohup /usr/local/kafka_2.11-0.9.0.1/bin/kafka-server-stop.sh /usr/local/kafka_2.11-0.9.0.1/config/server.properties & jps'" >> ~/.bashrc
echo "alias kaft='/usr/local/kafka_2.11-0.9.0.1/bin/kafka-topics.sh'" >> ~/.bashrc
echo "alias kafcp='/usr/local/kafka_2.11-0.9.0.1/bin/kafka-console-producer.sh'" >> ~/.bashrc
echo "alias kafcc='/usr/local/kafka_2.11-0.9.0.1/bin/kafka-console-consumer.sh'" >> ~/.bashrc
