package "wget"

execute "wget ProofGeneral" do
  cwd node[:proofgeneral][:dir]
  command "wget #{node[:proofgeneral][:url]}#{node[:proofgeneral][:package]}"
  creates "#{node[:proofgeneral][:dir]}#{node[:proofgeneral][:package]}"
end

execute "tar xvfz ProofGeneral" do
  cwd node[:proofgeneral][:dir]
  command "tar xvfz #{node[:proofgeneral][:package]}"
  user node[:proofgeneral][:user]
  group node[:proofgeneral][:group]
  creates "ProofGeneral"
end

link "~/.emacs.d/ProofGeneral" do
  target_file node[:proofgeneral][:target_file]
  to "#{node[:proofgeneral][:dir]}ProofGeneral"
  owner node[:proofgeneral][:user]
  group node[:proofgeneral][:group]
end
