# Installing Kerberos on Redhat 7

This installation is going to require 2 servers one acts as kerberos KDC server
and the other machine is going to be client. Lets assume the FQDN's are (here
`cw.com` is the domain name, make a note of the domain name here):
  * Kerberos KDC Server: kdc.cw.com
  * Kerberos Client: kclient.cw.com

> Important: Make sure that both systems have their hostnames properly set and
> both systems have the hostnames and IP addresses of both systems in
> `/etc/hosts`. Your server and client must be able to know the IP and hostname
> of the other system as well as themselves.

Pre-Requisites:

Setup and install NTP

```
yum -y install ntp
ntpdate 0.rhel.pool.ntp.org
systemctl start  ntpd.service
systemctl enable ntpd.service
```

> RHEL 7 comes with *systemd* as the default service manager. Here is a handy
> guide for mapping service and chkconfig command [here](http://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet)

Packages required:
  * KDC server package: krb5-server
  * Admin package: krb5-libs
  * Client package: krb5-workstation

Configuration Files:
  * /var/kerberos/krb5kdc/kdc.conf
  * /var/kerberos/krb5kdc/kadm5.acl
  * /etc/krb5.conf

Important Paths:
  * KDC path: /var/kerberos/krb5kdc/

## Installing & Configuring KDC Server:

```
yum -y install krb5-server krb5-libs
```

Primary configuration file is 'krb5.conf':
  * Ensure the default realm is set your domain name in capital case

Sample '/etc/krb5.conf'

```
[libdefaults]
    default_realm = CW.COM
    dns_lookup_realm = false
    dns_lookup_kdc = false
    ticket_lifetime = 24h
    forwardable = true
    udp_preference_limit = 1000000
    default_tkt_enctypes = des-cbc-md5 des-cbc-crc des3-cbc-sha1
    default_tgs_enctypes = des-cbc-md5 des-cbc-crc des3-cbc-sha1
    permitted_enctypes = des-cbc-md5 des-cbc-crc des3-cbc-sha1

[realms]
    CW.COM = {
        kdc = kdc.cw.com:88
        admin_server = kdc.cw.com:749
        default_domain = cw.com
    }

[domain_realm]
    .cw.com = CW.COM
     cw.com = CW.COM

[logging]
    kdc = FILE:/var/log/krb5kdc.log
    admin_server = FILE:/var/log/kadmin.log
    default = FILE:/var/log/krb5lib.log
```

Adjust `/var/kerberos/krb5kdc/kdc.conf` on the KDC:

```
default_realm = CW.COM

[kdcdefaults]
    v4_mode = nopreauth
    kdc_ports = 0

[realms]
    CW.COM = {
        kdc_ports = 88
        admin_keytab = /etc/kadm5.keytab
        database_name = /var/kerberos/krb5kdc/principal
        acl_file = /var/kerberos/krb5kdc/kadm5.acl
        key_stash_file = /var/kerberos/krb5kdc/stash
        max_life = 10h 0m 0s
        max_renewable_life = 7d 0h 0m 0s
        master_key_type = des3-hmac-sha1
        supported_enctypes = arcfour-hmac:normal des3-hmac-sha1:normal des-cbc-crc:normal des:normal des:v4 des:norealm des:onlyrealm des:afs3
        default_principal_flags = +preauth
    }
```

Adjust `/var/kerberos/krb5kdc/kadm5.acl` on KDC:

```
*/admin@CW.COM	    *
```

## Creating KDC database to hold our sensitive Kerberos data

Create the database and set a good password which you can remember. This command
also stashes your password on the KDC so you don’t have to enter it each time
you start the KDC:

```
kdb5_util create -r CW.COM -s
```

> This command may take a while to complete based on the CPU power

Now on the KDC create a admin principal and also a test user (user1):

```
[root@kdc ~]# kadmin.local
kadmin.local:  addprinc root/admin
kadmin.local:  addprinc user1
kadmin.local:  ktadd -k /var/kerberos/krb5kdc/kadm5.keytab kadmin/admin
kadmin.local:  ktadd -k /var/kerberos/krb5kdc/kadm5.keytab kadmin/changepw
kadmin.local:  exit
```

Let’s start the Kerberos KDC and kadmin daemons:

```
systemctl start krb5kdc.service
systemctl start kadmin.service
systemctl enable krb5kdc.service
systemctl enable kadmin.service
```

Now, let’s create a principal for our KDC server and stick it in it’s keytab:

```
[root@kdc ~]# kadmin.local
kadmin.local:  addprinc -randkey host/kdc.cw.com
kadmin.local:  ktadd host/kdc.cw.com
```

## Setup kerberos client

```
yum -y install krb5-workstation
```

Transfer your `/etc/krb5.conf` (which got created from above command) from the
KDC server to the client. Hop onto the client server, install the Kerberos
client package and add some host principals:

```
[root@client ~]# yum install krb5-workstation
[root@client ~]# kadmin -p root/admin
kadmin:  addpinc --randkey host/client.example.com
kadmin:  ktadd host/kdc.example.com
```
