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

  $gateway           = undef,
  $id                = '',
  $secret            = '',
  $username          = '',
  $password          = '',
  $ike_authmode      = 'psk',
  $cafile            = undef,
  $cadir             = undef,
  $localport0        = false,
  $script            = undef,
  $interface_name    = undef,
  $enable_by_systemd = false,

) {

  package { 'vpnc':
    ensure => 'installed',
  }

  ::systemd::unit_file { 'vpnc.service' :
    source => 'puppet:///modules/vpnc/vpnc.systemd',
  }

  if $enable_by_systemd {

    service { 'vpnc' :
      ensure => 'running',
      enable => true,
    }
  }

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
