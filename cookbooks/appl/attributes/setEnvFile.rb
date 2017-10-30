############ Global SETTINGS ############
default['GlobalEnv'] = {
  'ORACLE_SID'      => 'FSCV',
  'ORACLE_BASE'     => '/apps/oracle',
  'PATH'            => '$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:/usr/ccs/bin:/usr/bin:/usr/ucb:/etc:/bin:/sbin:/usr/openwin/bin:.',
  'LD_LIBRARY_PATH" => "$TUXDIR/lib:$COBDIR/lib:/usr/dt/lib:/usr/openwin/lib:/usr/local/lib',
}


############ setfin92-854.erb SETTINGS ############
default['setfin92-854'] = {
  'ORACLE_SID'      => 'FSCV',
  'ORACLE_HOME'     => '/apps/oracle/product/12.1.0/client_1',
  'COBDIR'          => '/apps/cobol51wp14',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo12.1.1.0',
  'PS_APP_HOME'     => '/apps/psoft/appl/fin92-854'
}

############ setcrm88-850.erb SETTINGS ############
default['setcrm88-850'] = {
  'ORACLE_SID'      => 'CRMV',
  'ORACLE_HOME'     => '/apps/oracle/product/12.1.0/client_1',
  'COBDIR'          => '/apps/cobol51wp14',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo10gR3',
  'PS_APP_HOME'     => '/apps/psoft/appl/crm88-850'
}

############ setprt91-854.erb SETTINGS ############
default['setprt91-854'] = {
  'ORACLE_SID'      => 'PAEV',
  'ORACLE_HOME'     => '/apps/oracle/product/12.1.0/client_1',
  'COBDIR'          => '/apps/cobol51wp14',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo12.1.1.0',
  'PS_APP_HOME'     => '/apps/psoft/appl/prt91-854'
}

