require 'capistrano-deploy'

use_recipes :git, :rails, :bundle, :unicorn, :rails_assets, :rvm, :whenever

server '66.228.44.86', :web, :app, :db, :primary => true
set :user, 'villa'
set :repository, 'git@github.com:oleghaidul/villa.git'

set(:deploy_to) { "/home/villa/production" }

after 'deploy:update', 'bundle:install', 'deploy:assets:precompile'
after 'deploy:restart', 'unicorn:stop'
