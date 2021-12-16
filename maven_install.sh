#!/bin/bash
apt update
apt install openjdk-8-jdk -y

mvn_file="apache-maven-3.8.4-bin.tar.gz"
cur_mvn_dir=$(echo $mvn_file | awk -F "-" '{print $1"-"$2"-"$3}')
new_mvn_dir=$(echo $mvn_file | awk -F "[-.]" '{print $2$3$4$5}')

wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/$mvn_file -P /opt
tar -zxvf /opt/$mvn_file -C /opt
mv /opt/$cur_mvn_dir /opt/$new_mvn_dir

cat >> /etc/profile <<- paths
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
M2_HOME=/opt/$new_mvn_dir
M2=/opt/$new_mvn_dir/bin
export PATH=\$PATH:\$JAVA_HOME:\$M2:\$M2_HOME
paths

source /etc/profile