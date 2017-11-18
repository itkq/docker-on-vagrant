# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#set-up-the-repository

execute "apt-get update"

%w(apt-transport-https ca-certificates curl software-properties-common).each do |pkg|
  package pkg
end

execute "Add Docker's official GPG key" do
  command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
end

execute "Add stable Docker repository" do
  command 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"'
  notifies :run, "execute[apt-get update]", :immediately
end

package "docker-ce"

execute "Add ubuntu to docker group" do
  command "usermod -aG docker ubuntu"
end
