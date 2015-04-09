require 'spec_helper'

describe 'linode::default' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
    # stub_data_bag('some_data_bag').and_return(['some_item'])
    # stub_data_bag_item_from_file 'some_data_bag', 'some_item'
  end

  # context 'in case of foo' do
  #   let(:chef_run) do
  #     ChefSpec::SoloRunner.new do |node|
  #       # node.set['some_attribute'] = {}
  #     end.converge(described_recipe)
  #   end

  #   it 'should include bar' do
  #     expect(chef_run).to include_recipe 'bar'
  #   end

  # end
end
