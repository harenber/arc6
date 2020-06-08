# = Class: arc_ce6::rte
#
#  Thomas Hartmann <thomas.hartmann@desy.de>
#
class arc_ce6::rte inherits arc_ce6::params {

  File {
    owner   => 'grid',
    group   => 'grid',
    mode    => '0755',
  }

  
  $arc_ce_rte.each |String $thisrte| {
    exec { "/usr/sbin/arcctl rte enable ${thisrte}":
       path   => ['/usr/sbin', '/usr/bin'],
       unless => "/usr/sbin/arcctl rte list -e | /usr/bin/grep ${thisrte}",
       require => File["${arc_ce_runtimedir[-1]}/${thisrte}"]
    }
    file { "${arc_ce_runtimedir[-1]}/${thisrte}" :
      source  => "puppet:///modules/arc_ce${arc_ce_runtimedir[-1]}/${thisrte}",
      require => File["${arc_ce_runtimedir[-1]}/ENV"],
  }

  }


  # take array from hiera, e.g., /etc/arc + /etc/arc/runtime
  file { $arc_ce_runtimedir:
    ensure => directory,
    }

  # and create subdirs under the last runtime path in the runtime dir array - hoping for a proper order...
  file { [
    "${arc_ce_runtimedir[-1]}/ENV",
    "${arc_ce_runtimedir[-1]}/APPS",
    "${arc_ce_runtimedir[-1]}/APPS/HEP",
  ]:
    ensure => directory,
  }


}
