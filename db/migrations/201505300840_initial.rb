Sequel.migration do
  up do
    create_table(:frequency_periods) do
      primary_key :id
      String :name, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:clockwork_database_events) do
      primary_key :id
      Integer :frequency_quantity
      String :at, null: false, default: ''
      Integer :frequency_period_id, null: false
      foreign_key [:frequency_period_id], :frequency_periods, name: 'clockwork_database_events_frequency_period_id_fkey'

      DateTime :created_at, null: false
      DateTime :updated_at, null: false

      index :frequency_period_id
    end
  end

  down do
    drop_table(:clockwork_database_events)
    drop_table(:frequency_periods)
  end
end
