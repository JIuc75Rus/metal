set :application, 'metal22'
set :repo_url, "https://github.com/JIuc75Rus/metal.git"
set :deploy_to, '/var/www/metal22'
set :unicorn_config_path, "#{current_path}/config/production/unicorn/unicorn.rb"
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system') # Строчка есть по умолчанию в deploy.rb, ее просто надо откомментировать
namespace :deploy do
  task :setup do
    before "deploy:migrate", :create_db
    invoke :deploy
  end
  task :create_db do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end
    end
  end
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
end
before :deploy, 'git:push'
before 'deploy:setup', 'git:push'