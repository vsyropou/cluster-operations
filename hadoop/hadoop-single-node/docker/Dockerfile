
# base obuntu iamge
FROM ubuntu:18.04

WORKDIR /workdir

# os pacakges
RUN DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get install -y openssh-server \
	rsync openjdk-8-jre-headless ca-certificates-java \
	&& rm -rf /var/lib/apt/lists/*

# some env variables
ENV USER root
ENV HADOOP_HOME=/workdir/hadoop
ENV HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
ENV HADOOP_VERSION 2.9.1
ENV MULTIHOMED_NETWORK 1
ENV PATH ${HADOOP_HOME}/bin/:$PATH

# download
RUN wget http://apache.hippo.nl/hadoop/common/hadoop-2.9.1/hadoop-2.9.1.tar.gz \
	&& mkdir hadoop \
	&& tar -xzvf hadoop-2.9.1.tar.gz -C hadoop --strip-components 1\
	&& rm -f hadoop-2.9.1.tar.gz

RUN wget http://apache.proserve.nl/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz \
	&& mkdir -p hadoop/spark \
	&& tar -xzvf spark-2.4.0-bin-hadoop2.7.tgz -C hadoop/spark --strip-components 1 \
	&& rm -f spark-2.4.0-bin-hadoop2.7.tgz

# make keys
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
	&& cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
	&& chmod 0600 ~/.ssh/authorized_keys

# configure
ADD ssh_config /root/.ssh/config

# ADD *.xml ${HADOOP_CONF_DIR}/
ADD core-site.xml ${HADOOP_CONF_DIR}/core-site.xml
ADD hdfs-site.xml ${HADOOP_CONF_DIR}/hdfs-site.xml
ADD mapred-site.xml ${HADOOP_CONF_DIR}/mapred-site.xml
ADD yarn-site.xml ${HADOOP_CONF_DIR}/yarn-site.xml
ADD hadoop-env.sh ${HADOOP_CONF_DIR}/hadoop-env.sh
ADD spark-defaults.conf ${HADOOP_HOME}/spark/conf/spark-defaults.conf

ADD start-services.sh ${HADOOP_HOME}/start-services.sh
# ADD configure.sh ${HADOOP_HOME}/configure.sh

RUN chmod 600 /root/.ssh/config && \
    chown root:root /root/.ssh/config && \
    chmod +x ${HADOOP_CONF_DIR}/hadoop-env.sh && \
	chmod +x ${HADOOP_HOME}/start-services.sh
# && \
#    chmod +x ${HADOOP_HOME}/configure.sh

# RUN mkdir -p ~/hdfs/namenode && \
#     mkdir -p ~/hdfs/datanode && \
#     mkdir $HADOOP_HOME/logs




# ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
# RUN mkdir -p /hadoop/dfs/data
# VOLUME /hadoop/dfs/data


# prepare for launch
EXPOSE 8088 50070 18080

RUN ${HADOOP_CONF_DIR}/hadoop-env.sh

RUN ${HADOOP_HOME}/bin/hdfs namenode -format

# RUN mv ${HADOOP_CONF_DIR}/mapred-site.xml.template ${HADOOP_CONF_DIR}/mapred-site.xml 
# RUN hadoop/configure.sh

ENTRYPOINT [ "sh", "-c", "service ssh start; hadoop/start-services.sh ; bash"]

# make symplins for hadoop and spark
# hdfs to an external volume 
# try installing kafka, hue, ambari,
#       hive, hbase, storm, flink,
# 	zookeeper, pig, 
