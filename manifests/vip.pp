# == Define: ucarp::vip
#
# Defines a ucarp vip
#
# === Parameters
#
# [*vip_address*]
#   VIP address that UCARP will maintain
#
# [*source_address*]
#   Set's the host address to bind to. Defaults to $::ipaddress
#
# [*options*]
#   Command line string of options to pass to the ucarp daemon
#
define ucarp::vip(
  $vip_address,
  $source_address = $::ipaddress,
  $options = '',
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
