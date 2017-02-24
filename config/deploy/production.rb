ip = '195.133.147.136'

role :app, ["deploer@#{ip}"]
role :web, ["deploer@#{ip}"]
role :db,  ["deploer@#{ip}"]

server ip, user: 'deploer', roles: %w{web app db}

set :stage, 'production'