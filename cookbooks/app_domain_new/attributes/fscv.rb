default['TPAFINDTST1'] = {
  'FSCV_WB01' => {
    'domainType' => 'WB01',
    'DBName'     => 'FSCV',
    'JSLPort'    => '11100',
    'DomainName' => 'FSCV_WB01',
  },
  'FSCV_IB01' => {
    'domainType' => 'IB01',
    'DBName'     => 'FSCV',
    'JSLPort'    => '12100',
    'DomainName' => 'FSCV_IB01',
  },
}

default['CHEFDEV']['FSCV'] = {
    'domainType' => 'WB01',
    'DBName'     => 'FSCV',
    'JSLPort'    => '11100',
    'DomainName' => 'FSCV_WB01',
}
