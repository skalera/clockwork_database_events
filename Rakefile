require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'sequel'

RuboCop::RakeTask.new

namespace :db do
  db = Sequel.connect(ENV.fetch('DATABASE_URL', 'sqlite://'))

  desc 'migrate the database to the latest version'
  task :migrate do
    require 'clockwork_database_events'
    ClockworkDatabaseEvents.migrate(db)
  end

  desc 'seed the database with frequencies'
  task seed: :migrate do
    require 'clockwork_database_events/models'
    ClockworkDatabaseEvents.seed
  end
end
