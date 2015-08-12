# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'SpicePlus'
set :repo_url, 'git@github.com:masked-rider-dancho/SpicePlus.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, 'modify'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/SpicePlus'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug
# set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :default_stage, "staging"
set :assets_roles, [:web, :app]

namespace :deploy do

=begin
    deploy:starting
      deploy:check
        git:check
        deploy:check:directories
        deploy:check:linked_dirs
        deploy:check:make_linked_dirs
        deploy:check:linked_files
    deploy:started
    deploy:updating
      git:create_release
      deploy:symlink:shared
        deploy:symlink:linked_files
        deploy:symlink:linked_dirs
    deploy:updated
    deploy:publishing
      deploy:symlink:release
    deploy:published
    deploy:finishing
      deploy:cleanup
    deploy:finished
=end

  before :starting, :upload

  desc "Upload database.yml"
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
      puts "＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊"
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
