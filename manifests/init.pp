# Class: vpnc
# Authors
# -------
#
# Author Name <caezsar@yahoo.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class vpnc (

  $gateway    = undef,
  $id      = '',
  $secret    = '',
  $username    = '',
  $password    = '',
  $ike_authmode  = 'psk',
  $cafile    = undef,
  $cadir    = undef,
  $localport0 = false,
  $script = undef,
)

{ package { 'vpnc':
    ensure => 'installed',
  }

#  service { 'vpnc':
#    ensure     => stopped,
#    hasstatus  => false,
#    hasrestart => false,
#  }

  file { '/etc/vpnc/default.conf':
    mode    => '0600',
    owner   => root,
    group   => root,
    content => template('vpnc/default.conf.erb'),
    require => Package['vpnc'],
}

  file { '/etc/vpnc/no_resolvconf_update':
    mode    => '0755',
    owner   => root,
    group   => root,
    source  => 'puppet:///modules/vpnc/no_resolvconf_update',
    require => Package['vpnc'],
}
}
