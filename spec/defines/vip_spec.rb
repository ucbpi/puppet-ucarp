require 'spec_helper'

describe('ucarp::vip', :type => :define) do
  describe('vip w/no ipaddress or options specified') do
    let(:title) { '1' }
    let(:facts) {{
      'ipaddress' => '10.0.0.1',
      'interfaces' => 'eth0',
    }}
    let(:params) { { :vip_address => '10.0.1.10' } }
    it {
      should contain_file('/etc/ucarp/vip-001.conf').with({
        'ensure' => 'file',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0400',
      })
    }
  end
end
