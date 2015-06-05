require 'logger'
require 'active_support/time'

Sequel::Model.plugin :timestamps, update_on_create: true

require 'clockwork_database_events/models/clockwork_database_event'
require 'clockwork_database_events/models/frequency_period'

# clockwork database events
module ClockworkDatabaseEvents
  def seed
    logger = Logger.new(ENV['LOGGER'] || STDOUT)
    logger.debug('seeding frequency table')
    %w(second minute hour day week month).each do |period|
      FrequencyPeriod.find_or_create(name: period) do
        logger.info("created #{period}")
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
