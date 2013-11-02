# == Class: ucarp::params
#
# Default parameters for ucarp
#
# === Red Hat:
#
# [*upscript*]: /usr/libexec/ucarp/vip-up
# [*downscript*]: /usr/libexec/ucarp/vip-down
# [*password*]: love
#
class ucarp::params {
  $upscript = '/usr/libexec/ucarp/vip-up'
  $downscript = '/usr/libexec/ucarp/vip-down'
  $password = 'love'
}
