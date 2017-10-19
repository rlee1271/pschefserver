############################################
#            NYCFINDTST1 SETTINGS          #
############################################

############ NYCFINDTST1 SETTINGS ############
default['APPSERV']['NYCFINDTST1']['PAPASS'] = {
   "DomainName" => "PAPASS",
   "Size"       => "large",
   "DBName"     => "PAPASS",
   "WSLPort"    => "7000",
   "JSLPort"    => "9070",
   "JRADPort"   => "9101"
}

############ NYCFINDTST1 SETTINGS ############
default['APPSERV']['NYCFINDTST1']['FIPASS'] = {
   "DomainName" => "FIPASS",
   "Size"       => "large",
   "DBName"     => "PAPASS",
   "WSLPort"    => "7000",
   "JSLPort"    => "9300",
   "JRADPort"   => "9100"
}
