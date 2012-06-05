# -*- coding: utf-8 -*-
set :user, "ubuntu"
ssh_options[:keys] = ["/home/ruben/Documentos/respinos.pem"]
set :app_name, "socialsports"
set :branch, "master"
set :repository,  "https://rderoldan1@github.com/hespino1/Proyecto.git"
set :use_sudo, true

role :app, "107.22.95.239"
role :web, "107.22.95.239"
role :db,  "107.22.95.239", :primary => true



# archivos que necesite entre diferentes versiones de la app
# cosas como uploads de archivos y todo eso
set :global_shared_files, %w(public/uploads)


ssh_options[:forward_agent] = true
default_run_options[:pty] = true



################################################################



set :scm, :git
set :scm_verbose, false
set :deploy_via, :checkout
set :rails_env, "production"

# ACÁ PONE DONDE LO QUIERE DESPLEGAR EN EL SERVIDOR
set :deploy_to, "/home/ubuntu/railsapps/#{app_name}"
set :use_sudo,  false
set :keep_releases, 15

namespace :passenger do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :deploy do
  desc "Restart the Passenger system."
  task :restart, :roles => :app do
    passenger.restart
  end


  desc 'Symlink shared configs and folders on each release.'
  task :symlink_shared do
    global_shared_files.each do |shared_file|
      run "rm -rf #{release_path}/#{shared_file}"
      run "ln -nfs #{shared_path}/#{shared_file} #{release_path}/#{shared_file}"
    end
  end

end

after "deploy", "deploy:symlink_shared"
after "deploy:symlink_shared", "deploy:cleanup"

# Instala las gemas de bundler
require 'bundler/capistrano'

# Compilar assets para rails 3.1
load "deploy/assets"

namespace :apache do
  [:stop, :start, :restart, :reload].each do |action|
    desc "#{action.to_s.capitalize} Apache"
    task action, :roles => :web do
      invoke_command "sudo /etc/init.d/apache2 #{action.to_s}", :via => run_method
    end
  end
end