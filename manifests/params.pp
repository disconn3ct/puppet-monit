#
class monit::params {

  case $::osfamily {
    'Debian': {
      $config = '/etc/monit/monitrc'
      $included = '/etc/monit/conf.d'
      $idfile = '/var/lib/monit/id'
      $statefile = '/var/lib/monit/state'
      $basedir = '/var/lib/monit/events'
    }
    'RedHat': {
      $config = '/etc/monit.conf' #/etc/monit/monitrc
      $included = '/etc/monit.d' #/etc/monit/monit.d
      $idfile = '/var/.monit.id' #'/var/lib/monit/id'
      $statefile = '/var/.monit.state' #/var/lib/monit/state
      $basedir = '/var/monit' #/var/lib/monit/events
    }
    default: {
      fail("Class monit does not support ${::operatingsystem}")
    }

  }


}
