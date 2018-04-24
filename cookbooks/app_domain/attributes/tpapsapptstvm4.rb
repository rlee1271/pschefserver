############################################
# tpapsapptstvm4 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTSTVM4']['APPSERV'] = {
  '850' => { 
#CRMX
    'CRMXWB02' => {
      'DBNAME'     => 'CRMX',
      'JSLPORT'    => '33300',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'CRMXIB02' => {
      'DBNAME'     => 'CRMX',
      'JSLPORT'    => '33700',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
  '854' => { 
#PAEX
    'PAEX_WB02A' => {
      'DBNAME'     => 'PAEX',
      'JSLPORT'    => '43300',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'PAEX_IB02' => {
      'DBNAME'     => 'PAEX',
      'JSLPORT'    => '43700',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
