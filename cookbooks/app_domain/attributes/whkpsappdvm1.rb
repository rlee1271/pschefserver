############################################
# whkpsappdvm1 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['WHKPSAPPDVM1']['APPSERV'] = {
  '854' => { 
#FICAL
    'FICAL_WB01' => {
      'DBNAME'     => 'FICAL',
      'JSLPORT'    => '28100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'FICAL_IB01' => {
      'DBNAME'     => 'FICAL',
      'JSLPORT'    => '28600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
#FIPASS
    'FIPASS_WB01' => {
      'DBNAME'     => 'FIPASS',
      'JSLPORT'    => '24100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'FIPASS_IB01' => {
      'DBNAME'     => 'FIPASS',
      'JSLPORT'    => '24600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
