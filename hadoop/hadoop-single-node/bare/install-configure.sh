#!/bin/bash


# install prerequisites
sudo apt-get install ssh
sudo apt install openssh-server
sudo apt-get install rsync

# java
# need to append this to etc/hadoop-env.sh
echo JAVA_HOME=\'/usr/lib/jvm/java-8-openjdk-amd64/jre/\' >> etc/hadoop-env.sh

# hadoop-download
mkdir hadoop
cd hadoop
wget http://apache.cs.uu.nl/hadoop/common/stable/hadoop-2.9.1.tar.gz

tar -xzvf hadoop-2.9.1.tar.gz
rm -f hadoop-2.9.1.tar.gz
cd ../

# hadoop configure
cp core-site.xml hadoop/etc/hadoop/
cp hdfs-site.xml hadoop/etc/hadoop/

# setup keys
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
ssh-add id_rsa

# hdfs
hadoop/bin/hdfs namenode -format
hadoop/bin/hdfs dfs -mkdir /user
hadoop/bin/hdfs dfs -mkdir /user/${USER}

# yarn
cp mapred-site.xml hadoop/etc/hadoop/
cp yarn-site.xml hadoop/etc/hadoop/

# spark
cd hadoop
wget http://apache.proserve.nl/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz

tar -xzvf spark-2.4.0-bin-hadoop2.7.tgz
rm -f spark-2.4.0-bin-hadoop2.7.tgz
mv spark-2.4.0-bin-hadoop2.7 spark
PATH=`pwd`/spark/bin:${PATH}
cd ../

export HADOOP_CONF_DIR=`pwd`/hadoop/etc/hadoop
export SPARK_HOME=`pwd`/hadoop/spark
export LD_LIBRARY_PATH=`pwd`/hadoop/lib/native:$LD_LIBRARY_PATH

mv $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf

echo spark.master yarn >> spark/conf/spark-defaults.conf
