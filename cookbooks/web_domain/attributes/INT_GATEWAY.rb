############################################
#   INTEGRATION BROKER SETTINGS      	   #
############################################

default['INTEGRATION_BROKER']['GLOBAL'] = {
  'USERID' => 'APPSERV',
  'PASSWORD' => '{V1.1}z9uH/EJ6KPxDlfeo6oy2pw==',
}

default['INTEGRATION_BROKER']['V'] = {
  'TI_FSCV' => {
    'serverURL' => 'TPAPSAPPTST1.timeinc.com:21600',
	'toolsRel' => '8.54.28',
  },
  'TI_CRMV' => {
    'serverURL' => 'TPAPSAPPTST2.timeinc.com:31600',
	'toolsRel' => '8.50.18',
  },
  'TI_PAEV' => {
    'serverURL' => 'TPAPSAPPTST2.timeinc.com:41600',
	'toolsRel' => '8.54.28',
  },
}

default['INTEGRATION_BROKER']['CAL'] = {
  'TI_FICAL' => {
    'serverURL' => 'WHKPSAPPDVM1.timeinc.com:28600',
	'toolsRel' => '8.54.28',
  },
  'TI_CRCAL' => {
    'serverURL' => 'WHKPSAPPDVM2.timeinc.com:38600',
	'toolsRel' => '8.50.18',
  },
  'TI_PACAL' => {
    'serverURL' => 'WHKPSAPPDVM2.timeinc.com:48600',
	'toolsRel' => '8.54.28',
  },
}

default['INTEGRATION_BROKER']['PASS'] = {
  'TI_FIPASS' => {
    'serverURL' => 'WHKPSAPPDVM1.timeinc.com:24600',
	'toolsRel' => '8.54.28',
  },
  'TI_CRPASS' => {
    'serverURL' => 'WHKPSAPPDVM2.timeinc.com:34600',
	'toolsRel' => '8.50.18',
  },
  'TI_PAPASS' => {
    'serverURL' => 'WHKPSAPPDVM2.timeinc.com:44600',
	'toolsRel' => '8.54.28',
  },
}