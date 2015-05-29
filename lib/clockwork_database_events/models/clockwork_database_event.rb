# Database event model
class ClockworkDatabaseEvent < Sequel::Model
  many_to_one :frequency_period

  # Used by clockwork to schedule how frequently this event should be run
  # Should be the intended number of seconds between executions
  def frequency
    frequency_quantity.send(frequency_period.name.pluralize)
  end
end
