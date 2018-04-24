############ GLOBAL VARIABLES ############
default['GLOBAL']['PS_HOME_854'] = '/apps/psoft/ptools/pt854'
default['GLOBAL']['SET_ENV_854_FIN'] = '. /home/psoft/setfin92-854'
default['GLOBAL']['PS_HOME_850'] = '/apps/psoft/ptools/pt850'
default['GLOBAL']['SET_ENV_850_CRM'] = '. /home/psoft/setcrm88-850'
default['GLOBAL']['USERID'] = 'APPSERV'
default['GLOBAL']['USERPSWD'] = 'twzVdYRM7pplsaO9noPM7NmiFDgeTtCb3bCyTblAJSk='
default['GLOBAL']['CONNECTID'] = 'timeinc'
default['GLOBAL']['CONNECTPSWD'] = 'hyuqAvhd2cE='

default['GLOBAL']['PT850'] = {
  'PS_HOME'         => '/apps/psoft/ptools/pt850',
  'ORACLE_BASE'     => '/apps/oracle',
#  'ORACLE_HOME'     => '/apps/oracle/product/11.2.0/client_3',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo10gR3',
  'COBDIR'          => '/apps/cobol_51wp16',
  'PATH'            => '$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:$PATH:.',
  'LD_LIBRARY_PATH' => '$TUXDIR/lib:$COBDIR/lib:$ORACLE_HOME/lib:$LD_LIBRARY_PATH',
}
default['GLOBAL']['PT854'] = {
  'PS_HOME'         => '/apps/psoft/ptools/pt854',
  'ORACLE_BASE'     => '/apps/oracle',
#  'ORACLE_HOME'     => '/apps/oracle/product/12.1.0/client_1',
  'TUXDIR'          => '/apps/psoft/tuxedo/tuxedo12.1.1.0',
  'COBDIR'          => '/apps/cobol_51wp16',
  'PATH'            => '$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:$PATH:.',
  'LD_LIBRARY_PATH' => '$TUXDIR/lib:$COBDIR/lib:$ORACLE_HOME/lib:$LD_LIBRARY_PATH',
}

	  if Dir.exist?('/apps/oracle/product/12.1.0/client_1')
        default['GLOBAL']['PT850']['ORACLE_HOME'] = '/apps/oracle/product/12.1.0/client_1'
        default['GLOBAL']['PT854']['ORACLE_HOME'] = '/apps/oracle/product/12.1.0/client_1'
	  elsif Dir.exist?('/apps/oracle/product/12.1.0/client_2')
        default['GLOBAL']['PT850']['ORACLE_HOME'] = '/apps/oracle/product/12.1.0/client_2'
        default['GLOBAL']['PT854']['ORACLE_HOME'] = '/apps/oracle/product/12.1.0/client_2'
	  elsif Dir.exist?('/apps/oracle/product/12.1.0/client_3')
        default['GLOBAL']['PT850']['ORACLE_HOME'] = '/apps/oracle/product/12.1.0/client_3'
        default['GLOBAL']['PT854']['ORACLE_HOME'] = '/apps/oracle/product/12.1.0/client_3'
	  elsif Dir.exist?('/apps/oracle/product/11.2.0/client_3')
        default['GLOBAL']['PT850']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_3'
        default['GLOBAL']['PT854']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_3'
	  elsif Dir.exist?('/apps/oracle/product/11.2.0/client_2')
        default['GLOBAL']['PT850']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_2'
        default['GLOBAL']['PT854']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_2'
	  elsif Dir.exist?('/apps/oracle/product/11.2.0/client_1')
        default['GLOBAL']['PT850']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_1'	  
        default['GLOBAL']['PT854']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_1'	  
	  end

