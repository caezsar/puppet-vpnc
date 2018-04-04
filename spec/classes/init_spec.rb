require 'spec_helper'
describe 'vpnc' do
  context 'with default values for all parameters' do
    it { should contain_class('vpnc') }
  end
end
