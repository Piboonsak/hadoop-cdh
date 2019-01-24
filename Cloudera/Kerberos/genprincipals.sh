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