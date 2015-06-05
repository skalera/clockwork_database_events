require 'active_support/time'

Sequel::Model.plugin :timestamps, update_on_create: true

require 'clockwork_database_events/models/clockwork_database_event'
require 'clockwork_database_events/models/frequency_period'

# clockwork database events
module ClockworkDatabaseEvents
  def seed
    puts 'seeding frequecy table...'
    %w(second minute hour day week month).each do |period|
      FrequencyPeriod.find_or_create(name: period) do
        puts "created #{period}"
      end
    end
  end

  module_function :seed

  def db=(database)
    FrequencyPeriod.db = database
    ClockworkDatabaseEvent.db = database
  end

  module_function :db=
end
