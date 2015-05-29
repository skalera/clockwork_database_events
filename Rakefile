require 'bundler/gem_tasks'

namespace :db do
  desc 'migrate the database to the latest version'
  task :migrate do
    require 'sequel'
    Sequel.extension :migration
    DB = Sequel.connect(ENV.fetch('DATABASE_URL', 'sqlite://'))
    Sequel::Migrator.run(DB, 'db/migrations')
  end

  desc 'seed the database with frequencies'
  task seed: :migrate do
    require 'clockwork_database_events'
    [:second, :minute, :hour, :day, :week, :month].each do |period|
      FrequencyPeriod.create(name: period)
    end
  end
end
