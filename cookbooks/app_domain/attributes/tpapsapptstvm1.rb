############################################
# tpapsapptstvm1 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTSTVM1']['APPSERV'] = {
  '854' => { 
#FSCX
    'FSCX_WB01A' => {
      'DBNAME'     => 'FSCX',
      'JSLPORT'    => '23100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'FSCX_IB01' => {
      'DBNAME'     => 'FSCX',
      'JSLPORT'    => '23600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
