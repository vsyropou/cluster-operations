#!/bin/bash


# NameNode and DataNode deamons
hadoop/sbin/start-dfs.sh

hadoop/sbin/start-yarn.sh

# test
hadoop/bin/hdfs dfs -put etc/hadoop input

hadoop/bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.9.1.jar grep input output 'dfs[a-z.]+'

${HADOOP_HOME}/bin/yarn jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.9.1.jar pi 16 1000

${HADOOP_HOME}/spark/bin/spark-submit --deploy-mode cluster --class org.apache.spark.examples.SparkPi ${HADOOP_HOME}/spark/examples/jars/spark-examples_2.11-2.4.0.jar 10

