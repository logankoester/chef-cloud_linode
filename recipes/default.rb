include_recipe 'ohai::default'

ohai 'reload cloud_linode' do
  plugin 'cloud_linode'
  action :reload
end
