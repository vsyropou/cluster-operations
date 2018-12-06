#!/bin/bash

export HADOOP_HOME=/workdir/hadoop

echo -e "\n"

$HADOOP_HOME/sbin/start-dfs.sh

echo -e "\n"

$HADOOP_HOME/sbin/start-yarn.sh

echo -e "\n"

$HADOOP_HOME/bin/hdfs dfs -mkdir /spark-logs

echo -e "\n"

$HADOOP_HOME/spark/sbin/start-history-server.sh
