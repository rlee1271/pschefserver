############################################
#            CRMV SETTINGS                 #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['TPAPSAPPTST2'] = { # first level is server/node
  '850' => { # second level is peopletools version
    'CRMVWB01' => { # third level is domain
      'DBNAME'     => 'CRMV',
      'JSLPORT'    => '31100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'CRMVIB01' => {
      'DBNAME'     => 'CRMV',
      'JSLPORT'    => '31600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
