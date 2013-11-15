require 'spec_helper'

describe( 'ucarp', :type => :class ) do 
  let(:facts) {{
    'interfaces' => 'eth0',
    'ipaddress' => '10.0.0.1',
  }}
  it do
    should contain_ucarp__install
    should contain_ucarp__config
  end
end
