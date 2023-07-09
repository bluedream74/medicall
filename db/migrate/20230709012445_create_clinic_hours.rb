class CreateClinicHours < ActiveRecord::Migration[7.0]
  def change
    drop_table :clinic_hours, if_exists: true

    create_table :clinic_hours do |t|
      t.references :clinic, null: false, foreign_key: true
      t.integer :day_of_week, null: false
      t.string :session, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.timestamps
    end
  end
end
