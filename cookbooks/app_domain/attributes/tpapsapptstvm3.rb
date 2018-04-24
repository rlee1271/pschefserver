############################################
# tpapsapptstvm3 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTSTVM3']['APPSERV'] = {
  '850' => { 
#CRMX
    'CRMXWB01' => {
      'DBNAME'     => 'CRMX',
      'JSLPORT'    => '33100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'CRMXIB01' => {
      'DBNAME'     => 'CRMX',
      'JSLPORT'    => '33600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
  '854' => { 
#PAEX
    'PAEX_WB01A' => {
      'DBNAME'     => 'PAEX',
      'JSLPORT'    => '43100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'PAEX_IB01' => {
      'DBNAME'     => 'PAEX',
      'JSLPORT'    => '43600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
