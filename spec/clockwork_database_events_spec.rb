require 'spec_helper'

describe ClockworkDatabaseEvents do
  it 'has a version number' do
    expect(ClockworkDatabaseEvents::VERSION).not_to be nil
  end

  it 'should seed the database' do
    expect {
      ClockworkDatabaseEvents.migrate(DB)
      ClockworkDatabaseEvents.seed
    }.to change { FrequencyPeriod.all.size }.by(6)
  end
end
