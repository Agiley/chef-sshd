template "ssh" do
  path "/etc/ssh/sshd_config"
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0644
end

service_provider = platform?('ubuntu') ? service_provider = Chef::Provider::Service::Systemd : nil

service "ssh" do
  provider service_provider unless service_provider.nil?
  supports    [:start, :restart, :stop]
  action      [:enable]
  subscribes  :restart, "template[ssh]", :immediately
end
