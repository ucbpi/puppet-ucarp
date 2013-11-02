# == Class: ucarp::config
#
# Configures ucarp
#
class ucarp::config {
  $password = 'live'
  #$password = $ucarp::password
  $bind_interface = $ucarp::bind_interface
  $source_address = $ucarp::source_address
  $upscript = $ucarp::upscript
  $downcript = $ucarp::downscript

  file { '/etc/ucarp/vip-common.conf':
    ensure  => file,
    mode    => '0400',
    group   => 'root',
    owner   => 'root',
    content => template('ucarp/vip-common.conf.erb'),
  }

  file { '/etc/ucarp':
    ensure  => directory,
    purge   => true,
    recurse => true,
  }
}
