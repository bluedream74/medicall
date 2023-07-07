class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :phone_number
      t.string :patient_number
      t.string :name
      t.boolean :is_white_list
      t.boolean :is_black_list

      t.timestamps
    end
  end
end
