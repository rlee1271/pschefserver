############################################
#            FSCV SETTINGS      		   #
############################################
# first level is server/node
# second level is environment name
# third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
# CREATE_NEW_DOMAIN or ADD_SITE
# NEW_DOMAIN or EXISTING_DOMAIN
# MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
# HTTP_PORT_2 only 

default['TPAPSAPPTST1']['WEBSERV'] = { 
  'FSCV' => { 
    'WB01' => { 
      'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', 
      'DOMAIN_TYPE' => 'NEW_DOMAIN', 
      'INSTALL_TYPE' => 'MULTI_SERVER_INSTALLATION', 
      'WEBSITE_NAME' => 'FSCV',
      'APPSERVER_NAME' => 'tpapsapptst1.timeinc.com',
      'JSL_PORT' => '21100',
      'HTTP_PORT' => '8210',
	  'HTTP_PORT_2' => '8212',
    },
    'IB01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
      'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
      'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
      'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
      'WEBSITE_NAME' => 'FSCV',
      'APPSERVER_NAME' => 'tpapsapptst1.timeinc.com',
      'JSL_PORT' => '21600',
      'HTTP_PORT' => '8215',
    },
    'RPT01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
      'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
      'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
      'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
      'WEBSITE_NAME' => 'FSCV',
      'APPSERVER_NAME' => 'tpapsapptst1.timeinc.com',
      'JSL_PORT' => '21100',
      'HTTP_PORT' => '8218',
    },
  },
}
