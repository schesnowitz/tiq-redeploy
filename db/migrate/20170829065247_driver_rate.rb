class DriverRate < ActiveRecord::Migration[5.1]
  def change
    create_table :driver_rates do |t|
      t.string :amount  

      t.timestamps
    end 
  end
end
