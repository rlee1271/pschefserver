############################################
# tpapsapptstvm2 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTSTVM2']['APPSERV'] = {
  '854' => { 
#FSCX
    'FSCX_WB02A' => {
      'DBNAME'     => 'FSCX',
      'JSLPORT'    => '23300',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'FSCX_IB02' => {
      'DBNAME'     => 'FSCX',
      'JSLPORT'    => '23700',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
