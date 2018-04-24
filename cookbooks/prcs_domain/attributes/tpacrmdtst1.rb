############################################
#   V ProdFix POC SETTINGS                 #
############################################
# first level is server/node
# second level is ptools version
# third level is domain name
# fourth level is PRCSSRVRNAME: PSUNX,PSUNX2,etc.
# fifth level: MASTER_SCH only one PRCSSRVRNAME can be master

default['TPACRMDTST1']['PSPRCS'] = {
  '850' => {
    'CRMV1' => {
      'PSUNX' => {
        'DBNAME' => 'CRMV',
        'MASTER_SCH' => 'YES',
      },
    },
  },
  '854' => {
    'PAEV1' => {
      'PSUNX' => {
        'DBNAME' => 'PAEV',
        'MASTER_SCH' => 'YES',
      },
    },
  },
}
