############################################
#            CRMV SETTINGS                 #
############################################

default['TPACRMDTST1']['PSPRCS'] = { # first level is server/node
  'CRMV' => { # second level is environment name
    'PSUNX' => { # third level is PRCSSRVRNAME: PSUNX,PSUNX2,etc.
      'TOOLS' => '850',
      'DBNAME' => 'CRMV',
      'MASTER_SCH' => 'YES', # only one PRCSSRVRNAME can be master
    },
  },
}
