############################################
#            FSCV SETTINGS                 #
############################################

default['TPAFINDTST1']['PSPRCS'] = { # first level is server/node
  'FSCV' => { # second level is environment name
    'PSUNX' => { # third level is PRCSSRVRNAME: PSUNX,PSUNX2,etc.
      'TOOLS' => '854',
      'DBNAME' => 'FSCV',
      'MASTER_SCH' => 'YES', # only one PRCSSRVRNAME can be master
    },
    'PSUNX2' => { # third level is PRCSSRVRNAME: PSUNX,PSUNX2,etc.
      'TOOLS' => '854',
      'DBNAME' => 'FSCV',
      'MASTER_SCH' => 'NO', # only one PRCSSRVRNAME can be master
    },
  },
}
