#!/bin/bash

# author： mengchenyun
# date  :  2017-01-09

#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz"
sudo mkdir /usr/lib/jvm
sudo tar -zxvf jdk-8u111-linux-x64.tar.gz -C /usr/lib/jvm
echo "#set oracle jdk environment" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_111" >> ~/.bashrc  ## 这里要注意目录要换成自己解压的jdk 目录
echo "export JRE_HOME=${JAVA_HOME}/jre" >> ~/.bashrc
echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> ~/.bashrc
echo "export PATH=${JAVA_HOME}/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_111/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_111/bin/javac 300
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.8.0_111/bin/jar 300
sudo update-alternatives --install /usr/bin/javah javah /usr/lib/jvm/jdk1.8.0_111/bin/javah 300
sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/jdk1.8.0_111/bin/javap 300
java -version
