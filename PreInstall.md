Prerapring Cluster [before Install] 
===


## 0. PreInstall and Install application

- Set root password

`sudo -i`

`passwd`


```
[centos@hadoop-namenodecdh ~]$: sudo -i
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

## 4. Install Gnome GUI on CentOS 7 / RHEL 7 (Only on namenode) 


** wanning! If install GUI it's enable firewalld **


*http://www.itzgeek.com/how-tos/linux/centos-how-tos/install-gnome-gui-on-centos-7-rhel-7.html*


 `> yum group list`
 
 `> yum group install "GNOME Desktop" "Graphical Administration Tools"`
 
 `> ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target`
 
 `> reboot`
 
 `> init 5`


## 5. Set Firewall for allow group IP (trusted zone)

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
ธ.ค. 22 07:19:40 hadoop-namenodecdh.novalocal systemd[1]: Stopped firewal...
Hint: Some lines were ellipsized, use -l to show in full.

```

---

- Change centos password *at root user

```
 [root@namenode1 centos]# passwd centos
 
```


---

## 6. Create SSH Key (without passphrase) for SSH single sign-on to ** all data nodes **

`ssh-keygen`

```

[root@hadoop-namenodecdh ~]# ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): /root/.ssh/id_rsa
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
da:a9:a4:a7:01:b0:0c:fe:01:3f:31:59:fc:00:5a:90 root@hadoop-namenodecdh.novalocal
The key's randomart image is:
+--[ RSA 2048]----+
| .ooo.           |
| Eo oo           |
|oo +  o          |
|+oo o  .         |
|.o.+    S        |
|  ..o  o .       |
|   .. o o        |
|     +..         |
|    oo.          |
+-----------------+
[root@hadoop-namenodecdh ~]#



```

** Cat keys id_rsa.pub **

`cat ~/.ssh/id_rsa.pub`

```
[root@hadoop-namenodecdh ~]# cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwQkFPlI5EiXiZFkA+HLmERXQ4PUQwO/Aj377AtYUyWw6F6F90T04bcqa5WzgJvRzugRdQvX1t4NvHQ12K49B+HmR4LI2b1YHFthol9YM5/FGjD3A6uppXt7c/tX1P16WZ2mDzOg1+Ash82Tm8XbNNXEyuMUasDqZjr5kPKrp5TEEehs9MXw10oB70/Qigud5sLnBP0Xl/kOL0+Ssga63oJOAnxhtvNwERWlhzi4YFMmGki3HUM+PZCFtHPtE/M7Sycb+cT2CLMB0fxJMw9H2cGXEugvpeTKvu1BOQAp2WpuOPoh8tZHnMbnUK5AAb9XdFKzfvDuzaQAFwFoPKDUul root@hadoop-namenodecdh.novalocal
```
```
[root@hadoop-datanode1cdh ~]# cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW9AivUaucxCa6fnoEB0uloZkcGXcSxvcKMPMTpVY3gVCaeMpvFnRnDkElKpjskTBlP5GYj4golqYOWulW8b9EqB4FKESP5lTQmnN8Pbr6YHt55A7Uf/2IOezOILOLQNttd58Lh4fzqeM/Oql81hw9m6inix3mw3h6St1iolvweZHcYer6UfbU9mAGyp9dVzvZfei5nHGDWe3VZw6i8NtlgzLRl0unaS7ZUzYwqjd0LG0g+WSXEWThTEeyoCSKPaAeR6XXRSC9vo1AgMETuYVGG/jjTFGhIuZPmj/+yib/GxZSsy17oiFgandxZ5BRbyxX1jDHygSRnrnIflvuoz8B root@hadoop-datanode1cdh
```
```
[root@hadoop-datanode2cdh ~]# cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ09qEP8IpdJp+pFOJGyhgeLL+zp/GIIk1WgkuqXisD2tP0KNLW9sG0UzQdDsonlDwK7kO5dOAb5jtEG8PXo21vsHYOu1tKEd1YPSb6N+YWAgfGaRt4KWwitg1jNgBAwxanTMZr/vvt0IBl32SReWYr4YNRltkFMcyQkQkhhy9W8/wsHAjnkfR+i9Jh82ZqOeZ7DoPL6D0HQoCSo02w1CqPTX/WEVQGU96ip8SmCTTzHH8MnHSKYqXX4Wvc402CWWCFzWLp2T4znt0e5vSDQ1Ad3FYMy7yZyrnYatwWx1+tphYOJnw2gOnuOGHuPeoFaY3Y6wAfbqITIyoD+GYSkan root@hadoop-datanode2cdh
```

** Save keys pub to authen keys **

`cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`

```
[root@hadoop-namenodecdh ~]# cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
```
[root@hadoop-datanode1cdh ~]# cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
```
[root@hadoop-datanode2cdh ~]# cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

** To add id_rsa.pub keys other server ex data1,data2 and do like this with anther server. **

*Tips you can save only namenode1 keys to other datanodes authorized_keys.*

`nano .ssh/authorized_keys`

```
[root@hadoop-namenodecdh ~]# nano .ssh/authorized_keys
```
```
no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command="echo 'Please login as $
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwQkFPlI5EiXiZFkA+HLmERXQ4PUQwO/Aj377AtYUyWw6F6F90$
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW9AivUaucxCa6fnoEB0uloZkcGXcSxvcKMPMTpVY3gVCaeMpv$
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ09qEP8IpdJp+pFOJGyhgeLL+zp/GIIk1WgkuqXisD2tP0KNL$
```

```
[root@hadoop-datanode1cdh ~]# nano .ssh/authorized_keys
```
```
no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command="echo 'Please $
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW9AivUaucxCa6fnoEB0uloZkcGXcSxvcKMPMTpVY$
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwQkFPlI5EiXiZFkA+HLmERXQ4PUQwO/Aj377AtYU$
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ09qEP8IpdJp+pFOJGyhgeLL+zp/GIIk1WgkuqXi$
```

```
[root@hadoop-datanode2cdh ~]# nano .ssh/authorized_keys
```
```
no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command="echo 'Please $
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ09qEP8IpdJp+pFOJGyhgeLL+zp/GIIk1WgkuqXi$
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwQkFPlI5EiXiZFkA+HLmERXQ4PUQwO/Aj377AtYU$
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW9AivUaucxCa6fnoEB0uloZkcGXcSxvcKMPMTpVY$
```

- reload sshd all node server.
 
`systemctl reload sshd`

```
[root@namenode1 ~]# systemctl reload sshd
```

- test ssh by ssh [hostname]

`ssh data1`

```
[root@hadoop-namenodecdh ~]# ssh data1
Last login: Fri Dec 22 04:32:56 2017 from namenode1

```

*Refer Link:https://www.digitalocean.com/community/tutorials/initial-server-setup-with-centos-7#step-three-—-root-privileges*

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


## 8. Copy CDH repository to namenode server to path /var/www/html/cdh.

*Install only namenode1*

use Filezilla copy file.

1. Floder cdh to /var/www/html/        # Floder contain CDH repository.
2. Floder Hadoop to /root/Desktop/     # Floder contain bash file for run ecosystem Installation.

check by type url :

http://203.154.58.100/cdh/      # In the well show cdh floder.

#### This step you must prepare CDH repository floder before.

---


## 9. Disabling SELinux (SELINUX=disabled) at /etc/selinux/config

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

## 10. Enabling NTP (only for real server, VM is automatic sync from host os)

### Not need to set up domain well provide.

---

## Appendix

*Other Tip and Trick*

-  Performance Tuning

edit file /etc/sysctl.conf

`nano /etc/sysctl.conf`

```
vm.swappiness = 10

```


- Save memory of Data Nodes with change start up mode to "multi-user mode" via.

` systemctl set-default multi-user`

```
[root@hadoop-namenodecdh ~]# systemctl set-default multi-user
Removed symlink /etc/systemd/system/default.target.
Created symlink from /etc/systemd/system/default.target to /usr/lib/systemd/system/multi-user.target.

[root@hadoop-namenodecdh ~]# ssh data1 systemctl set-default multi-user
Removed symlink /etc/systemd/system/default.target.
Created symlink from /etc/systemd/system/default.target to /usr/lib/systemd/system/multi-user.target.

[root@hadoop-namenodecdh ~]# ssh data2 systemctl set-default multi-user
Removed symlink /etc/systemd/system/default.target.
Created symlink from /etc/systemd/system/default.target to /usr/lib/systemd/system/multi-user.target.

[root@hadoop-namenodecdh ~]# ssh data1 init 3
[root@hadoop-namenodecdh ~]# ssh data2 init 3
```


---

