require 'active_support/time'

Sequel::Model.plugin :timestamps, update_on_create: true

require 'clockwork_database_events/models/clockwork_database_event'
require 'clockwork_database_events/models/frequency_period'

# clockwork database events
module ClockworkDatabaseEvents
  def seed
    %w(second minute hour day week month).each do |period|
      FrequencyPeriod.find_or_create(name: period)
    end
  end

  module_function :seed
end
