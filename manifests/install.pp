# == Class tao::install
#
# This class is called from tao for install.
#
class tao::install {

  include ::tao::params

  # for expansion of template
  $distro = $::tao::params::distro

  if ($::tao::params::pkg == 'rpm') {
    yum::repofile { 'tao.repo':
      content => template('tao/tao.repo.erb'),
    }
  }

}
