#### Table of Contents

1. [Description](#description)

1. [Usage - Configuration options and additional functionality](#usage)


## Description
A simple Puppet Module for managing and configuring Cisco VPNC Client in Debian based Lnux distributions.

vpnc is a VPN client for the Cisco 3000 VPN Concentrator, creating a IPSec-like connection as a tunneling network device for the local system. It uses the TUN/TAP driver in Linux kernel 2.4 and above and device tun(4) on BSD. The created connection is presented as a tunneling network device to the local system.


## Usage

Add this class to hiera yaml conf file:
```
classes:
  - '::vpnc'
```

Then add your values for the server:
```
vpnc::gateway: 10.10.10.10
vpnc::id: 'internet'
vpnc::secret: 'internet'
vpnc::username: 'internet'
vpnc::password: 'internet'
```



### Authentication mode: 
IKE Authmode <psk/cert/hybrid>

- `psk`: pre-shared key (default)
- `cert`: server + client certificate (not implemented yet)
- `hybrid`: server certificate + xauth (if built with openssl support)


IKE Authmode defaults to `psk`. To change it add a new value for `ike_authmode` variable in hiera.
```
vpnc::ike_authmode: 'hybrid'
```

To add a filename or path to the CA-PEM-File or CA dir insert one of the follwoing options to hiera:

CA File:
```
vpnc::cafile: '/etc/vpnc/vpn-example-com.pem'
```
 or

CA dir:
```
vpnc::cadir: '/etc/vpnc'
```

Add `local port 0`, in order to use a random source port for each VPN connection. This setting allows multiple VPN connections to run at once. 
```
vpnc::localport0: true
```
 
Add `script /path/to/my_super_script`, in order to use a custom script to disable resolv.conf update for example
```
vpnc::script: '/etc/vpnc/no_resolvconf_update'
```

Add `interface name my_favorite_name`, in order to have a predictable name for the vpn interface
```
vpnc::interface_name: 'my_vpn'
```

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

For CentOS Linux distributions, first install EPEL repos: https://fedoraproject.org/wiki/EPEL

If you aren't using changelog, put your release notes here (though you should
consider using changelog). 

