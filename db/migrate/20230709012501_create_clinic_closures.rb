class CreateClinicClosures < ActiveRecord::Migration[7.0]
  def change
    create_table :clinic_closures do |t|
      t.references :clinic, null: false, foreign_key: true
      t.date :closure_date, null: false
      t.string :reason

      t.timestamps
    end
  end
end
