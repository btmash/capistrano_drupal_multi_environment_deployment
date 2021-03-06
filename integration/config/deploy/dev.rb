set :rails_env, "dev"

set :application, "application.name"
set :deploy_to, "/path/to/#{application}"
set :domain, "dev.domain"
set :user, "username"
set :shared_assets, %w[.htaccess sites/sites.php sites/domain.com]
set :archive_dir, "sites/dev.domain/files/drush_archive"

set :repository, "http://path/go/git/repository.git"
set :branch, "master"
set :db_name, "application_db_name"

role :master, domain
role :app, domain
role :web, domain
role :db, domain, :primary => true

