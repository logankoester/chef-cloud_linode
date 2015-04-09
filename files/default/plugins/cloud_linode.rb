# Adapted from https://github.com/chef/ohai/blob/master/lib/ohai/plugins/linode.rb
Ohai.plugin(:CloudLinode) do
  provides 'cloud_linode'
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
        return key if (info['family'] == 'inet') && (info['prefixlen'] == prefixlen)
      end
    end
  end

  collect_data(:linux) do
    if looks_like_linode?
      interface = network[:default_interface]
      cloud_linode Mash.new
      cloud_linode[:private_ip] = get_ip_address(:private_ip, interface)
      cloud_linode[:public_ip] = get_ip_address(:public_ip, interface)
    end
  end

end
