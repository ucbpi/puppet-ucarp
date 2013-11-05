# == Class: ucarp
#
# Manages UCARP configuration
#
# === Parameters
#
# [*password*]
#   Set's a default shared secret password for UCARP to use to communicate
#   between hosts.
#
# [*bind_interface*]
#   Set the interface to bind against. If not set, defaults to the first
#   interface listed in the $::interfaces fact.
#
# [*source_address*]
#   Sets the host address we should bind to. By default, binds to $::ipaddress
#
# [*upscript*]
#   Location of script to run when a host is promoted to MASTER
#
# [*downscript*]
#   Location of script to run when a host is demoted to BACKUP
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
