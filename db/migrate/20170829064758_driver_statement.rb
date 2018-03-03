class DriverStatement < ActiveRecord::Migration[5.1]
  def change
    create_table :driver_statements do |t|
      t.string :notes
      t.integer :driver_user_id 
      t.string :payment_status
      t.date :due_date
      t.decimal :insurance_payment, default: 0
      t.decimal :trailer_rental, default: 0
      t.decimal :truck_rental, default: 0
      t.decimal :other, default: 0
      t.string :payment_notes
      t.timestamps
    end 
  end
end
