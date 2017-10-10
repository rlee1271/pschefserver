############################################
#            TPAFINDPRD2 SETTING           #
############################################

############ FSCG2 SETTINGS ############
default['PRCS']['TPAFINDPRD2']['FSCG2'] = {
   "DomainName" => "FSCG2",
   "DBName"     => "FSCG",
   "PrcsPort"   => "8988",
   "PrcsServer" => "PSUNX2",
   "ServerName" => "",
   "LogOutDir"  => "%PS_SERVDIR%\log_output",
   "SqrBin"     => "%PS_HOME%/bin/sqr/%PS_DB%/bin",
   "PSSQR"      => "/apps/psoft/custom_prod/custom_sqr_stg:%PS_APP_HOME%/sqr:%PS_HOME%/sqr"
}

