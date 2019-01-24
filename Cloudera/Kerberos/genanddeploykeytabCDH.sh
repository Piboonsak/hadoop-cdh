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