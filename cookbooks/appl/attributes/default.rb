############ Global SETTINGS ############
default['GLOBAL']['PT850'] = {
  'PS_HOME'         => '/apps/psoft/ptools/pt850',
  'ORACLE_BASE'     => '/apps/oracle',
  'ORACLE_HOME'     => '/apps/oracle/product/12.1.0/client_1',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo10gR3',
  'COBDIR'          => '/apps/cobol_51w14',
  'PATH'            => '$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:/usr/ccs/bin:/usr/bin:/usr/ucb:/etc:/bin:/sbin:/usr/openwin/bin:.',
  'LD_LIBRARY_PATH' => '$TUXDIR/lib:$COBDIR/lib:/usr/dt/lib:/usr/openwin/lib:/usr/local/lib:$ORACLE_HOME/lib',
}
default['GLOBAL']['PT854'] = {
  'PS_HOME'         => '/apps/psoft/ptools/pt854',
  'ORACLE_BASE'     => '/apps/oracle',
  'ORACLE_HOME'     => '/apps/oracle/product/12.1.0/client_1',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo12.1.1.0',
  'COBDIR'          => '/apps/cobol_51w14',
  'PATH'            => '$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:/usr/ccs/bin:/usr/bin:/usr/ucb:/etc:/bin:/sbin:/usr/openwin/bin:.',
  'LD_LIBRARY_PATH' => '$TUXDIR/lib:$COBDIR/lib:/usr/dt/lib:/usr/openwin/lib:/usr/local/lib:$ORACLE_HOME/lib',
}
