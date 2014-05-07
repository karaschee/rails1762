require 'bundler/capistrano'
require "rvm/capistrano"

$SERVER = '192.168.11.127'

set :application, "rails1762"
set :repository,  "ssh://git@#{$SERVER}:4321/opt/git/rails1762.git"
set :deploy_to, "/var/www/rails1762"
set :scm, :git
set :branch, "master"
set :user, "bill"
set :group, "deployers"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 4321 }
set :keep_releases, 5
default_run_options[:pty] = true
server "#{$SERVER}", :app, :web, :db, :primary => true

# set :normalize_asset_timestamps, false

set :rvm_type, :local
set :rvm_ruby_string, "ruby-2.0.0-p195"

# disable 
set :bundle_dir, ''
set :bundle_flags, '--system --quiet'



namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Symlink shared config files"
  task :symlink_config_files do
    run "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ release_path }/config/database.yml"
  end

  desc "Restart applicaiton"
  task :restart do
    # run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
    run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
  end
end

# before 'deploy', 'rvm:install_ruby'

before "deploy:assets:update_asset_mtimes", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
