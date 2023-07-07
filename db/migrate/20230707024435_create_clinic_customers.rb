class CreateClinicCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :clinic_customers do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
