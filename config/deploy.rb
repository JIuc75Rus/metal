# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "metal22.ru"
set :repo_url, "https://github.com/JIuc75Rus/metal.git"
# Ветка по-умолчанию
set :branch, 'master'
# Директория для деплоя
set :deploy_to, '/home/deploy/applications/metal22.ru'

set :log_level, :info
# Копирующиеся файлы и директории (между деплоями)
set :linked_files, %w{config/database.yml}
set :linked_files, %w{config/settings.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# Ruby свистелки
set :rbenv_type, :user
set :rbenv_ruby, '2.3.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_roles, :all

# А это рекомендуют добавить для приложений, использующих ActiveRecord
set :puma_init_active_record, true
namespace :deploy do

  task :copy_config do
    on release_roles :app do |role|
      fetch(:linked_files).each do |linked_file|
        user = role.user + "@" if role.user
        hostname = role.hostname
        linked_files(shared_path).each do |file|
          run_locally do
            execute :rsync, "config/#{file.to_s.gsub(/.*\/(.*)$/,"\\1")}", "#{user}#{hostname}:#{file.to_s.gsub(/(.*)\/[^\/]*$/, "\\1")}/"
          end
        end
      end
    end
  end

end
before "deploy:check:linked_files", "deploy:copy_config"