set :application, "railsbridge-site"
set :repository,  "git://github.com/ffmike/railsbridge-site.git"
set :user, "rbadmin"
set :deploy_via, :copy

set :scm, :git
# set :branch, 'staging'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/home/iacez/new_rails_app"

role :app, "72.249.191.152"
role :web, "72.249.191.152"
role :db,  "72.249.191.152", :primary => true

task :after_update_code do
end

set :keep_releases, 3
after "deploy:update", "deploy:cleanup"

namespace :deploy do
  [:start, :stop, :restart].each do |t|
    desc "#{t} task is a no-op for purely static sites"
    task t, :roles => :app do ; end
  end
end