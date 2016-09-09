set :stage, :production
set :rails_env, :production
    
server '54.209.56.184', user: 'ubuntu', roles: %w{web app db}, primary: true
