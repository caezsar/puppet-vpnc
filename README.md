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

IKE Authmode defaults to `psk`. To change it add a new value for `ike_authmode` variable in hiera.
```
vpnc::ike_authmode: 'hybrid'
```


## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.


If you aren't using changelog, put your release notes here (though you should
consider using changelog). 

