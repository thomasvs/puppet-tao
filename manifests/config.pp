# == Class tao::config
#
# This class is called from tao for service config.
#
class tao::config {
  include ::tao::params

  if ($::tao::params::dpkg == 'rpm') {
    yum::gpgkey { '/etc/pki/rpm-gpg/RPM-GPG-KEY-tao':
      ensure => present,
      source => 'puppet:///modules/tao/RPM-GPG-KEY-tao',
    }
  }

}
