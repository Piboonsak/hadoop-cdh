## Install Mysql

`yum -y remove mariadb-libs`

```
[root@hd-c2nn ~]# yum -y remove mariadb-libs
Loaded plugins: fastestmirror
Resolving Dependencies
--> Running transaction check
---> Package mariadb-libs.x86_64 1:5.5.52-1.el7 will be erased

```
*https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-7*

```
[root@hd-c2nn ~]# sudo grep 'temporary password' /var/log/mysqld.log
2018-03-31T09:34:29.271607Z 1 [Note] A temporary password is generated for root@localhost: 9b!qas5yk0wZ
```

### user password

user : `root`

password: `rb[^]pNLydfbN262`



### Testing MySQL

`mysqladmin -u root -p version`

```
[root@hd-c2nn ~]# mysqladmin -u root -p version
Enter password: 
mysqladmin  Ver 8.42 Distrib 5.7.21, for Linux on x86_64
Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Server version		5.7.21
Protocol version	10
Connection		Localhost via UNIX socket
UNIX socket		/var/lib/mysql/mysql.sock
Uptime:			11 min 41 sec

Threads: 1  Questions: 15  Slow queries: 0  Opens: 113  Flush tables: 1  Open tables: 106  Queries per second avg: 0.021
[root@hd-c2nn ~]# 
```