# = Class: arc_ce6::params
#
#  Thomas Hartmann <thomas.hartmann@desy.de>
#
class arc_ce6::params {

  $timestamp_newline = generate('/bin/date', '+%Y%d%m%H%M%S')
  $timestamp  = inline_template('<%= @timestamp_newline.chomp %>')

  $arc_maxcputime = hiera('arc::maxcputime')
  $arc_maxwalltime = hiera('arc::maxwalltime')

  $arc_ce_defaultqueue = hiera('arc_ce::defaultqueue','PUPPETERROR')
  $arc_ce_nafgpu = hiera('arc_ce::nafgpu',false)

  $arc_ce_lrms = hiera('arc_ce::lrms','PUPPETERROR')

  $arc_ce_sessiondir = hiera('arc_ce::sessiondir','PUPPETERROR')
  $arc_ce_runtimedir = hiera('arc_ce::runtimedir','PUPPETERROR')
  $arc_ce_scratchdir = hiera('arc_ce::scratchdir','PUPPETERROR')
  $arc_ce_jobreport  = hiera('arc_ce::jobreport','PUPPETERROR')
  $arc_ce_jobreport_options = hiera('arc_ce::jobreport_options','PUPPETERROR')
  $arc_ce_benchmark  = hiera('arc_ce::benchmark','PUPPETERROR')
  $arc_ce_physcpu    = hiera('arc_ce::physcpu','PUPPETERROR')
  $arc_ce_logcpu     = hiera ('arc_ce::logcpu','PUPPETERROR')
  $arc_ce_email      = hiera('arc_ce::email','PUPPETERROR')
  $arc_ce_maxslotsperjob = hiera('arc_ce::maxslotsperjob','PUPPETERROR')
  $arc_cluster_alias = hiera('arc::cluster_alias',"DESY-HH ARC CE")
  $arc_opsys         = hiera('arc::opsys',"CentOS-7.8")
  $arc_ce_MaxDiskSpace = hiera('arc::MaxDiskSpace',"500000")

  $arc_ce_authorized_vos  = hiera('arc::authorizedvos',['desy'])

  $arc_ce_rte  = hiera('arc_ce::rte',['ENV/PROXY','ENV/GLITE','ENV/MCORE','APPS/HEP/ATLAS-SITE-LCG','APPS/HEP/ATLAS-MULTICORE-1.0'])
  
}
