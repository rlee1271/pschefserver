############################################
#            FSCV SETTINGS                 #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTST1'] = { # first level is server/node
  '854' => { # second level is peopletools version
    'FSCV_WB01' => { # third level is domain
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
