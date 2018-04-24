############################################
# tpapsapptst1 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTST1']['APPSERV'] = {
  '854' => { 
#FSCV
    'FSCV_WB01' => {
      'DBNAME'     => 'FSCV',
      'JSLPORT'    => '21100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'FSCV_IB01' => {
      'DBNAME'     => 'FSCV',
      'JSLPORT'    => '21600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
