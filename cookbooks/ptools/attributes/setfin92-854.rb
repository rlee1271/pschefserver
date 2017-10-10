default['pt854']['PS_HOME'] = '/apps/ptools/psoft/pt854'

############ setfin92-854.erb SETTINGS ############
default['setfin92-854'] = {
   "ORACLE_SID"      => "FSCV",
   "ORACLE_HOME"     => "/apps/oracle/product/12.1.0/client_1",
   "ORACLE_BASE"     => "/apps/oracle",
   "COBDIR"          => "/apps/cobol_51ws6",
   "TUXDIR"          => "/apps/psoft/tuxedo/tuxedo12.1.1.0",
   "PATH"            => "$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:/usr/ccs/bin:/usr/bin:/usr/ucb:/etc:/bin:/sbin:/usr/openwin/bin:.",
   "LD_LIBRARY_PATH" => "$TUXDIR/lib:$COBDIR/lib:/usr/dt/lib:/usr/openwin/lib:/usr/local/lib",
   "PS_APP_HOME"     => "/apps/psoft/appl/fin92-854"
}
