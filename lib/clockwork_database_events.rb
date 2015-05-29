require 'sequel'
require 'active_support/time'

Sequel::Model.plugin :timestamps, update_on_create: true

require 'clockwork_database_events/version'
require 'clockwork_database_events/models/clockwork_database_event'
require 'clockwork_database_events/models/frequency_period'

# clockwork database events
module ClockworkDatabaseEvents
end
