Cloudera Hadoop (CDH5) Cluster Setup Guide
===

*Ref: http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cdh_ig_hdfs_cluster_deploy.html?scroll=topic_11_2*

## Minimum requirement

- Name Node 3.5GB of RAM
- Data Node 1GB of RAM
- for Virtual box set Network to NAT-Network

---

## Prerapring before Install

1. Configuring Network
2. set connect automatically (ONBOOT=yes) /etc/sysconfig/network-scripts/ifcfg-enp0s3
3. set names in /etc/hosts
4. Disabling SELinux (SELINUX=disabled) at /etc/selinux/config
5. Set Firewall for allow group IP (trusted zone)
6. Enabling NTP (only for real server, VM is automatic sync from host os)

---

Additional (only in this training)
Setting NAT Network (only for vm connected in cluster)

---

## 1. Install Oracle JDK

*Do it to all node server*

`cd /root/Desktop/Hadoop/`

`tar xvf jdk-8u92-linux-x64.tar.gz -C /opt`

```
alternatives --install "/usr/bin/java" "java" "/opt/jdk1.8.0_92/bin/java" 1 \
--slave /usr/bin/javac javac /opt/jdk1.8.0_92/bin/javac \
--slave /usr/bin/javaws javaws /opt/jdk1.8.0_92/bin/javaws \
--slave /usr/bin/jar jar /opt/jdk1.8.0_92/bin/jar
```

`alternatives --config java`



---

## 2. Install Cloudera CDH repository

*you can download at http://archive.cloudera.com/cdh5/one-click-install/redhat/7/x86_64/cloudera-cdh-5-0.x86_64.rpm*

**Do it to all node server**

`rpm -ivh cloudera-cdh-5-0.x86_64.rpm`

`nano /etc/yum.repos.d/cloudera-cdh5.repo`
```
[cloudera-cdh5]
name=Cloudera's Distribution for Hadoop, Version 5
baseurl=http://namenode1/cdh/
gpgkey=http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
gpgcheck=0
```

### Set JAVA_HOME under /etc/default/bigtop-utils 

- if have problem when you can't run datanode. 

```


```

2.1.Set Hostname

`nano /etc/hosts`

```
[root@hadoop-namenodecdh ~]# nano /etc/hosts
192.168.4.4     namenode1       hadoop-namenodecdh	    hadoop-namenodecdh.novalocal
192.168.4.5	    data1   		hadoop-datanode1cdh	    hadoop-datanode1cdh.novalocal
192.168.4.6	    data2	    	hadoop-datanode2cdh	    hadoop-datanode2cdh.novalocal
```


2.1.2.Disable CentOS repository  (only in this training)

`yum-config-manager --disable CentOS-7*`
`yum repolist all`

2.2 Clone VM Image
Full Clone with reinitialize MAC Address


# After clone completed

*Not need to do this step when install on iNet cloud*

### - Verify your IP address in all nodes and set to /etc/hosts file
### - At name node, set VBox Shared Folders to cdh. after that ran below commands :-

mkdir -p /var/www/html/cdh
mount -t vboxsf cdh /var/www/html/cdh
systemctl start httpd
systemctl enable httpd

---


## 3. Install HDFS








## 4. Install MapReduce2(Yarn)


## 5. Using MapReduce (WordCount.java)




## 6. Install Pig



## 7. Install Hive


MariaDB [mysql]> `select host,user from user;`


```
CREATE USER 'root'@'%' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'root'@'%';
GRANT All ON metastore.* TO 'root'@'%';
```
```
#CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'root'@'localhost';
GRANT All ON metastore.* TO 'root'@'localhost';
```
```
CREATE USER 'root'@'namenode1' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'root'@'namenode1';
GRANT ALL ON metastore.* TO 'root'@'namenode1';
```

```
#CREATE USER 'root'@'hadoop-namenodecdh.novalocal' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'root'@'hadoop-namenodecdh.novalocal';
GRANT ALL ON metastore.* TO 'root'@'hadoop-namenodecdh.novalocal';
```
```
CREATE USER 'hive'@'hadoop-namenodecdh.novalocal' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'hive'@'hadoop-namenodecdh.novalocal';
GRANT ALL ON metastore.* TO 'hive'@'hadoop-namenodecdh.novalocal';
```

### Add file mysql  driver (.jar file) to directory /usr/share/java .


```
[root@namenode1 Hadoop]# cp -nP java/*.jar /usr/share/java/
[root@namenode1 Hadoop]# ls /usr/share/java
apache-commons-lang.jar              geronimo-jms.jar        log4j.jar                   xalan-j2-serializer.jar
apache-commons-logging-adapters.jar  geronimo-jta.jar        mysql-connector-java.jar    xerces-j2.jar
apache-commons-logging-api.jar       icedtea-web.jar         rhino-examples.jar          xml-commons-apis-ext.jar
avalon-framework-api.jar             icedtea-web-plugin.jar  rhino.jar                   xml-commons-apis.jar
avalon-framework-impl.jar            javassist.jar           tagsoup.jar                 xml-commons-resolver.jar
avalon-logkit.jar                    jline.jar               tomcat-servlet-3.0-api.jar
commons-logging.jar                  js.jar

```
- Make link from /usr/share/java/ to /usr/lib/hive/lib/
 
`ln -s /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/`

```
[root@namenode1 Hadoop]# ln -s /usr/share/java/mysql-connector-java.jar /usr/lib/hive/lib/
[root@namenode1 Hadoop]# ls -lah /usr/lib/hive/lib/
total 97M
drwxr-xr-x  4 root root 8.0K ธ.ค.  27 02:35 .
drwxr-xr-x 10 root root  177 ธ.ค.  26 10:44 ..
-rw-r--r--  1 root root 4.2M ส.ค.  24 16:23 accumulo-core-1.6.0.jar
-rw-r--r--  1 root root  31K ส.ค.  24 16:15 metrics-jvm-3.0.2.jar
lrwxrwxrwx  1 root root   40 ธ.ค.  27 02:35 mysql-connector-java.jar -> /usr/share/java/mysql-connector-java.jar
-rw-r--r--  1 root root  20K ส.ค.  24 16:16 opencsv-2.3.jar
-rw-r--r--  1 root root  64K ส.ค.  24 16:15 oro-2.0.8.jar


```



---
## 8. Install sqoop




## 9. Install HUE (Webbase UI for Hadoop)




























