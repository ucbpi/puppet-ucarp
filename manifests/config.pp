# == Class: ucarp::config
#
# Sets up our configuration directory and our common config.
#
class ucarp::config {
  $password = $ucarp::password
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
