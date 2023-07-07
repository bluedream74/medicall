class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.text :access
      t.string :holiday
      t.string :reserve

      t.timestamps
    end
  end
end
