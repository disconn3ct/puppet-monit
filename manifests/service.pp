#
class monit::service {

  service {'monit':
    ensure => running,
    enable => true,
  }

}
