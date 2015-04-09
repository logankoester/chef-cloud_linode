# Adapted from https://github.com/chef/ohai/blob/master/lib/ohai/plugins/linode.rb
Ohai.plugin(:Linode) do
  provides 'linode', 'cloud'
  depends 'kernel', 'network'

  # Checks for matching linode kernel name
  def has_linode_kernel?
    kernel[:release].split('-').last =~ /linode/
  end

  # Identifies the linode cloud by preferring the hint
  def looks_like_linode?
    hint?('linode') || has_linode_kernel?
  end

  def get_ip_address(name, interface)
    prefixlen = '17' if name == :private_ip
    prefixlen = '24' if name == :public_ip
    if interface_data = network[:interfaces][interface]
      interface_data[:addresses].each do |key, info|
        linode[name] = key if info['family'] == 'inet' && info['prefixlen'] == prefixlen
      end
    end
  end

  collect_data do
    if looks_like_linode?
      linode Mash.new
      interface = network[:interfaces][:default_interface]
      get_ip_address(:public_ip, interface)
      get_ip_address(:private_ip, interface)
      hint?('linode').each{|k,v| linode[k] = v } if hint?('linode').kind_of?( Hash )
    end
  end

end
