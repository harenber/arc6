# = Class: arc_ce6::config
#
#  Thomas Hartmann <thomas.hartmann@desy.de>
#
class arc_ce6::config inherits arc_ce6::params{

  contain grid::common::gsi_config
 
  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

    file { '/etc/arc.conf' :
      content => template('arc_ce6/etc/arc.conf.erb'),
      notify  => [Service['arc-arex']],
      backup  => ".$timestamp",
    }


  ##############################
  #
  # removing ssh host authentication file
  # as it is probably a remnant from the CREAM setup
  #
  # # ----- ssh -----
  # file { '/etc/ssh/shosts.equiv':
  #   source  => 'puppet:///modules/grid/etc/ssh/shosts.equiv',
  # }

  # ----- /opt/edg/var -----
  file { [
    '/opt/edg',
    '/opt/edg/var',
  ]:
    ensure    => directory,
  }
  
  # ----- ARC dirs - to ensure ARC5 and ARC6 consistency -----
  file { $arc_ce_scratchdir:
    ensure    => directory,
  }
  file { $arc_ce_sessiondir:
    ensure    => directory,
  }
  file { ['/etc/lcas/','/etc/lcmaps']:
    ensure    => directory,
  }

  # ----- LCAS -----
  file { '/etc/lcas/ban_users.db' :
    source  => 'puppet:///modules/arc_ce/etc/lcas/ban_users.db',
  }
  file { '/etc/lcas/lcas.db' :
    source  => 'puppet:///modules/arc_ce/etc/lcas/lcas.db',
  }

  # ----- LCMAPS ----
  file { '/etc/lcmaps/lcmaps.db' :
    source  => 'puppet:///modules/arc_ce/etc/lcmaps/lcmaps.db',
  }

}