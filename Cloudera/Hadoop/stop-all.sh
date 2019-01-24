#!/bin/sh

# 9.7) stop hue service
systemctl stop hue

# start oozie
service oozie stop

# 8.6 Stop hive service
service hive-metastore stop 
service hive-server2 stop

# stop spark
service spark-history-server stop
service spark-master stop


# On all the other nodes stop the workers:
ssh data1 service spark-worker stop
ssh data2 service spark-worker stop


# stop impala service on DataNode
ssh data1 systemctl stop impala-server
ssh data2 systemctl stop impala-server

# stop impala service on NameNode
systemctl stop impala-state-store impala-catalog impala-server

# stop hive service 
service hive-metastore stop	
service hive-server2 stop

# stop service at namenode
service hbase-rest stop
service hbase-thrift stop
service hbase-master stop

# stop hbase-regionserver at worker nodes
ssh data1 service hbase-regionserver stop
ssh data2 service hbase-regionserver stop

# stop zookeeper service
ssh data1 service zookeeper-server stop
ssh data2 service zookeeper-server stop
service zookeeper-server stop

# 4.8.2 stop At Data Nodes
ssh data2 service hadoop-yarn-nodemanager stop
ssh data1 service hadoop-yarn-nodemanager stop

# 4.8 stop YARN (MapReduce2)
# 4.8.1 At Name Node
service hadoop-yarn-resourcemanager stop
service hadoop-mapreduce-historyserver stop

# 3.8 stop service hdfs on all Data Nodes
ssh data2 service hadoop-hdfs-datanode stop
ssh data1 service hadoop-hdfs-datanode stop

# stop NameNode.
service hadoop-hdfs-namenode stop