include_recipe 'ohai::default'

ohai 'reload cloud_linode' do
  plugin 'cloud_linode'
  action :reload
end

node.set['linode']['public_ip'] = node['cloud_linode']['public_ip']

node.set['cloud']['public_ips'] = [node['cloud_linode']['public_ip']]
node.set['cloud']['private_ips'] = [node['cloud_linode']['private_ip']]
node.set['cloud']['public_ipv4'] = node['cloud_linode']['public_ip']
node.set['cloud']['local_ipv4'] = node['cloud_linode']['private_ip']
node.set['cloud']['public_hostname'] = node['fqdn']
node.set['cloud']['local_hostname'] = node['hostname']

node.set['cloud_v2']['public_ipv4_addrs'] = [node['cloud_linode']['public_ip']]
node.set['cloud_v2']['public_ipv4'] = node['cloud_linode']['public_ip']

node.save
