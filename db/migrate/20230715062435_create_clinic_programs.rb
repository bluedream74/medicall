class CreateClinicPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :clinic_programs do |t|
      t.references :clinic, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.integer :weekdays, default: 0, null: false

      t.timestamps
    end
  end
end
