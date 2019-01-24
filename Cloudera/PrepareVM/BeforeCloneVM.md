Prerapring VM before Clone VM 
===

## 0. PreInstall and Install application

- Set root password

`sudo -i`

`passwd`

```
[centos@hadoop-namenodecdh ~]$ sudo -i
[root@hadoop-namenodecdh ~]# passwd
Changing password for user root.
New password: 
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 
passwd: all authentication tokens updated successfully.
[root@hadoop-namenodecdh ~]# exit
logout
[centos@hadoop-namenodecdh ~]$ su
Password: 
[root@hadoop-namenodecdh centos]# passwd centos
Changing password for user centos.
New password: 
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 
passwd: all authentication tokens updated successfully.

```


- Install nano

`yum install nano`

```
[root@hadoop-namenodecdh ~]# yum install nano

```


- Install wget

`sudo yum install wget`

```
[root@hadoop-namenodecdh ~]# sudo yum install wget

```

- Install htop

`yum -y install epel-release`


```
[root@hd-c1dn1 ~]# yum -y install epel-release
Loaded plugins: fastestmirror
Repodata is over 2 weeks old. Install yum-cron? Or run: yum makecache fast
base                                                     | 3.6 kB     00:00     
cloudera-cdh5                                            |  951 B     00:00     
extras                                                   | 3.4 kB     00:00     
updates                                                  | 3.4 kB     00:00     
(1/2): extras/7/x86_64/primary_db                          | 181 kB   00:00     
(2/2): updates/7/x86_64/primary_db                         | 6.9 MB   00:00     
Determining fastest mirrors
 * base: mirror2.totbb.net
 * extras: mirror2.totbb.net
 * updates: mirror2.totbb.net

```

`yum -y install htop`


```
[root@hd-c1dn1 ~]# yum -y install htop
Loaded plugins: fastestmirror
epel/x86_64/metalink                                     | 6.7 kB     00:00     
epel                                                     | 4.7 kB     00:00     
(1/3): epel/x86_64/group_gz                                | 266 kB   00:00     
(2/3): epel/x86_64/updateinfo                              | 905 kB   00:00     
(3/3): epel/x86_64/primary_db                              | 6.3 MB   00:00     
Loading mirror speeds from cached hostfile

```

`htop`

```
[root@hd-c1dn1 ~]# htop
```

---


## 1. Configuring Network

At iNet Dashboard menu.

1. Networks > Networks > create Networks.
2. Create Subnet and input gateway ip in Network tap.
3. Create Ip or port.
4. Attrach Ip(port) to each instances.
5. Setup Access & Security at menu Computer > Access & Security
6. Attrach policy(fire wall) to each instances.

---

## 2. set connect automatically (ONBOOT=yes) /etc/sysconfig/network-scripts/ifcfg-enp0s3

- Check network connect automatically (ONBOOT=yes)

`nano /etc/sysconfig/network-scripts/ifcfg-eth0`

```
DEVICE="eth0"
BOOTPROTO="dhcp"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"


```
---



## 3. set names in /etc/hosts


`nano /etc/hosts`

```
[root@hadoop-namenodecdh ~]# nano /etc/hosts
192.168.4.4     namenode1       hadoop-namenodecdh	    hadoop-namenodecdh.novalocal
192.168.4.5	    data1   		hadoop-datanode1cdh	    hadoop-datanode1cdh.novalocal
192.168.4.6	    data2	    	hadoop-datanode2cdh	    hadoop-datanode2cdh.novalocal
```

- # if hostname not change.

`sudo hostnamectl set-hostname namenode1` 

`sudo hostnamectl set-hostname data1`   - # run command on data1 host

`sudo hostnamectl set-hostname data2`   - # run command on data2 host


 - # for restart config.

`sudo /etc/init.d/network restart`  

- # for check hostname status.

`hostnamectl status`


- # for fix hostname static.

`nano /etc/sysconfig/network`

add row :
```
HOSTNAME=namenode1

```

---

## 4. Disabling SELinux (SELINUX=disabled) at /etc/selinux/config

*Do it to all node server*

`nano /etc/selinux/config`

```
[root@hadoop-datanode2cdh ~]# nano /etc/selinux/config

# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected
```

---

## 5. Enabling NTP (only for real server, VM is automatic sync from host os)

### Not need to set up domain well provide.

---


## 6. Set Firewall for allow group IP (trusted zone)

- disable Firewall

`systemctl stop firewalld`

`systemctl disable firewalld`

```
[root@hadoop-namenodecdh ~]# systemctl stop firewalld
[root@hadoop-namenodecdh ~]# systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:firewalld(1)

ธ.ค. 21 10:04:44 hadoop-namenodecdh.novalocal systemd[1]: Starting firewa...
ธ.ค. 21 10:04:44 hadoop-namenodecdh.novalocal systemd[1]: Started firewal...
ธ.ค. 21 10:04:45 hadoop-namenodecdh.novalocal firewalld[623]: WARNING: IC...
ธ.ค. 21 10:04:45 hadoop-namenodecdh.novalocal firewalld[623]: WARNING: be...
ธ.ค. 21 10:04:45 hadoop-namenodecdh.novalocal firewalld[623]: WARNING: IC...
ธ.ค. 21 10:04:45 hadoop-namenodecdh.novalocal firewalld[623]: WARNING: fa...
ธ.ค. 21 10:04:45 hadoop-namenodecdh.novalocal firewalld[623]: WARNING: IC...
ธ.ค. 21 10:04:45 hadoop-namenodecdh.novalocal firewalld[623]: WARNING: re...
ธ.ค. 22 07:19:40 hadoop-namenodecdh.novalocal systemd[1]: Stopping firewa...
ธ.ค. 22 07:19:40 hadoop-namenodecdh.novalocal systemd[1]: Stopped firewal..

```

*file /etc/firewalld/zones/trusted.xml*

---


## 7. Install apache2 and mysql(mariadb).

*Do it to all node server*

### Install apache2

`sudo yum install httpd`

`sudo systemctl start httpd.service`

`sudo systemctl enable httpd.service`

`sudo systemctl status httpd.service`

```
[root@hadoop-namenodecdh ~]# sudo yum install httpd
Loaded plugins: fastestmirror, langpacks
base                                                              | 3.6 kB  00:00:00     
extras                                                            | 3.4 kB  00:00:00     
updates                                                           | 3.4 kB  00:00:00     
Loading mirror speeds from cached hostfile
 * base: mirrors.bangmodhosting.com
 * extras: mirrors.bangmodhosting.com
 * updates: mirrors.bangmodhosting.com
Resolving Dependencies
--> Running transaction check

```

try type url at brownser : http://203.154.58.100

*Do it to all node server*

---

### Install mysql(mariadb).

*Do it to all node server*

`sudo yum install mariadb-server mariadb`

`sudo systemctl start mariadb`

`sudo mysql_secure_installation`

`sudo systemctl enable mariadb.service`

`sudo systemctl status mariadb.service`


```
[root@hadoop-namenodecdh ~]# sudo yum install mariadb-server mariadb
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: mirrors.bangmodhosting.com
 * extras: mirrors.bangmodhosting.com
 * updates: mirrors.bangmodhosting.com
Resolving Dependencies
--> Running transaction check
---> Package mariadb.x86_64 1:5.5.56-2.el7 will be installed
--> Processing Dependency: mariadb-libs(x86-64) = 1:5.5.56-2.el7 for package: 1:mariadb-5.5.56-2.el7.x86_64
```

*Do it to all node server*

---

### Install php.

*Install only namenode1*

`sudo yum install php php-mysql`

`sudo systemctl restart httpd.service`

`sudo yum install php-fpm`

```
[root@hadoop-namenodecdh ~]# sudo yum install php php-mysql
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: mirrors.bangmodhosting.com
 * extras: mirrors.bangmodhosting.com
 * updates: mirrors.bangmodhosting.com
Resolving Dependencies
--> Running transaction check
---> Package php.x86_64 0:5.4.16-43.el7_4 will be installed

```

check already website path:

```
[root@data1 ~]# cd /var/www/html/
```

test by :create file info.php #In CentOS 7, this directory is located at /var/www/html/. 

```
[root@namenode1 ~]# sudo nano /var/www/html/info.php
```

Type in file:

```
<?php phpinfo(); ?>
```

Type IP-adress at broweser url /info.php : 


http://203.154.58.100/info.php

---


## 8. Install Oracle JDK

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

## 9. Install Cloudera CDH repository

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

---


#### Disable CentOS repository  (only in this training)

`yum-config-manager --disable CentOS-7*`

`yum repolist all`

---

#### Clone VM Image
Full Clone with reinitialize MAC Address

---

## 10. Remove Cloud.init


`yum remove cloud-init`


*refer Link https://tears.io/2016/01/05/rebooting-an-openstack-nova-instance-resets-its-hostname/*








