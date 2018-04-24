############################################
# whkpsappdvm2 SETTINGS          		   #
############################################
# first level is server/node
# second level is peopletools version
# third level is domain

default['WHKPSAPPDVM2']['APPSERV'] = {
  '854' => { 
#PACAL
    'PACAL_WB01' => {
      'DBNAME'     => 'PACAL',
      'JSLPORT'    => '48100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'PACAL_IB01' => {
      'DBNAME'     => 'PACAL',
      'JSLPORT'    => '48600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
#PAPASS
    'PAPASS_WB01' => {
      'DBNAME'     => 'PAPASS',
      'JSLPORT'    => '44100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'PAPASS_IB01' => {
      'DBNAME'     => 'PAPASS',
      'JSLPORT'    => '44600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
  '850' => { 
#CRCAL
    'CRCALWB01' => {
      'DBNAME'     => 'CRCAL',
      'JSLPORT'    => '38100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'CRCALIB01' => {
      'DBNAME'     => 'CRCAL',
      'JSLPORT'    => '38600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
#CRPASS
    'CRPASWB01' => {
      'DBNAME'     => 'CRPASS',
      'JSLPORT'    => '34100',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'No',
    },
    'CRPASIB01' => {
      'DBNAME'     => 'CRPASS',
      'JSLPORT'    => '34600',
      'RENSRV'     => 'No',
      'PUBSUB'     => 'Yes',
    },
  },
}
