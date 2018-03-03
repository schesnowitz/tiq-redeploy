class Transaction < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :expense_type
      t.decimal :debit, default: 0.00
      t.decimal :credit, default: 0.00
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :zip 
      t.float :latitude
      t.float :longitude
      t.string :notes
      t.integer :transactionable_id
      t.string  :transactionable_type
      t.string :business_name
      t.timestamps
    end   
  end
end
