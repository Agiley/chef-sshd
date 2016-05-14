template "ssh" do
  path "/etc/ssh/sshd_config"
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0644
end

service_provider = nil

if platform?('ubuntu')
  if Chef::VersionConstraint.new('>= 15.04').include?(node['platform_version'])
    service_provider = Chef::Provider::Service::Systemd
  elsif Chef::VersionConstraint.new('>= 12.04').include?(node['platform_version'])
    service_provider = Chef::Provider::Service::Upstart
  end
end

service "ssh" do
  provider service_provider if platform?('ubuntu')
  supports    [:start, :restart, :stop]
  action      [:enable]
  subscribes  :restart, "template[ssh]", :immediately
end
