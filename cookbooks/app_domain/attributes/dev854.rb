############################################
#            TPAPSAPPD1 SETTINGS           #
############################################

default['APPSERV']['TPAPSAPPD1']['FIDEVM01'] = {
   "DomainName" => "FIDEVM01",
   "Size"       => "large",
   "DBName"     => "FIDEV",
   "WSLPort"    => "6530",
   "JSLPort"    => "6630",
   "JRADPort"   => "9100"
}

default['APPSERV']['TPAPSAPPD1']['FIDEVW01'] = {
   "DomainName" => "FIDEVW01",
   "Size"       => "large",
   "DBName"     => "FIDEV",
   "WSLPort"    => "6500",
   "JSLPort"    => "6600",
   "JRADPort"   => "9100"
}

############################################
#            NYCFINDTST1 SETTINGS          #
############################################

default['APPSERV']['NYCFINDTST1']['FIUDEV'] = {
   "DomainName" => "FIUDEV",
   "Size"       => "large",
   "DBName"     => "FIUDEV",
   "WSLPort"    => "7200",
   "JSLPort"    => "9200",
   "JRADPort"   => "9100"
}

############################################
#            TPAFINDTST1 SETTINGS          #
############################################

#
#THIS IS TEST DATA. NEED TO GET REAL DATA
#

default['APPSERV']['TPAFINDTST1']['FIUDEV'] = {
   "DomainName" => "FIUDEV",
   "Size"       => "large",
   "DBName"     => "FIUDEV",
   "WSLPort"    => "7200",
   "JSLPort"    => "9200",
   "JRADPort"   => "9100"
}

