#!/bin/sh

# start NameNode.
service hadoop-hdfs-namenode start

# Start service hdfs on all Data Nodes
ssh data1 service hadoop-hdfs-datanode start
ssh data2 service hadoop-hdfs-datanode start

# Start YARN (MapReduce2)
# At Name Node
service hadoop-yarn-resourcemanager start
service hadoop-mapreduce-historyserver start

# At Data Nodes
ssh data1 service hadoop-yarn-nodemanager start
ssh data2 service hadoop-yarn-nodemanager start


# start zookeeper service
service zookeeper-server start
ssh data1 service zookeeper-server start
ssh data2 service zookeeper-server start

# Start service at namenode
service hbase-master restart
service hbase-thrift restart
service hbase-rest start

# Start hbase-regionserver at worker nodes
ssh data1 service hbase-regionserver start
ssh data2 service hbase-regionserver start

# Starting hive service 
service hive-metastore start	
service hive-server2 start


# Start impala service on NameNode
systemctl start impala-state-store impala-catalog impala-server

# Start impala service on DataNode
ssh data1 systemctl start impala-server
ssh data2 systemctl start impala-server

# spark
service spark-master start
service spark-history-server start

# On all the other nodes start the workers:
ssh data1 service spark-worker start
ssh data2 service spark-worker start

# start oozie
service oozie start

# start hue service
systemctl daemon-reload
systemctl start hue