# == Class: ucarp::install
#
# Installs the required packages for ucarp
#
class ucarp::install {
  ensure_packages( [ 'ucarp', 'redhat-lsb-core' ] )
}
