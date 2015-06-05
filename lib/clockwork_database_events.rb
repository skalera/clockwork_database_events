require 'sequel'
require 'faraday'
require 'diplomat'
require 'clockwork_database_events/version'

# clockwork database events
module ClockworkDatabaseEvents
  def migrate(db)
    require 'sequel'
    Sequel.extension :migration
    migrations = File.expand_path('../../db/migrations', __FILE__)
    return if Sequel::Migrator.is_current?(db, migrations)
    Sequel::Migrator.run(db, migrations)
  end

  module_function :migrate
end
