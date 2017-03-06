ip = '93.95.97.130'

role :app, ["deploy@#{ip}"]
role :web, ["deploy@#{ip}"]
role :db,  ["deploy@#{ip}"]

server ip, user: 'deploy', roles: %w{web app db}

set :stage, 'production'
set :rails_env, 'production'