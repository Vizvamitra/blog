role :app, %w{deploy@vizvamitra.ru}
role :web, %w{deploy@vizvamitra.ru}
role :db,  %w{deploy@vizvamitra.ru}


set :application, 'blog'
set :deploy_to, "/srv/www/#{fetch :application}/"


set :unicorn_rack_env, :production
set :keep_releases, 20


server 'vizvamitra.ru', user: 'deploy', roles: %w{web app}


set :rack_env, 'production'
set :rails_env, 'production'