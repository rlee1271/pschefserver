############################################
#            NYCPSAPPP1 SETTINGS           #
############################################

default['NYCPSAPPP1']['PT850'] = false
default['NYCPSAPPP1']['PT854'] = true

############ F01M01 SETTINGS ############
default['APPSERV']['NYCPSAPPP1']['F01M01'] = {
   "DomainName" => "F01M01",
   "Size"       => "large",
   "DBName"     => "FSCP",
   "WSLPort"    => "6330",
   "JSLPort"    => "6430",
   "JRADPort"   => "9100"
}

############ F01W01 SETTINGS ############
default['APPSERV']['NYCPSAPPP1']['F01W01'] = {
   "DomainName" => "F01W01",
   "Size" 	=> "large",
   "DBName" 	=> "FSCP",
   "WSLPort" 	=> "6300",
   "JSLPort" 	=> "6400",
   "JRADPort" 	=> "9100"
}

############ F01W02 SETTINGS ############
default['APPSERV']['NYCPSAPPP1']['F01W02'] = {
   "DomainName" => "F01W02",
   "Size"       => "large",
   "DBName"     => "FSCP",
   "WSLPort"    => "6310",
   "JSLPort"    => "6410",
   "JRADPort"   => "9100"
}

############################################
#            NYCPSAPPP2 SETTINGS           #
############################################

############ F02M01 SETTINGS ############
default['APPSERV']['NYCPSAPPP2']['F02M01'] = {
   "DomainName" => "F02M01",
   "Size"       => "large",
   "DBName"     => "FSCP",
   "WSLPort"    => "6330",
   "JSLPort"    => "6430",
   "JRADPort"   => "9100"
}

############ F02W01 SETTINGS ############
default['APPSERV']['NYCPSAPPP2']['F02W01'] = {
   "DomainName" => "F02W01",
   "Size"       => "large",
   "DBName"     => "FSCP",
   "WSLPort"    => "6300",
   "JSLPort"    => "6400",
   "JRADPort"   => "9100"
}

############ F02W02 SETTINGS ############
default['APPSERV']['NYCPSAPPP2']['F02W02'] = {
   "DomainName" => "F02W02",
   "Size"       => "large",
   "DBName"     => "FSCP",
   "WSLPort"    => "6310",
   "JSLPort"    => "6410",
   "JRADPort"   => "9100"
}
