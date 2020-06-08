# == Class module-arc_ce6
#
# Setting up ARC CE v6
#   fork form ARC CE v5 module-arc_ce
# 
#
class arc_ce6 (
  $email                      = 'grid@desy.de',
  $lrms                       = 'condor',
  $defaultqueue               = 'grid',
  $runtimedir                 = '/etc/arc/runtime',
  $sessiondir		      = '/var/spool/arc/grid',
  $scratchdir                 = '/var/jobs',
  $physcpu                    = 1,
  $logcpu                     = 8,
  $benchmark                  = 0.0,
  $maxslotsperjob             = 8,
  $jobreport                  = 'APEL:https://mq.afroditi.hellasgrid.gr:6163',
  $jobreport_options          = 'archiving:/var/log/arc/apel/,topic:/queue/global.accounting.test.cpu.central,gocdb_name:DESY-HH,benchmark_type:HEPSPEC,benchmark_value:27.08,use_ssl:false',
) inherits arc_ce6::params {


  include arc_ce6::install
  include arc_ce6::config
  include arc_ce6::service
  include arc_ce6::rte


}