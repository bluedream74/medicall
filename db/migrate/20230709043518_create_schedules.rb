class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :clinic, null: false, foreign_key: true
      t.integer :day_of_week
      t.integer :session
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
