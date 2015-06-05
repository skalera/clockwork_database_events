$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['LOGGER'] = '/dev/null'

require 'sequel'
DB = Sequel.sqlite

require 'clockwork_database_events'
ClockworkDatabaseEvents.migrate(DB)

require 'clockwork_database_events/models'
