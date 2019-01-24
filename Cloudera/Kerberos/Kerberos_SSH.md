# Setting up SSH to use Kerberos Authentication

**Pre-Req**: Make sure you can issue a `kinit -k host/fqdn@REALM` and get back a kerberos ticket without having to specify a password.

## Step1: Configuring SSH Server

Configure `/etc/ssh/sshd_config` file to include the following lines:

```
KerberosAuthentication yes
GSSAPIAuthentication yes
GSSAPICleanupCredentials yes
UsePAM no
```

Now, restart the ssh daemon.

## Step2: Configure the SSH Client

Configure `/etc/ssh_config` to include following lines:

```
Host *.domain.com
  GSSAPIAuthentication yes
  GSSAPIDelegateCredentials yes
```

> Note: make sure you change the domain to match your environment.