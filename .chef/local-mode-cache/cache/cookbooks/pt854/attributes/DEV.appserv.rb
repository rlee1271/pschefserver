#Attributes for PeopleTools 8.54

default['pt854']['PS_HOME'] = '/apps/psoft/pt854'

############ setfin92-854.erb SETTINGS ############
default['setfin92-854']['ORACLE_SID'] = 'FI91DMO'
default['setfin92-854']['ORACLE_HOME'] = '/apps/oracle/product/11.2.0/client_3'
default['setfin92-854']['ORACLE_BASE'] = '/apps/oracle'
default['setfin92-854']['COBDIR'] = '/apps/cobol_51ws6'
default['setfin92-854']['TUXDIR'] = '/apps/tuxedo/tuxedo12.1.1.0'
default['setfin92-854']['PATH'] = '$ORACLE_HOME/bin:$TUXDIR/bin:$COBDIR/bin:/usr/ccs/bin:/usr/bin:/usr/ucb:/etc:/bin:/sbin:/usr/openwin/bin:.'
default['setfin92-854']['LD_LIBRARY_PATH'] = '$TUXDIR/lib:$COBDIR/lib:/usr/dt/lib:/usr/openwin/lib:/usr/local/lib'

############################################
#            TPAPSAPPD1 SETTINGS           #
############################################

default['APPSERV']['TPAPSAPPD1']['FIDEVM01']['DomainName'] = 'FIDEVM01'
default['APPSERV']['TPAPSAPPD1']['FIDEVM01']['Size'] = 'large'
default['APPSERV']['TPAPSAPPD1']['FIDEVM01']['DBName'] = 'FIDEV'
default['APPSERV']['TPAPSAPPD1']['FIDEVM01']['WSLPort'] = '6530'
default['APPSERV']['TPAPSAPPD1']['FIDEVM01']['JSLPort'] = '6630'
default['APPSERV']['TPAPSAPPD1']['FIDEVM01']['JRADPort'] = '9100'

default['APPSERV']['TPAPSAPPD1']['FIDEVW01']['DomainName'] = 'FIDEVW01'
default['APPSERV']['TPAPSAPPD1']['FIDEVW01']['Size'] = 'large'
default['APPSERV']['TPAPSAPPD1']['FIDEVW01']['DBName'] = 'FIDEV'
default['APPSERV']['TPAPSAPPD1']['FIDEVW01']['WSLPort'] = '6500'
default['APPSERV']['TPAPSAPPD1']['FIDEVW01']['JSLPort'] = '6600'
default['APPSERV']['TPAPSAPPD1']['FIDEVW01']['JRADPort'] = '9100'

############################################
#            NYCFINDTST1 SETTINGS          #
############################################

default['APPSERV']['NYCFINDTST1']['FIUDEV']['DomainName'] = 'FIUDEV'
default['APPSERV']['NYCFINDTST1']['FIUDEV']['Size'] = 'large'
default['APPSERV']['NYCFINDTST1']['FIUDEV']['DBName'] = 'FIUDEV'
default['APPSERV']['NYCFINDTST1']['FIUDEV']['WSLPort'] = '7200'
default['APPSERV']['NYCFINDTST1']['FIUDEV']['JSLPort'] = '9200'
default['APPSERV']['NYCFINDTST1']['FIUDEV']['JRADPort'] = '9100'
