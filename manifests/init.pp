# Class: tao
# ===========================
#
# Full description of class tao here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class tao {
  # validate parameters here

  class { '::tao::install': } ->
  class { '::tao::config': } ~>
  Class['::tao']
}
