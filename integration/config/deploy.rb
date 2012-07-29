set :default_stage, "dev"
set :stages, %w(dev staging production)
require 'capistrano/ext/multistage'

default_run_options[:pty] = true

set :application, "application-name"
set :use_sudo, false
set :keep_releases, 5

set :scm, :git
set :deploy_via, :remote_cache
set (:repository) { '#{repository}' }
set (:branch) { '#{branch}' }

