# Class: vpnc
# ===========================
#
# Full description of class vpnc here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'vpnc':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
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

  $gateway		= undef,
  $id			= '',
  $secret		= '',
  $username		= '',
  $password		= '',
  $ike_authmode		= 'psk',
  $cafile		= undef,
  $cadir		= undef,
  $localport0 = false,
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
}
