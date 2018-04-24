############################################
#   V ProdFix POC SETTINGS                 #
############################################
# first level is server/node
# second level is ptools version
# third level is domain name
# fourth level is PRCSSRVRNAME: PSUNX,PSUNX2,etc.
# fifth level: MASTER_SCH only one PRCSSRVRNAME can be master

default['TPAFINDTST1']['PSPRCS'] = {
  '854' => {
    'FSCV1' => {
      'PSUNX' => {
        'DBNAME' => 'FSCV',
        'MASTER_SCH' => 'YES',
      },
    },
  },
}
