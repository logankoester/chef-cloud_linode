require 'spec_helper'

describe 'cloud_linode::default' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
    # stub_data_bag('some_data_bag').and_return(['some_item'])
    # stub_data_bag_item_from_file 'some_data_bag', 'some_item'
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      # node.set['some_attribute'] = {}
    end.converge(described_recipe)
  end

  it 'should create the Ohai plugin' do
    expect(chef_run).to create_ohai_plugin('cloud_linode')
  end
end
