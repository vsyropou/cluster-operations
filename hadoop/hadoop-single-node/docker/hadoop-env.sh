
export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_RESOURCEMANAGER_USER=root
export YARN_NODEMANAGER_USER=root

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
export HADOOP_HOME=/workdir/hadoop
export HADOOP_COMMON_HOME=/workdir/hadoop
export HADOOP_HDFS_HOME=/workdir/hadoop
export HADOOP_MAPRED_HOME=/workdir/hadoop
export HADOOP_YARN_HOME=/workdir/hadoop
export HADOOP_CONF_DIR=/workdir/hadoop/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
export SPARK_HOME=/workdir/hadoop/spark

export PATH=/workdir/hadoop/bin:/workdir/hadoop/sbin:$PATH
export PATH=/workdir/hadoop/spark/bin:$PATH

export LD_LIBRARY_PATH=/workdir/hadoop/lib/native:$LD_LIBRARY_PATH
