############################################
#            TPAPSAPPD1 SETTINGS           #
############################################

default['TPAPSAPPD1']['APPSERV']['FIUPGM01'] = {
   "DomainName" => "FIUPGM01",
   "Size"       => "large",
   "DBName"     => "FIUPG",
   "WSLPort"    => "6550",
   "JSLPort"    => "6650",
   "JRADPort"   => "9100"
}

############################################
#            TPAPSAPPD2 SETTINGS           #
############################################

default['TPAPSAPPD2']['APPSERV']['PAUPGM01'] = {
   "DomainName" => "PAUPGM01",
   "Size"       => "large",
   "DBName"     => "PAUPG",
   "WSLPort"    => "7600",
   "JSLPort"    => "9600",
   "JRADPort"   => "9100"
}

default['TPAPSAPPD2']['APPSERV']['PAUPGW01'] = {
   "DomainName" => "PAUPGW01",
   "Size"       => "large",
   "DBName"     => "PAUPG",
   "WSLPort"    => "7500",
   "JSLPort"    => "9500",
   "JRADPort"   => "9100"
}
