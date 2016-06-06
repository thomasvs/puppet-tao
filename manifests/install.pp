# == Class tao::install
#
# This class is called from tao for install.
#
class tao::install {

  include ::tao::params

  if ($::tao::params::pkg == 'rpm') {
    yum::repofile { 'tao.repo':
      content => template('tao/tao.repo.erb'),
    }
  }

}
