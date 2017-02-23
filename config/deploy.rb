# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "metal22.ru"
set :repo_url, "https://github.com/JIuc75Rus/metal"
# Ветка по-умолчанию
set :branch, 'master'
# Директория для деплоя
set :deploy_to, '/home/deploy/applications/metal22.ru'

set :log_level, :info
# Копирующиеся файлы и директории (между деплоями)
set :linked_files, %w{config/database.yml config/settings.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# Ruby свистелки
set :rbenv_type, :user
set :rbenv_ruby, '2.3.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_roles, :all

# А это рекомендуют добавить для приложений, использующих ActiveRecord
set :puma_init_active_record, true

