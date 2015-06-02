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

  def connect(db_url=url)
    Sequel.connect(db_url)
  end

  module_function :connect

  def url
    if ENV['SKALERA_DB_URL']
      ENV['SKALERA_DB_URL']
    elsif ENV['JENKINS_HOME']
      'sqlite:/' # for running tests in jenkins
    else
      # TODO: user, password & db should be retrieved from consul
      "postgres://skalera:skalera@#{host}/events"
    end
  end

  module_function :url

  def host
    consul = ENV['CONSUL'] || 'consul'
    Diplomat.configuration.url = "http://#{consul}:8500"

    postgres_config = Diplomat::Service.get('postgres')
    postgres_config.Address
  rescue Faraday::ConnectionFailed => e
    puts "unable to lookup '#{consul}': #{e.message}"
    raise e
  end

  module_function :host
end
