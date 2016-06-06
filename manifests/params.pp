# == Class tao::params
#
# This class is meant to be called from tao.
# It sets variables according to platform.
#
class tao::params {
  case $::operatingsystem {
    /^(RedHat|CentOS)$/: {
      $distro = 'centos'
      $pkg = 'rpm'
    }
    /^(Fedora)$/: {
      $distro = 'fedora'
      $pkg = 'rpm'
    }
    /^(Ubuntu)$/: {
      $distro = 'ubuntu'
      $pkg = 'deb'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
