############################################
#  whkpsappdvm1.timeinc.com SETTINGS       #
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

default['WHKPSAPPDVM1']['WEBSERV'] = {
  '1212' => {
    'FICAL' => { 
      'WB01' => { 
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', 
        'DOMAIN_TYPE' => 'NEW_DOMAIN', 
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', 
        'WEBSITE_NAME' => 'FICAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM1.timeinc.com',
        'JSL_PORT' => '28100',
        'HTTP_PORT' => '8280',
	    'HTTP_PORT_2' => '8282',
      },
      'IB01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'FICAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM1.timeinc.com',
        'JSL_PORT' => '28600',
        'HTTP_PORT' => '8285',
        'IG_NODES' => 'CAL',
      },
      'RPT01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'FICAL',
        'APPSERVER_NAME' => 'WHKPSAPPDVM1.timeinc.com',
        'JSL_PORT' => '28100',
        'HTTP_PORT' => '8288',
      },	  
    },	
    'FIPASS' => { 
      'WB01' => { 
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', 
        'DOMAIN_TYPE' => 'NEW_DOMAIN', 
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', 
        'WEBSITE_NAME' => 'FIPASS',
        'APPSERVER_NAME' => 'WHKPSAPPDVM1.timeinc.com',
        'JSL_PORT' => '24100',
        'HTTP_PORT' => '8240',
	    'HTTP_PORT_2' => '8282',
      },
      'IB01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'FIPASS',
        'APPSERVER_NAME' => 'WHKPSAPPDVM1.timeinc.com',
        'JSL_PORT' => '24600',
        'HTTP_PORT' => '8245',
        'IG_NODES' => 'PASS',
      },
      'RPT01' => { # third level is DOMAIN_POS: WB01, WB02, etc. OR IB01, IB02, OR RPT01, RPT02
        'INSTALL_ACTION' => 'CREATE_NEW_DOMAIN', # CREATE_NEW_DOMAIN or ADD_SITE
        'DOMAIN_TYPE' => 'NEW_DOMAIN', # NEW_DOMAIN or EXISTING_DOMAIN
        'INSTALL_TYPE' => 'SINGLE_SERVER_INSTALLATION', # MULTI_SERVER_INSTALLATION or SINGLE_SERVER_INSTALLATION
        'WEBSITE_NAME' => 'FIPASS',
        'APPSERVER_NAME' => 'WHKPSAPPDVM1.timeinc.com',
        'JSL_PORT' => '24100',
        'HTTP_PORT' => '8248',
      },	  
    },
  },
}
