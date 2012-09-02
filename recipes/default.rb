service "ssh" do
  supports [:start, :restart, :stop]
end

template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "ssh"), :immediately
end