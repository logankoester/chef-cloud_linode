include_recipe 'ohai::default'

ohai 'reload linode' do
  plugin 'linode'
  action :reload
end
