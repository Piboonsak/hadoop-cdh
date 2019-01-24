### Kerberose Conf


## Create kerberose user ACL

reflink:*https://web.mit.edu/kerberos/krb5-1.12/doc/admin/conf_files/kadm5_acl.html*
[root@dc-os ~]# nano /var/kerberos/krb5kdc/kadm5.acl

*/admin@TRACEONCLOUD.COM          *
*/ngx1-n1@TRACEONCLOUD.COM        *
*/hd-c1nn@TRACEONCLOUD.COM        *
*/hd-c2nn@TRACEONCLOUD.COM        *
*/hd-c1dn1@TRACEONCLOUD.COM	  *
*/hd-c1dn2@TRACEONCLOUD.COM	  *
*/hd-c2dn1@TRACEONCLOUD.COM	  *
*/hd-c2dn2@TRACEONCLOUD.COM	  *
*/pdi-n1@TRACEONCLOUD.COM         *
*/*@TRACEONCLOUD.COM              i
*/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM        *
*/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM        *
*/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM	   *
*/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM	   *
*/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM	   *
*/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM	   *
*/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM         *
hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM              *
mapred/_HOST.traceoncloud.com@TRACEONCLOUD.COM            *
yarn/_HOST.traceoncloud.com@TRACEONCLOUD.COM              *
HTTP/_HOST.traceoncloud.com@TRACEONCLOUD.COM              *
      i
## List principals
 kadmin:  listprincs
Administrator@TRACEONCLOUD.COM
HTTP/traceoncloud.com@TRACEONCLOUD.COM
K/M@TRACEONCLOUD.COM
NGX-N1$@TRACEONCLOUD.COM
administrator/admin@TRACEONCLOUD.COM
administrator@TRACEONCLOUD.COM
bank/admin@TRACEONCLOUD.COM
centos/admin@TRACEONCLOUD.COM
hdfs/traceoncloud.com@TRACEONCLOUD.COM
kadmin/admin@TRACEONCLOUD.COM
kadmin/changepw@TRACEONCLOUD.COM
kadmin/dc-os@TRACEONCLOUD.COM
kadmin/traceoncloud.com@TRACEONCLOUD.COM
kie/admin@TRACEONCLOUD.COM


## Create principals

#Syntex
 > addprinc -randkey hdfs/fully.qualified.domain.name@YOUR-REALM.COM

 > addprinc -randkey hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey mapred/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey yarn/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey HTTP/_HOST.traceoncloud.com@TRACEONCLOUD.COM


[root@dc-os ~]# kadmin
Authenticating as principal root/admin@TRACEONCLOUD.COM with password.
Password for root/admin@TRACEONCLOUD.COM: 
kadmin:  addprinc -randkey hdfs/traceoncloud.com@TRACEONCLOUD.COM
WARNING: no policy specified for hdfs/traceoncloud.com@TRACEONCLOUD.COM; defaulting to no policy

kadmin:  addprinc -randkey mapred/traceoncloud.com@TRACEONCLOUD.COM
WARNING: no policy specified for mapred/traceoncloud.com@TRACEONCLOUD.COM; defaulting to no policy
Principal "mapred/traceoncloud.com@TRACEONCLOUD.COM" created.

## Change password
kadmin: change_password hdfs/traceoncloud.com@TRACEONCLOUD.COM


## Policies

kadmin: list_policies *user*


## Create keytab

#Syntex
kadmin:  xst -norandkey -k hdfs.keytab hdfs/fully.qualified.domain.name HTTP/fully.qualified.domain.name




Kerberos CLI:
?                 del_string        getstrs           modpol
addpol            exit              ktadd             modprinc
add_policy        getpol            ktrem             purgekeys
addprinc          get_policies      ktremove          q
add_principal     get_policy        list_policies     quit
ank               getpols           listpols          rename_principal
change_password   getprinc          list_principals   renprinc
cpw               get_principal     listprincs        setstr
delete_policy     get_principals    list_requests     set_string
delete_principal  getprincs         lock              unlock
delpol            getprivs          lr                xst
delprinc          get_privs         modify_policy     
delstr            get_strings       modify_principal  
kadmin:  
?                 del_string        getstrs           modpol
addpol            exit              ktadd             modprinc
add_policy        getpol            ktrem             purgekeys
addprinc          get_policies      ktremove          q
add_principal     get_policy        list_policies     quit
ank               getpols           listpols          rename_principal
change_password   getprinc          list_principals   renprinc
cpw               get_principal     listprincs        setstr
delete_policy     get_principals    list_requests     set_string
delete_principal  getprincs         lock              unlock
delpol            getprivs          lr                xst
delprinc          get_privs         modify_policy     
delstr            get_strings       modify_principal

## Create keytab

# Keytab
kadmin:  xst -norandkey -k hdfs.keytab hdfs/fully.qualified.domain.name HTTP/fully.qualified.domain.name


 > xst -norandkey -k hdfs.keytab hdfs/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k mapred.keytab mapred/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k yarn.keytab yarn/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com


kadmin.local:  xst -norandkey -k mapred.keytab mapred/traceoncloud.com HTTP/traceoncloud.com
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type aes256-cts-hmac-sha1-96 added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type aes128-cts-hmac-sha1-96 added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type des3-cbc-sha1 added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type arcfour-hmac added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type camellia256-cts-cmac added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type camellia128-cts-cmac added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type des-hmac-sha1 added to keytab WRFILE:mapred.keytab.
Entry for principal mapred/traceoncloud.com with kvno 1, encryption type des-cbc-md5 added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type aes256-cts-hmac-sha1-96 added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type aes128-cts-hmac-sha1-96 added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type des3-cbc-sha1 added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type arcfour-hmac added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type camellia256-cts-cmac added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type camellia128-cts-cmac added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type des-hmac-sha1 added to keytab WRFILE:mapred.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 1, encryption type des-cbc-md5 added to keytab WRFILE:mapred.keytab.
kadmin.local:  


[root@dc-os ~]# klist -e -k -t hdfs.keytab 
Keytab name: FILE:hdfs.keytab
KVNO Timestamp           Principal
---- ------------------- ------------------------------------------------------
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (aes256-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (aes128-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (des3-cbc-sha1) 
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (arcfour-hmac) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (camellia256-cts-cmac) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (camellia128-cts-cmac) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (des-hmac-sha1) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (des-cbc-md5) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (aes256-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (aes128-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (des3-cbc-sha1) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (arcfour-hmac) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (camellia256-cts-cmac) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (camellia128-cts-cmac) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (des-hmac-sha1) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (des-cbc-md5)



## deploy keytab

# At kdc server copy keytab to host
[root@dc-os ~]# scp *.keytab hd-c1nn:/etc/hadoop/conf
hdfs.keytab                                                                                       100% 1152   773.7KB/s   00:00    
mapred.keytab                                                                                     100% 1166     1.0MB/s   00:00    
yarn.keytab                                                                                       100% 1152     1.1MB/s   00:00    
[root@dc-os ~]# scp *.keytab hd-c2nn:/etc/hadoop/conf
hdfs.keytab                                                                                       100% 1152   609.2KB/s   00:00    
mapred.keytab                                                                                     100% 1166   631.6KB/s   00:00    
yarn.keytab                                                                                       100% 1152   472.4KB/s   00:00 

# At host set permisson
[root@hd-c1nn conf]# sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab | sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab | sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab | sudo chmod 400 /etc/hadoop/conf/*.keytab


[root@hd-c1nn ~]# ssh hd-c1dn1
Last login: Fri May  4 09:13:19 2018 from hd-c1nn.traceoncloud.com
[root@hd-c1dn1 ~]# sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab | sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab | sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab | sudo chmod 400 /etc/hadoop/conf/*.keytab
[root@hd-c1dn1 ~]# exit
logout
Connection to hd-c1dn1 closed.
[root@hd-c1nn ~]# ssh hd-c1dn2
Last login: Mon Apr 23 10:21:07 2018
[root@hd-c1dn2 ~]# sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab | sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab | sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab | sudo chmod 400 /etc/hadoop/conf/*.keytab
[root@hd-c1dn2 ~]# exit
logout
Connection to hd-c1dn2 closed.
[root@hd-c1nn ~]# ssh hd-c2dn2
Last login: Wed Apr 18 20:47:30 2018 from hd-c1nn.traceoncloud.com
[root@hd-c2dn2 ~]# sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab | sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab | sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab | sudo chmod 400 /etc/hadoop/conf/*.keytab
[root@hd-c2dn2 ~]# exit
logout
Connection to hd-c2dn2 closed.
[root@hd-c1nn ~]# ssh hd-c2dn1
Last login: Wed Apr 18 20:47:36 2018 from hd-c1nn.traceoncloud.com
[root@hd-c2dn1 ~]# sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab | sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab | sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab | sudo chmod 400 /etc/hadoop/conf/*.keytab


## At host login kinit.
[root@hd-c1nn ~]# kadmin
Authenticating as principal root/admin@TRACEONCLOUD.COM with password.
Password for root/admin@TRACEONCLOUD.COM: 
kadmin: Communication failure with server while initializing kadmin interface
[root@hd-c1nn ~]# klist -e -k -t hdfs.keytab
Keytab name: FILE:hdfs.keytab
KVNO Timestamp           Principal
---- ------------------- ------------------------------------------------------
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (aes256-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (aes128-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (des3-cbc-sha1) 
   1 27/04/2561 10:24:47 hdfs/traceoncloud.com@TRACEONCLOUD.COM (arcfour-hmac) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (camellia256-cts-cmac) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (camellia128-cts-cmac) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (des-hmac-sha1) 
   1 27/04/2561 10:24:48 hdfs/traceoncloud.com@TRACEONCLOUD.COM (des-cbc-md5) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (aes256-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (aes128-cts-hmac-sha1-96) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (des3-cbc-sha1) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (arcfour-hmac) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (camellia256-cts-cmac) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (camellia128-cts-cmac) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (des-hmac-sha1) 
   1 27/04/2561 10:24:48 HTTP/traceoncloud.com@TRACEONCLOUD.COM (des-cbc-md5)


klist -e -k -t hdfs.keytab

### Tail 
 > tail -f /var/log/krb5kdc.log | grep search_term

## kinit
 > kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/traceoncloud.com

 [root@hd-c1nn ~]# klist -e -f
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: HTTP/traceoncloud.com@TRACEONCLOUD.COM

Valid starting       Expires              Service principal
27/04/2561 16:04:17  28/04/2561 16:04:17  krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM
	Flags: FPI, Etype (skey, tkt): aes256-cts-hmac-sha1-96, aes256-cts-hmac-sha1-96


[root@hd-c1nn ~]# nano /tmp/krb5cc_0

^E^D^@^L^@^A^@^H^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@^B^@^@^@^PTRACEONCLOUD.COM^@^@^@^DHTTP^@^@^@^Ptraceoncloud.com^@^@^@^A^@^@^@^B^@^@^@^$
��-^\ A��J!̀>t���paZ���Z���Z�9^Q^@^@^@^@^@PA^@^@^@^@^@^@^@^@^@^@^@^@^Aca�^A_0�^A[�^C^B^A^E�^R^[^PTRACEONCLOUD.COM�%0#�^C^B^A^B�^\0^Z$
2����K�ep�^T^Np���v���M^H^Rӧ�\�F^C6Χ�u�^@T�.ާ^_Y^F^V�b^Q)^O��I�̧��
J�q�6r=�6����c��� �mk��i_�1b^Nz]^E^L�B(�}�C^N�?�� �/��$
W.q�ă ڝ�^EJC^U^@^@^@^@^@^@^@^A^@^@^@^B^@^@^@^PTRACEONCLOUD.COM^@^@^@^DHTTP^@^@^@^Ptraceoncloud.com^@^@^@^@^@^@^@^C^@^@^@^LX-CACHECO$
fast_avail^@^@^@(krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@



###  Changing the Directory Ownership on HDFS


$ sudo -u hdfs kinit -k -t hdfs.keytab hdfs/fully.qualified.domain.name@YOUR-REALM.COM
$ hadoop fs -chown hdfs:hadoop /
$ hadoop fs -chmod 755 /

### hdfs log in kerberose
sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM


$ sudo -u hdfs hadoop fs -chown yarn:hadoop [yarn.nodemanager.remote-app-log-dir]
$ sudo -u hdfs hadoop fs -chmod 1777 [yarn.nodemanager.remote-app-log-dir]
yarn.nodemanager.remote-app-log-dir >> /var/log/hadoop-yarn/apps


sudo -u hdfs hadoop fs -chown yarn:hadoop /var/log/hadoop-yarn/apps
sudo -u hdfs hadoop fs -chmod 1777 /var/log/hadoop-yarn/apps

[root@hd-c1nn ~]# hadoop fs -ls /var/log/hadoop-yarn/apps
Found 1 items
drwxrwx---   - clusterkit yarn          0 2018-04-03 11:13 /var/log/hadoop-yarn/apps/clusterkit
[root@hd-c1nn ~]# sudo -u hdfs hadoop fs -chown yarn:hadoop /var/log/hadoop-yarn/apps
[root@hd-c1nn ~]# sudo -u hdfs hadoop fs -chmod 1777 /var/log/hadoop-yarn/apps

$ sudo -u hdfs hadoop fs -chown mapred:hadoop [mapreduce.jobhistory.intermediate-done-dir]
$ sudo -u hdfs hadoop fs -chmod 1777 [mapreduce.jobhistory.intermediate-done-dir]



### At dc-os kdc host 
[root@dc-os ~]# nano /var/kerberos/krb5kdc/kdc.conf


Start the Kerberos Service
Start the KDC and kadmin daemons as shown below.
reflink : https://www.thegeekstuff.com/2014/05/install-kerberos-serve

# service krb5kdc start
Starting Kerberos 5 KDC:               [  OK  ]

# service kadmin start
Starting Kerberos 5 Admin Server:      [  OK  ]


[root@dc-os ~]# service krb5kdc restart
Redirecting to /bin/systemctl restart krb5kdc.service
[root@dc-os ~]# service kadmin restart
Redirecting to /bin/systemctl restart kadmin.service

or

[root@dc-os ~]# service krb5kdc restart | service kadmin restart
Redirecting to /bin/systemctl restart krb5kdc.service
Redirecting to /bin/systemctl restart kadmin.service




kadmin.local:  listprincs
Administrator@TRACEONCLOUD.COM
HTTP/traceoncloud.com@TRACEONCLOUD.COM
K/M@TRACEONCLOUD.COM
NGX-N1$@TRACEONCLOUD.COM
administrator/admin@TRACEONCLOUD.COM
administrator@TRACEONCLOUD.COM
bank/admin@TRACEONCLOUD.COM
centos/admin@TRACEONCLOUD.COM
hdfs/traceoncloud.com@TRACEONCLOUD.COM
host/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin/admin@TRACEONCLOUD.COM
kadmin/changepw@TRACEONCLOUD.COM
kadmin/dc-os@TRACEONCLOUD.COM
kadmin/traceoncloud.com@TRACEONCLOUD.COM
kie/admin@TRACEONCLOUD.COM
kiprop/dc-os@TRACEONCLOUD.COM
krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM
ldap/dc-os.traceoncloud.com@TRACEONCLOUD.COM
mapred/traceoncloud.com@TRACEONCLOUD.COM
ngx-n1/traceoncloud.com@TRACEONCLOUD.COM
ngx1-n1@TRACEONCLOUD.COM
root/admin@TRACEONCLOUD.COM
root@TRACEONCLOUD.COM
yarn/traceoncloud.com@TRACEONCLOUD.COM


## gen new principal
delprinc 


 > delprinc hdfs/traceoncloud.com@TRACEONCLOUD.COM
 > delprinc yarn/traceoncloud.com@TRACEONCLOUD.COM
 > delprinc mapred/traceoncloud.com@TRACEONCLOUD.COM
 > delprinc HTTP/traceoncloud.com@TRACEONCLOUD.COM
 > delprinc host/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
 > delprinc root@TRACEONCLOUD.COM
 > delprinc root/admin@TRACEONCLOUD.COM


 > service krb5kdc restart
 > service kadmin restart

 > addprinc -randkey hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey mapred/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey yarn/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey HTTP/_HOST.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey host/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey root@TRACEONCLOUD.COM
 > addprinc -randkey root/admin@TRACEONCLOUD.COM

 > addprinc -randkey hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey mapred/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey yarn/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
 > addprinc -randkey HTTP/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

### Kdestroy

[root@hd-c1nn ~]# klist -e -f
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: HTTP/traceoncloud.com@TRACEONCLOUD.COM

Valid starting       Expires              Service principal
27/04/2561 16:04:17  28/04/2561 16:04:17  krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM
	Flags: FPI, Etype (skey, tkt): aes256-cts-hmac-sha1-96, aes256-cts-hmac-sha1-96 
[root@hd-c1nn ~]# sudo -u hdfs klist -ef
Ticket cache: FILE:/tmp/krb5cc_987
Default principal: hdfs/traceoncloud.com@TRACEONCLOUD.COM

Valid starting       Expires              Service principal
03/05/2561 16:02:57  04/05/2561 16:02:57  krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM
	Flags: FPI, Etype (skey, tkt): aes256-cts-hmac-sha1-96, aes256-cts-hmac-sha1-96 
[root@hd-c1nn ~]# sudo -u hdfs kinit
kinit: Client 'hdfs/traceoncloud.com@TRACEONCLOUD.COM' not found in Kerberos database while getting initial credentials
[root@hd-c1nn ~]# kdestroy
[root@hd-c1nn ~]# kdestroy
kdestroy: No credentials cache found while destroying cache
[root@hd-c1nn ~]# sudo -u hdfs kdestroy
[root@hd-c1nn ~]# sudo -u hdfs kdestroy
kdestroy: No credentials cache found while destroying cache
[root@hd-c1nn ~]# sudo -u hdfs klist -ef
klist: No credentials cache found (filename: /tmp/krb5cc_987)
[root@hd-c1nn ~]# klist -ef
klist: No credentials cache found (filename: /tmp/krb5cc_0)
[root@hd-c1nn ~]# 


## Create keytab

# Keytab
kadmin:  xst -norandkey -k hdfs.keytab hdfs/fully.qualified.domain.name HTTP/fully.qualified.domain.name

 > xst -norandkey -k hdfs.keytab hdfs/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k mapred.keytab mapred/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k yarn.keytab yarn/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com

kadmin.local:  xst -norandkey -k yarn.keytab yarn/traceoncloud.com HTTP/traceoncloud.com
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type aes128-cts-hmac-sha1-96 added to keytab WRFILE:yarn.keytab.
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type des3-cbc-sha1 added to keytab WRFILE:yarn.keytab.
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type arcfour-hmac added to keytab WRFILE:yarn.keytab.
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type camellia256-cts-cmac added to keytab WRFILE:yarn.keytab.
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type camellia128-cts-cmac added to keytab WRFILE:yarn.keytab.
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type des-hmac-sha1 added to keytab WRFILE:yarn.keytab.
Entry for principal yarn/traceoncloud.com with kvno 1, encryption type des-cbc-md5 added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type aes128-cts-hmac-sha1-96 added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type des3-cbc-sha1 added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type arcfour-hmac added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type camellia256-cts-cmac added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type camellia128-cts-cmac added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type des-hmac-sha1 added to keytab WRFILE:yarn.keytab.
Entry for principal HTTP/traceoncloud.com with kvno 2, encryption type des-cbc-md5 added to keytab WRFILE:yarn.keytab.
kadmin.local:  



[root@dc-os ~]# rpm -qa | grep -i krb5
krb5-server-1.15.1-8.el7.x86_64
pam_krb5-2.4.8-6.el7.x86_64
krb5-pkinit-1.15.1-8.el7.x86_64
krb5-workstation-1.15.1-8.el7.x86_64
krb5-devel-1.15.1-8.el7.x86_64
sssd-krb5-common-1.15.2-50.el7_4.11.x86_64
krb5-libs-1.15.1-8.el7.x86_64
sssd-krb5-1.15.2-50.el7_4.11.x86_64


add princ -randkey 
host/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
host/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
host/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
host/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
host/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
host/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
host/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM


[root@hd-c1nn ~]# klist -ef
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: root@TRACEONCLOUD.COM

Valid starting       Expires              Service principal
04/05/2561 10:08:14  05/05/2561 10:08:14  krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM
	Flags: FPI, Etype (skey, tkt): aes256-cts-hmac-sha1-96, aes256-cts-hmac-sha1-96 
04/05/2561 10:22:43  05/05/2561 10:08:14  host/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
	Flags: FPT, Etype (skey, tkt): aes128-cts-hmac-sha1-96, aes128-cts-hmac-sha1-96 
04/05/2561 10:25:28  05/05/2561 10:08:14  host/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
	Flags: FPT, Etype (skey, tkt): aes128-cts-hmac-sha1-96, aes128-cts-hmac-sha1-96 
04/05/2561 10:25:35  05/05/2561 10:08:14  host/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
	Flags: FPT, Etype (skey, tkt): aes128-cts-hmac-sha1-96, aes128-cts-hmac-sha1-96 
04/05/2561 10:25:45  05/05/2561 10:08:14  host/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
	Flags: FPT, Etype (skey, tkt): aes128-cts-hmac-sha1-96, aes128-cts-hmac-sha1-96 
04/05/2561 10:25:51  05/05/2561 10:08:14  host/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
	Flags: FPT, Etype (skey, tkt): aes128-cts-hmac-sha1-96, aes128-cts-hmac-sha1-96 
04/05/2561 10:26:04  05/05/2561 10:08:14  host/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
	Flags: FPT, Etype (skey, tkt): aes128-cts-hmac-sha1-96, aes128-cts-hmac-sha1-96




### hdfs log in kerberose
sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM


## Delete worng keytab
 
[root@hd-c2nn ~]# rm -rf hdfs.keytab | rm -rf yarn.keytab | rm -rf mapred.keytab


ssh pdi-n1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab


[root@hd-c1nn ~]# ssh hd-c1nn rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
[root@hd-c1nn ~]# ssh hd-c2nn rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
[root@hd-c1nn ~]# ssh hd-c1dn1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
[root@hd-c1nn ~]# ssh hd-c1dn2 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
[root@hd-c1nn ~]# ssh hd-c2dn2 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
[root@hd-c1nn ~]# ssh hd-c2dn1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
[root@hd-c1nn ~]# ssh pdi-n1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab

[root@hd-c1nn ~]# ssh hd-c2nn kdestroy
[root@hd-c1nn ~]# ssh hd-c1dn1 kdestroy
[root@hd-c1nn ~]# ssh hd-c1dn2 kdestroy
[root@hd-c1nn ~]# ssh hd-c2dn2 kdestroy
[root@hd-c1nn ~]# ssh hd-c2dn1 kdestroy
[root@hd-c1nn ~]# ssh pdi-n1 kdestroy



hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM


gen file ./delkeytab at root@hd-c1nn

[root@hd-c1nn ~]# chmod -R 755 delkeytab 
[root@hd-c1nn ~]# ./delkeytab 
[root@hd-c1nn ~]# 

----------------------------------------------------------------------------------------------------------------

#!/bin/sh

# delete keytab
rm -rf hdfs.keytab | rm -rf yarn.keytab | rm -rf mapred.keytab
ssh hd-c1nn rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
ssh hd-c2nn rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
ssh hd-c1dn1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
ssh hd-c1dn2 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
ssh hd-c2dn2 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
ssh hd-c2dn1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab
ssh pdi-n1 rm -rf /etc/hadoop/conf/hdfs.keytab | rm -rf /etc/hadoop/conf/yarn.keytab | rm -rf /etc/hadoop/conf/mapred.keytab

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

service krb5kdc restart | service kadmin restart

----------------------------------------------------------------------------------------------------------------



 > xst -norandkey -k hdfs.keytab hdfs/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k mapred.keytab mapred/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k yarn.keytab yarn/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com


### hdfs log in kerberose again
sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM




hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM



 > xst -norandkey -k hdfs.keytab hdfs/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k mapred.keytab mapred/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com
 > xst -norandkey -k yarn.keytab yarn/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com



#!/bin/sh
#generate keytab ver minimal

kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com






----------------------------------------------------------------------------------------------------------------

### add full principal policy.

[root@dc-os ~]# nano /var/kerberos/krb5kdc/kadm5.acl


*/admin@TRACEONCLOUD.COM          *
*/ngx1-n1@TRACEONCLOUD.COM        *
*/hd-c1nn@TRACEONCLOUD.COM        *
*/hd-c2nn@TRACEONCLOUD.COM        *
*/hd-c1dn1@TRACEONCLOUD.COM	  *
*/hd-c1dn2@TRACEONCLOUD.COM	  *
*/hd-c2dn1@TRACEONCLOUD.COM	  *
*/hd-c2dn2@TRACEONCLOUD.COM	  *
*/pdi-n1@TRACEONCLOUD.COM         *
*/*@TRACEONCLOUD.COM              i
hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM        *
mapred/_HOST.traceoncloud.com@TRACEONCLOUD.COM      *
yarn/_HOST.traceoncloud.com@TRACEONCLOUD.COM        *
HTTP/_HOST.traceoncloud.com@TRACEONCLOUD.COM        *
host/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM      *
host/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM      *
host/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM     *
host/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM     *
host/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM     *
host/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM     *
host/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM       *
hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM      *
hdfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM      *
hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM     *
hdfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM     *
hdfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM     *
hdfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM     *
hdfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM       *
yarn/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM      *
yarn/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM      *
yarn/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM     *
yarn/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM     *
yarn/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM     *
yarn/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM     *
yarn/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM       *
mapred/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM    *
mapred/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM    *
mapred/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM   *
mapred/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM   *
mapred/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM   *
mapred/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM   *
mapred/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM     *
HTTP/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM      *
HTTP/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM      *
HTTP/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM     *
HTTP/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM     *
HTTP/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM     *
HTTP/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM     *
HTTP/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM       *



----------------------------------------------------------------------------------------------------------------

#!/bin/sh
#generate principals

kadmin.local addprinc -randkey hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hdfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hdfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hdfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hdfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hdfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey mapred/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey yarn/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey HTTP/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
----------------------------------------------------------------------------------------------------------------

#!/bin/sh
#delete principals

kadmin.local delprinc hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local delprinc hdfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local delprinc hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local delprinc hdfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local delprinc hdfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local delprinc hdfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local delprinc hdfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc mapred/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc yarn/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local delprinc HTTP/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local listprincs
----------------------------------------------------------------------------------------------------------------

#!/bin/sh
#generate keytab

kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com hdfs/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com hdfs/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com hdfs/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com hdfs/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com hdfs/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com hdfs/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com hdfs/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com

kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com mapred/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com mapred/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com mapred/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com mapred/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com mapred/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com mapred/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com mapred/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com

kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com yarn/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com yarn/_HOST.traceoncloud.com HTTP/_HOST.traceoncloud.com yarn/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com yarn/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com yarn/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com yarn/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com yarn/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com

----------------------------------------------------------------------------------------------------------------

###deploy keytab
[root@dc-os ~]# ./deploykeytabCDH

#!/bin/sh
#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1nn:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2nn:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1dn1:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1dn2:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2dn1:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2dn2:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab pdi-n1:/etc/hadoop/conf

# Set file permission
ssh hd-c1nn sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1nn sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1nn sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1nn sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c2nn sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2nn sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2nn sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2nn sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c1dn1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1dn1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1dn1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1dn1 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c1dn2 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1dn2 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1dn2 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1dn2 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c2dn1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2dn1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2dn1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2dn1 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c2dn2 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2dn2 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2dn2 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2dn2 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh pdi-n1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh pdi-n1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh pdi-n1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh pdi-n1 sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c1nn sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

----------------------------------------------------------------------------------------------------------------

### run all step

#!/bin/sh

./delkeytabCDH

#generate principals
./genprincipals

./genkeytab

./deploykeytabCDH


----------------------------------------------------------------------------------------------------------------

###generate keytab and deploy each host.

#!/bin/sh

## host hd-c1nn
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1nn:/etc/hadoop/conf

# Set file permission
ssh hd-c1nn sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1nn sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1nn sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1nn sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c1nn sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM


## host hd-c2nn
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2nn:/etc/hadoop/conf

# Set file permission
ssh hd-c2nn sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2nn sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2nn sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2nn sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c2nn sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM


## host hd-c1dn1
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1dn1:/etc/hadoop/conf

# Set file permission
ssh hd-c1dn1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1dn1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1dn1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1dn1 sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c1dn1 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM


## host hd-c1dn2
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1dn2:/etc/hadoop/conf

# Set file permission
ssh hd-c1dn2 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1dn2 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1dn2 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1dn2 sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c1dn2 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM


## host hd-c2dn1
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2dn1:/etc/hadoop/conf

# Set file permission
ssh hd-c2dn1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2dn1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2dn1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2dn1 sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c2dn1 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM


## host hd-c2dn2
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2dn2:/etc/hadoop/conf

# Set file permission
ssh hd-c2dn2 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2dn2 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2dn2 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2dn2 sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c2dn2 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM


## host pdi-n1
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab pdi-n1:/etc/hadoop/conf

# Set file permission
ssh pdi-n1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh pdi-n1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh pdi-n1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh pdi-n1 sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh pdi-n1 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM


### file nano /etc/krb5.conf./
[logging]
default = FILE:/var/log/krb5libs.log
kdc = FILE:/var/log/krb5kdc.log
admin_server = FILE:/var/log/kadmind.log

[libdefaults]
default_realm = TRACEONCLOUD.COM
dns_lookup_realm = true
forwardable = true
kdc_timesync = 1
ccache_type = 4
proxiable = true
rdns = false

[realms]
TRACEONCLOUD.COM = {
   default_domain = traceoncloud.com
   kdc = traceoncloud.com:88
   admin_server = traceoncloud.com:749
}

[kdc]
profile = /etc/krb5kdc/kdc.conf

[domain_realm]
traceoncloud.com = TRACEONCLOUD.COM
.traceoncloud.com = TRACEONCLOUD.COM


### file /var/kerberos/krb5kdc/kdc.conf

[kdcdefaults]
 kdc_ports = 88
 kdc_tcp_ports = 88

[realms]
 TRACEONCLOUD.COM = {
  #master_key_type = aes256-cts
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  supported_enctypes = aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal camellia256-cts:normal camellia128-cts:normal de$
}

[loggin] 
  kdc = FILE:/usr/local/var/krb5kdc/kdc.log
  admin_server = FILE:/usr/local/var/krb5kdc/kadmin.log

[dbdefaults]
  ldap_kerberos_container_dn = dc=traceoncloud,dc=com


-----------------------------------------------------------------------------------------


hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

addprinc -randkey hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

addprinc -randkey root@TRACEONCLOUD.COM

addprinc -randkey krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM

kadmin.local addprinc -randkey krbtgt/TRACEONCLOUD.COM@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/admin@TRACEONCLOUD.COM


ssh hd-c1nn sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM


### Disable HA
cp -a -v /data/journalnode/mycluster /hadoop/name

# delete _HOST principals
hdfs/_HOST.traceoncloud.com@TRACEONCLOUD.COM
mapred/_HOST.traceoncloud.com@TRACEONCLOUD.COM
yarn/_HOST.traceoncloud.com@TRACEONCLOUD.COM
HTTP/_HOST.traceoncloud.com@TRACEONCLOUD.COM



hd-c2nn.traceoncloud.com

hdfs/hd-c2nn@TRACEONCLOUD.COM


________________________________________________________________________________________

### Create a startup script to autostart the service during reboot.
ref link : https://www.howtoforge.com/tutorial/samba-4-domain-controller-installation-on-centos/
[root@dc-os ~]# cat /etc/systemd/system/samba.service

[Unit]
Description= Samba 4 Active Directory
After=syslog.target
After=network.target

[Service]
Type=forking
PIDFile=/usr/local/samba/var/run/samba.pid
ExecStart=/usr/local/samba/sbin/samba

[Install]
WantedBy=multi-user.target


 ps ax | egrep "samba|smbd|nmbd|winbindd"


[root@dc-os ~]#  ps ax | egrep "samba|smbd|nmbd|winbindd"
 1429 ?        Ss     0:01 /usr/local/samba/sbin/samba
 1573 ?        S      0:00 /usr/local/samba/sbin/samba
 1574 ?        S      4:21 /usr/local/samba/sbin/samba
 1575 ?        S      0:00 /usr/local/samba/sbin/samba
 1576 ?        Ss     0:03 /usr/local/samba/sbin/smbd -D --option=server role ch


### Verifying the File Server

smbclient -L localhost -U%

### To verify authentication, connect to the netlogon

[root@dc-os ~]# host -t SRV _ldap._tcp.traceoncloud.com
Host _ldap._tcp.traceoncloud.com not found: 3(NXDOMAIN)
[root@dc-os ~]# smbclient //localhost/netlogon -UAdministrator -c 'ls'

## Enter TRACEONCLOUD\Administrator's password: 
Domain=[TRACEONCLOUD] OS=[Windows 6.1] Server=[Samba 4.6.13]
  .                                   D        0  Thu Apr  5 16:16:48 2018
  ..                                  D        0  Thu Apr  5 16:18:59 2018

		209703916 blocks of size 1024. 201351924 blocks available

### Verifying DNS


host -t SRV _ldap._tcp.traceoncloud.com

hd-c2nn.traceoncloud.com


hdfs/hd-c2nn@TRACEONCLOUD.COM





windows AD @ tst-n1

203.151.51.57
user : Administrator
pass : njkioCZ[]7x


ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkKz8ZlCr4cLovGoalyJ+wZZNbxK+EDbx7GjeN5Ah/h3a0Czri2MEL5RWExt6UKWTXmZvRjS1kWpvovryJ6By4RhnMGB6A78IN+b5UL4+HCky7iQOPKl5TNvIRmUZNaKgt3NBYlzHbwF5fSPMa9np0Z9wTaxnlOAx+2Sy5PWFVGYZ1x6RI9KOj1dsItgk+ZxyjXlsBmsVkclJm1d3EdKfq2DsHH1kKVZgDHGIzVq/CHhESuGDSWwMl1EByQ+7lf/1sMhD2YO0tMQhBb4D/WUP753esr/5qVP5B9cRRBX5vmWDWJphzs9HX3bD+xteFdPpTg1WthkJ7JLrCZhFjerQ3 root@dc-os



------------------------------------------------------------------------------------------------------


###generate keytab and deploy each host all principal.

#!/bin/sh

## host hd-c1nn
## remove old keytab.
rm -rf hdfs.keytab mapred.keytab yarn.keytab

#generate keytab
kadmin.local xst -norandkey -k hdfs.keytab hdfs/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com hdfs/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com hdfs/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com hdfs/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com hdfs/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com hdfs/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com hdfs/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com
kadmin.local xst -norandkey -k mapred.keytab mapred/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com mapred/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com mapred/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com mapred/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com mapred/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com mapred/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com mapred/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com
kadmin.local xst -norandkey -k yarn.keytab yarn/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com yarn/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com yarn/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com yarn/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com yarn/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com yarn/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com yarn/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com

#deploy keytab
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1nn:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2nn:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1dn1:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c1dn2:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2dn1:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab hd-c2dn2:/etc/hadoop/conf
scp hdfs.keytab yarn.keytab mapred.keytab pdi-n1:/etc/hadoop/conf

# Set file permission
ssh hd-c1nn sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1nn sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1nn sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1nn sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c2nn sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2nn sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2nn sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2nn sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c1dn1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1dn1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1dn1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1dn1 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c1dn2 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c1dn2 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c1dn2 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c1dn2 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c2dn1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2dn1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2dn1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2dn1 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh hd-c2dn2 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh hd-c2dn2 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh hd-c2dn2 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh hd-c2dn2 sudo chmod 400 /etc/hadoop/conf/*.keytab

ssh pdi-n1 sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab 
ssh pdi-n1 sudo chown mapred:hadoop /etc/hadoop/conf/mapred.keytab 
ssh pdi-n1 sudo chown yarn:hadoop /etc/hadoop/conf/yarn.keytab 
ssh pdi-n1n sudo chmod 400 /etc/hadoop/conf/*.keytab

### hdfs log in kerberose again
ssh hd-c1nn sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
ssh hd-c2nn sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
ssh hd-c1dn1 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
ssh hd-c1dn2 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
ssh hd-c2dn1 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
ssh hd-c2dn2 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
ssh pdi-n1 sudo -u hdfs kinit -k -t /etc/hadoop/conf/hdfs.keytab hdfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

--------------------------------------------------------------------------------------------------------

[root@hd-c1nn ~]# tail -200 /var/log/hadoop-hdfs/hadoop-hdfs-namenode-hd-c1nn.traceoncloud.com.log


2018-05-16 14:38:54,222 INFO org.apache.hadoop.ipc.Server: Socket Reader #1 for port 8020: readAndProcess from client 192.168.4.9 threw exception [org.apache.hadoop.security.authorize.AuthorizationException: User hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM (auth:KERBEROS) is not authorized for protocol interface org.apache.hadoop.hdfs.server.protocol.DatanodeProtocol: this service is only accessible by hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM]
2018-05-16 14:38:55,315 INFO org.apache.hadoop.hdfs.server.blockmanagement.CacheReplicationMonitor: Rescanning after 30000 milliseconds
2018-05-16 14:38:55,315 INFO org.apache.hadoop.hdfs.server.blockmanagement.CacheReplicationMonitor: Scanned 0 directive(s) and 0 block(s) in 0 millisecond(s).
2018-05-16 14:38:59,231 INFO SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM (auth:KERBEROS) .

2018-05-16 14:38:59,232 WARN SecurityLogger.org.apache.hadoop.security.authorize.ServiceAuthorizationManager: Authorization failed for hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM (auth:KERBEROS) for protocol=interface org.apache.hadoop.hdfs.server.protocol.DatanodeProtocol: this service is only accessible by hdfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
2018-05-16 14:38:59,233 INFO org.apache.hadoop.ipc.Server: Connection from 192.168.4.9:44113 for protocol org.apache.hadoop.hdfs.server.protocol.DatanodeProtocol is unauthorized for user hdfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM (auth:KERBEROS)

-----------------------------------------------------------------------------------------
### Gen HTTP.keytab

kadmin.local xst -norandkey -k HTTP.keytab HTTP/hd-c1nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com HTTP/pdi-n1.traceoncloud.com


sudo chown hdfs:hadoop /etc/hadoop/conf/hdfs.keytab

ssh hd-c1nn chmod -R HTTP:hadoop /etc/hadoop/conf/HTTP.keytab



### add policy
nano /var/kerberos/krb5kdc/kadm5.acl

hdfs@TRACEONCLOUD.COM                               *
mapred@TRACEONCLOUD.COM                             *
yarn@TRACEONCLOUD.COM                               *
HTTP@TRACEONCLOUD.COM                               *
hdfs                                                *
yarn                                                *
mapred                                              *
HTTP                                                *
clusterkit                                          *
traceon                                             *
clusterkit@TRACEONCLOUD.COM                         *
traceon@TRACEONCLOUD.COM                            *
clusterkit/*@TRACEONCLOUD.COM                       *
traceon/*@TRACEONCLOUD.COM                          *



#Syntex
 > addprinc -randkey hdfs/fully.qualified.domain.name@YOUR-REALM.COM


 > addprinc -randkey hdfs
 > addprinc -randkey yarn
 > addprinc -randkey mapred
 > addprinc -randkey HTTP
 > addprinc -randkey clusterkit
 > addprinc -randkey traceon


 > addprinc -randkey hdfs@TRACEONCLOUD.COM
 > addprinc -randkey yarn@TRACEONCLOUD.COM
 > addprinc -randkey mapred@TRACEONCLOUD.COM
 > addprinc -randkey HTTP@TRACEONCLOUD.COM
 > addprinc -randkey clusterkit@TRACEONCLOUD.COM
 > addprinc -randkey traceon@TRACEONCLOUD.COM


https://archive.cloudera.com/cdh5/cdh/5/hadoop/hadoop-auth/index.html

 	192.168.4.13	hd-c1nn.traceoncloud.com , hd-c1nn
  	192.168.4.11	hd-c2nn.traceoncloud.com , hd-c2nn
  	192.168.4.9	hd-c1dn1.traceoncloud.com , hd-c1dn1
  	192.168.4.14	hd-c1dn2.traceoncloud.com , hd-c1dn2
  	192.168.4.6	hd-c2dn1.traceoncloud.com , hd-c2dn1
  	192.168.4.12	hd-c2dn2.traceoncloud.com , hd-c2dn2
  	192.168.4.10	pdi-n1.traceoncloud.com , pdi-n1



-------------------------------------------------------------------------------


WebHDFS REST API 

https://hadoop.apache.org/docs/r1.0.4/webhdfs.html#SETPERMISSION
/webhdfs/v1/?op=LISTSTATUS: Unauthorized.
curl -i "http://<HOST>:<PORT>/webhdfs/v1/?op=GETHOMEDIRECTORY"
curl -i --negotiate -u "http://203.151.51.64:50070/webhdfs/v1/?op=GETHOMEDIRECTORY"
curl -i --negotiate -u : "http://203.151.51.64:50070/webhdfs/v1/>?op=authorized"
curl -i --negotiate -u : "http://<HOST>:<PORT>/webhdfs/v1/<PATH>?doas=<USER>&op=..."
curl -i --negotiate -u : "http://203.151.51.64:50070/webhdfs/v1/user?doas=hdfs&op=..."

### hive


# Stop hive
service hive-server2 stop 
service hive-metastore stop

### hive principal

kadmin.local addprinc -randkey hive/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hive/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hive/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hive/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hive/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hive/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hive/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM


### hue principal
kadmin.local addprinc -randkey hue/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hue/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hue/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hue/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hue/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hue/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hue/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM


### flume principal
kadmin.local addprinc -randkey flume/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey flume/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey flume/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey flume/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey flume/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey flume/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey flume/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

### gen hive.keytab
kadmin.local xst -norandkey -k hive.keytab hive/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com hive/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com hive/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com hive/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com hive/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com hive/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com hive/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com

### gen hue.keytab
kadmin.local xst -norandkey -k hue.keytab hue/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com hue/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com hue/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com hue/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com hue/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com hue/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com hue/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com



### gen Flume.keytab
kadmin.local xst -norandkey -k flume.keytab flume/hd-c1nn.traceoncloud.com HTTP/hd-c1nn.traceoncloud.com flume/hd-c2nn.traceoncloud.com HTTP/hd-c2nn.traceoncloud.com flume/hd-c1dn1.traceoncloud.com HTTP/hd-c1dn1.traceoncloud.com flume/hd-c1dn2.traceoncloud.com HTTP/hd-c1dn2.traceoncloud.com flume/hd-c2dn1.traceoncloud.com HTTP/hd-c2dn1.traceoncloud.com flume/hd-c2dn2.traceoncloud.com HTTP/hd-c2dn2.traceoncloud.com flume/pdi-n1.traceoncloud.com HTTP/pdi-n1.traceoncloud.com



--------------------------------------------------------------------------------
##hive problem !

Logging initialized using configuration in file:/etc/hive/conf.dist/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive> show tables;
FAILED: SemanticException org.apache.hadoop.hive.ql.metadata.HiveException: org.apache.hadoop.hive.ql.metadata.HiveException: org.apache.thrift.transport.TTransportException

https://community.cloudera.com/t5/Security-Apache-Sentry/Hue-Sentry-tables-Tables-dissapear-when-enable-sentry-in-Hive/m-p/40755#M66

referlink : https://community.cloudera.com/t5/Security-Apache-Sentry/Hue-Sentry-tables-Tables-dissapear-when-enable-sentry-in-Hive/m-p/40755#M66

I finally solved it
The problem was that I had no role at all, and roles created by hue didnt work for some reason.


So I created an admin role via beeline:

 

1.Obtained hive ticket
kinit -k -t /etc/hive/conf/hive.keytab hive/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

2.Connected to hive with beeline using hive keytab.
[root@hd-c1nn ~]# /usr/lib/hive/bin/beeline
which: no hbase in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin)
Beeline version 1.1.0-cdh5.12.1 by Apache Hive
beeline> 

beeline>

!connect jdbc:hive2://hd-c1nn.traceoncloud.com:10000/default;principal=hive/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM

!connect jdbc:hive2://localhost:10000;AuthMech=3;UID=hive;PWD=password

!connect jdbc:hive2://hd-c1nn.traceoncloud.com:10000;AuthMech=3;UID=hive;PWD=password

3.Created the role admin.
beeline>Create role admin;

4.Granted priviledges to admin role.
GRANT ALL ON SERVER server1 TO ROLE admin WITH GRANT OPTION;
Assign the role to a group.

5.GRANT ROLE admin TO GROUP administrators;
After these steps all users within the group administrators are allowed to manage hive priviledges




--------------------------------------------------------------------------------

# Copy this to your my.cnf file. Please change <directory> to the corresponding 
# directory where the files were copied.
[client]
ssl-ca=/etc/ssl/mysql/ca-cert.pem
ssl-cert=/etc/ssl/mysql/client-cert.pem
ssl-key=/etc/ssl/mysql/client-key.pem

[mysqld]
ssl-ca=/etc/ssl/mysql/ca-cert.pem
ssl-cert=/etc/ssl/mysql/server-cert.pem
ssl-key=/etc/ssl/mysql/server-key.pem


--------------------------------------------------------------------------------

#!/bin/sh

### Hue Installation

# 9.1 Install and configure Hue
yum install -y hue

# 9.2 Configure Hue
cp /root/Desktop/Hadoop/config/hue.ini /etc/hue/conf/

# 9.3) Create database for HUE on MariaDB, begin with:
mysql -u root -p < /root/Desktop/Hadoop/config/createHueDB.sql

# 9.5) Prepare Data for migrate
cd /
mkdir logs
chmod 777 logs
sudo mkdir /usr/lib/hue/logs
sudo chown hue:hue /usr/lib/hue/logs
sudo -u hue /usr/lib/hue/build/env/bin/hue syncdb --noinput
sudo -u hue /usr/lib/hue/build/env/bin/hue migrate

# 9.6 Patch some bug in /etc/init.d/hue
patch /etc/init.d/hue /root/Desktop/Hadoop/config/hue.diff

# 9.7) Restart hue service
systemctl daemon-reload
systemctl start hue

# 9.8) HUE Web Browser
# http://namenode1:8888


configobj.DuplicateError: Duplicate keyword name at line 726.


## hue problem.
### can't run hue.ini on kerberos security mode.
ref: https://www.cloudera.com/documentation/enterprise/latest/topics/hue_dbs_mysql.html#concept_wgf_nct_zw__table_zpd_lbx_tw


mysql> SHOW CREATE table hue.auth_permission;

+-----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table           | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+-----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| auth_permission | CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 |

# run mysql command > ALTER TABLE hue.auth_permission DROP FOREIGN KEY content_type_id_refs_id_id value;

mysql> ALTER TABLE hue.auth_permission DROP FOREIGN KEY content_type_id_refs_id_d043b34a;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

ALTER TABLE hue.auth_permission ADD FOREIGN KEY (content_type_id) REFERENCES django_content_type (id);

ALTER TABLE hue.auth_permission ADD FOREIGN KEY (content_type_id_refs_id_d043b34a) REFERENCES django_content_type (d043b34a);

select * from hue.auth_permission where codename like '%content_type_id%';


##edit hue.ini

[desktop]
...
[[database]]
host=Database server host
port=Database server port
engine=Database server type (mysql, postgresql, oracle)
name=Hue database name (or SID)
user=Hue datbase username
password=Hue database password



[desktop]
...
[[database]]
host=localhist
port=3306
engine=mysql
name=hue
user=hue
password=password


-------------------------------------------------------------------------------- 


sqoop import --connect jdbc:mysql://localhost/sakila --username sakila -P \
--table actor -m 1 --direct --append --target-dir /user/clusterkit/member


sqoop import --connect jdbc:mysql://hd-c1nn.traceoncloud.com/sakila --username sakila -P \
--table actor -m 1 --direct --append --target-dir /user/clusterkit/member


--------------------------------------------------------------------------------

### sqoop

sqoop import --connect jdbc:mysql://hd-c1nn.traceoncloud.com/sakila --username sakila -P \
--table actor -m 1 --direct --append --target-dir /user/clusterkit/member

sqoop import --connect jdbc:mysql://hd-c1nn.traceoncloud.com/sakila --username sakila -P \
--table film_actor -m 1 --direct \
--hive-import \
--create-hive-table \
--hive-table film_actor \
--target-dir /user/clusterkit/sakila/film_actor

sqoop import --connect jdbc:mysql://hd-c1nn.traceoncloud.com/sakila --username sakila -P \
--table film -m 1 --direct \
--hive-import \
--create-hive-table \
--hive-table film \
--target-dir /user/clusterkit/sakila/film


--------------------------------------------------------------------------------


Proxy Users for Kerberos-Enabled Clusters
For secure clusters, the proxy users must have Kerberos credentials to impersonate another user.

Proxy users cannot use delegation tokens. If a user is allowed to add its own delegation token to the proxy user UGI, it also allows the proxy user to connect to the service with the privileges of the original user.

If a superuser wants to give a delegation token to a proxy-user UGI, for example, alice, the superuser must first impersonate alice, get a delegation token for alice, and add it to the UGI for the newly created proxy UGI. This way, the delegation token has its owner set to alice.


curl -i  "http://203.151.51.64:14000/webhdfs/v1/user?op=LISTSTATUS"

hdfs dfs -getfacl /user/hdfs/file

hdfs dfs -setfacl -m user:ben:rw- /user/hdfs/file


[root@hd-c1nn ~]# sudo -u hdfs hdfs dfs -getfacl /user/clusterkit
# file: /user/clusterkit
# owner: clusterkit
# group: hadoop
user::rwx
group::r-x
other::r-x

sudo -u hdfs hdfs dfs -setfacl -R -m user:clusterkit:rwx /user/hive/warehouse

https://www.cloudera.com/documentation/enterprise/5-12-x/topics/cdh_sg_hiveserver2_security.html#concept_vxf_pgx_nm



### Configuring Proxy Users to Access HDFS

root
hue
oozie
flume
httpfs
zookeeper
spark
impala
hbase

[root@dc-os ~]# nano /var/kerberos/krb5kdc/kadm5.acl

root/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM                 *
root/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM                 *
root/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM                *
root/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM                *
root/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM                *
root/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM                *
root/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM                  *

oozie/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM                *
oozie/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM                *
oozie/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM               *
oozie/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM               *
oozie/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM               *
oozie/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM               *
oozie/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM                 *

httpfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM               *
httpfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM               *
httpfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM              *
httpfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM              *
httpfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM              *
httpfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM              *
httpfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM                *

zookeeper/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM            *
zookeeper/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM            *
zookeeper/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM           *
zookeeper/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM           *
zookeeper/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM           *
zookeeper/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM           *
zookeeper/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM             *

spark/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM                *
spark/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM                *
spark/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM               *
spark/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM               *
spark/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM               *
spark/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM               *
spark/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM                 *

impala/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM               *
impala/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM               *
impala/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM              *
impala/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM              *
impala/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM              *
impala/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM              *
impala/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM                *

hbase/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM                *
hbase/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM                *
hbase/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM               *
hbase/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM               *
hbase/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM               *
hbase/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM               *
hbase/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM                 *

------------------------------------------------------------------------------


#!/bin/sh
#generate principals

kadmin.local addprinc -randkey root/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey root/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey oozie/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey oozie/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey oozie/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey oozie/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey oozie/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey oozie/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey oozie/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey httpfs/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey httpfs/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey httpfs/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey httpfs/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey httpfs/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey httpfs/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey httpfs/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey zookeeper/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey zookeeper/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey zookeeper/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey zookeeper/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey zookeeper/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey zookeeper/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey zookeeper/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey spark/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey spark/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey spark/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey spark/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey spark/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey spark/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey spark/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey impala/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey impala/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey impala/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey impala/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey impala/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey impala/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey impala/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local addprinc -randkey hbase/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hbase/hd-c2nn.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hbase/hd-c1dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hbase/hd-c1dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hbase/hd-c2dn1.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hbase/hd-c2dn2.traceoncloud.com@TRACEONCLOUD.COM
kadmin.local addprinc -randkey hbase/pdi-n1.traceoncloud.com@TRACEONCLOUD.COM

kadmin.local listprincs

------------------------------------------------------------------------------


[root@dc-os ~]# kadmin
Authenticating as principal root/admin@TRACEONCLOUD.COM with password.


String url = "jdbc:hive2://node1:10000/default;principal=hive/HiveServer2Host@YOUR-REALM.COM"

String url = "jdbc:hive2://hd-c1nn.traceoncloud.com:10000/default;principal=hive/hd-c1nn.traceoncloud.com@TRACEONCLOUD.COM"


	<property>
                <name>hive.server2.authentication</name>
                <value>KERBEROS</value>
        </property>



drwx------    2 hive       hive          6 พ.ค.  31 10:37 d0fdb3f7-4423-4663-9af2-0f06bc8930c3_resources
drwx------    2 hive       hive          6 มิ.ย.   4 17:17 d2f393b0-d2c1-4646-95f2-b80404d0dea8_resources
drwx------    2 hive       hive          6 พ.ค.  31 10:47 d4b266d7-2e9a-45c9-abfe-83268ef7a780_resources
drwx------    2 hive       hive          6 พ.ค.  31 10:36 d4fbe4df-18a3-476d-a558-df424a7d4acf_resources
drwx------    2 hive       hive          6 พ.ค.  31 14:37 d56071f7-d5fe-4b14-9819-1174855fdc27_resources
drwx------    2 hive       hive          6 มิ.ย.   5 12:43 d6977a6f-e528-4db2-a12f-b7c36c7d98b8_resources
drwx------    2 hive       hive          6 พ.ค.  31 11:59 d6cdc7a6-30e5-4700-aa28-546a9dc66b64_resources
drwx------    2 hive       hive          6 พ.ค.  31 14:25 d7bf8dad-1ef8-4322-8711-6d7b74a8cb0c_resources
drwx------    2 hive       hive          6 พ.ค.  31 14:20 d7e19c76-eab0-413f-98d7-fe51847751ad_resources
drwx------    2 hive       hive          6 มิ.ย.   1 16:40 d88e2f42-1d36-4ea6-ac8f-b0a0d8abd7c6_resources
drwx------    2 hive       hive          6 มิ.ย.   5 12:46 d9159680-3b90-49e9-99b3-94410d2eaf3e_resources
drwx------    2 hive       hive          6 มิ.ย.   5 14:47 d960775b-14f4-40ad-a032-8e1179cbd500_resources
drwx------    2 hive       hive          6 พ.ค.  31 11:12 dadf25b7-91e1-4b38-8a5b-c5ab2c39ba4d_resources
drwx------    2 hive       hive          6 พ.ค.  31 11:39 dcc3a1c0-5748-4d25-b909-386d7ba96b84_resources
drwx------    2 hive       hive          6 มิ.ย.   1 16:47 dd2cf3c8-6b43-4dc0-9021-acea81c3dabe_resources
drwx------    2 hive       hive          6 พ.ค.  31 14:42 dfbea059-2ca6-410a-beb4-dbc6d187009c_resources
drwx------    2 hive       hive          6 พ.ค.  31 11:22 e3166fb6-e04b-46d2-ad43-bbfa49092187_resources
drwx------    2 hive       hive          6 มิ.ย.   4 17:01 e3b8d7d1-396e-47eb-b807-d6f7ba68a7c9_resources
drwx------    2 hive       hive          6 พ.ค.  31 12:01 e3d7b333-6f78-4a43-967f-c78dec81fc50_resources
drwx------    2 hive       hive          6 มิ.ย.   1 16:29 e3e5b401-629c-4c39-9328-d7a9e611bca0_resources
drwx------    2 hive       hive          6 มิ.ย.   4 17:05 e480ac20-d657-431f-99e4-75f50fa2559e_resources
drwx------    2 hive       hive          6 มิ.ย.   5 13:09 e56387c4-c626-4c07-8a52-322659464b2a_resources




!connect jdbc:hive2://hostname.com:10000 org.apache.hadoop.hive.jdbc.HiveDriver


/webhdfs/v1/?op=LISTSTATUS



curl "http://203.151.51.64:14000/webhdfs/v1?op=gethomedirectory&user.name=admin"
curl "http://203.151.51.64:14000/webhdfs/v1?op=gethomedirectory&user.name=clusterkit"
/webhdfs/v1/?op=LISTSTATUS


curl "http://203.151.51.64:14000/webhdfs/v1/?op=LISTSTATUS&user.name=admin"


curl -i --negotiate -u : "http://<HOST>:<PORT>/webhdfs/v1/<PATH>?op=..."



curl -i  "http://203.151.51.64:14000/webhdfs/v1/user/admin?op=LISTSTATUS&user.name=admin"




curl -i --negotiate -u : "http://203.151.51.64:14000/webhdfs/v1/?op=gethomedirectory&user.name=admin"

curl -i --negotiate -u : "http://203.151.51.64:14000/webhdfs/v1/?op=LISTSTATUS"




curl -i --negotiate -u : "http://203.151.51.64:14000/webhdfs/v1/user/admin?op=gethomedirectory&user.name=admin"

curl -i --negotiate -u : "http://203.151.51.64:14000/webhdfs/v1/user/clusterkit?op=gethomedirectory&user.name=clusterkit"





------------------------------------------------------------------------------




















