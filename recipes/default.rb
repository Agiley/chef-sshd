template "ssh" do
  path "/etc/ssh/sshd_config"
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0644
end

service "ssh" do
  supports [:start, :restart, :stop]
  action [:enable]
  provider Chef::Provider::Service::Upstart if (node["platform"] == "ubuntu" && node["platform_version"].to_f >= 9.10)
  subscribes :restart, "template[ssh]", :immediately
end