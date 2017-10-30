############################################
#            FSCV SETTINGS      		   #
############################################

default['TPAPSAPPTST1'] = { # first level are servers/nodes
  'FSCV' => { # second level is environment name
    'CREATE_NEW_DOMAIN' => { # third level is CREATE_NEW_DOMAIN or ADD_SITE
      'DOMAIN_TYPE' => 'WB01',
      'SITE_NAME' => 'FSCV',
	},
  },
  'FSCX' => {
    'DOMAIN_TYPE' => 'IB01',
    'SITE_NAME' => 'FSCX',
  },
}
