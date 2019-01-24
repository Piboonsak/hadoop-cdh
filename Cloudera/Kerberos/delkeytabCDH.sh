#!/bin/sh

# delete keytab
rm -rf hdfs.keytab | rm -rf yarn.keytab | rm -rf mapred.keytab
ssh hd-c1nn rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/had$
ssh hd-c2nn rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/had$
ssh hd-c1dn1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/ha$
ssh hd-c1dn2 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/ha$
ssh hd-c2dn2 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/ha$
ssh hd-c2dn1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/ha$
ssh pdi-n1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hado$

# destroy authen
kdestroy
ssh hd-c1nn kdestroy
ssh hd-c2nn kdestroy
ssh hd-c1dn1 kdestroy
ssh hd-c1dn2 kdestroy
ssh hd-c2dn2 kdestroy
ssh hd-c2dn1 kdestroy
ssh pdi-n1 kdestroy
ssh hd-c1nn sudo -u hdfs kdestroy