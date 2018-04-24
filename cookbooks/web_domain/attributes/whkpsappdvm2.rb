############################################
#  whkpsappdvm2.timeinc.com SETTINGS       #
############################################
# first level is server/node
# second level is weblogic version
# third level is environment name
# fourth level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
# CREATE_NEW_DOMAIN or ADD_SITE
# NEW_DOMAIN or EXISTING_DOMAIN
# MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
# HTTP_PORT_2 only for Multi server 
# IG_NODES required for any IBxx servers

default['WHKPSAPPDVM2']['WEBSERV'] = {
  '1212' => {
    'PACAL' => { 
      'WB01' => { 
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', 
        'DOMAIN_TYPE' => 'NEW_DOMAIN', 
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', 
        'WEBSITE_NAME' => 'PACAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM2.timeinc.com',
        'JSL_PORT' => '48100',
        'HTTP_PORT' => '8480',
	    'HTTP_PORT_2' => '8482',
      },
      'RPT01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'PACAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM2.timeinc.com',
        'JSL_PORT' => '48100',
        'HTTP_PORT' => '8488',
      },	  
    },	
    'PAPASS' => { 
      'WB01' => { 
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', 
        'DOMAIN_TYPE' => 'NEW_DOMAIN', 
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', 
        'WEBSITE_NAME' => 'PAPASS',
        'APPSERVER_NAME' => 'WHKPSAPPDVM2.timeinc.com',
        'JSL_PORT' => '44100',
        'HTTP_PORT' => '8440',
	    'HTTP_PORT_2' => '8442',
      },
      'RPT01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'PAPASS',
        'APPSERVER_NAME' => 'WHKPSAPPDVM2.timeinc.com',
        'JSL_PORT' => '44100',
        'HTTP_PORT' => '8448',
      },	  
    },	
  },
  '1036' => {
    'CRCAL' => { 
      'WB01' => { 
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', 
        'DOMAIN_TYPE' => 'NEW_DOMAIN', 
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', 
        'WEBSITE_NAME' => 'CRCAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM2.timeinc.com',
        'JSL_PORT' => '38100',
        'HTTP_PORT' => '8380',
      },
      'RPT01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'CRCAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM2.timeinc.com',
        'JSL_PORT' => '38100',
        'HTTP_PORT' => '8388',
      },	  
    },
  },
}
