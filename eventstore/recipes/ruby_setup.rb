execute 'install keyserver' do
    command "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
end
execute 'install rvm' do
    command "\curl -sSL https://get.rvm.io | bash -s stable"
end
execute 'add rvm to profile' do
    command "source /etc/profile.d/rvm.sh"
end