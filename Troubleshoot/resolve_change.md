Fix problem reslove.conf change by inet dns.
===

### Edit a file ifcfg-eth0.

`nano /etc/sysconfig/network-scripts/ifcfg-eth0`

[root@hd-c1nn ~]# `nano /etc/sysconfig/network-scripts/ifcfg-eth0`

```
DEVICE="eth0"
BOOTPROTO="dhcp"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="no"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
DNS1=192.168.8.201     #<ip-your-dns>
DNS2=203.150.213.1
SEARCH="traceoncloud.com"
```

### Check by

[root@hd-c1nn network-scripts]# `nslookup traceoncloud.com`

```
Server:		192.168.8.201
Address:	192.168.8.201#53
```