require 'spec_helper'

describe ClockworkDatabaseEvents do
  it 'has a version number' do
    expect(ClockworkDatabaseEvents::VERSION).not_to be nil
  end

  it 'should connect to the database' do
    expect(ClockworkDatabaseEvents.connect('sqlite:/')).to be_an_instance_of(Sequel::SQLite::Database)
  end
end
