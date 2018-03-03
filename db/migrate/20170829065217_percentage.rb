class Percentage < ActiveRecord::Migration[5.1]
  def change
    create_table :percentages do |t|
      t.string :amount  
      t.timestamps
    end
  end 
end
