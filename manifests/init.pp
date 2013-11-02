# == Class: ucarp
#
# Manages UCARP configuration
#
class ucarp (
  $password = $ucarp::params::password,
  $bind_interface = values_at( split( $::interfaces, ',' ), 0 ),
  $source_address = $::ipaddress,
  $upscript = $ucarp::params::upscript,
  $downscript = $ucarp::params::downscript,
) inherits ucarp::params {
  include ucarp::install, ucarp::config
}
