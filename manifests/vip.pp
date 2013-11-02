# == Define: ucarp::vip
#
# Defines a ucarp vip
#
define ucarp::vip(
  vip_address,
  source_address = $::ipaddress,
  options = '',
) {
  require ucarp::config

  $name_r = lead( $name, 3 )

  file { "/etc/ucarp/vip-${name_r}.conf":
    ensure  => file,
    content => template('ucarp/vip.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
  }

  Class['ucarp'] -> Ucarp::Vip[$name]
}
