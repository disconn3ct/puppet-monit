#
class monit(
  $use_syslog = false,
  $interval   = 120,
  $httpd      = false,
) {

  class {'monit::package':
    notify  => Class['monit::service'],
  }

  class {'monit::config':
    use_syslog => $use_syslog,
    interval   => $interval,
    httpd      => $httpd,
    notify     => Class['monit::service'],
    require    => Class['monit::package'],
  }

  class {'monit::service':
    require => Class['monit::config'],
  }

}
