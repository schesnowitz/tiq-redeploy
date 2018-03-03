class Address < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :address_category_id, index: true 
      t.string :type
      t.float :latitude
      t.float :longitude
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :company 
      t.string :contact
      t.string :phone
      t.string :notes
      t.string :pick_up_delivery
      t.date :pick_up_date
      t.decimal :miles
      t.integer :load_id, index: true   
      t.integer :trailer_id, index: true 
      t.integer :truck_id, index: true 
      t.integer :driver_checkin_id, index: true 
      t.integer :driver_user_id, index: true 
      t.integer :company_user_id, index: true  
   
      t.timestamps
    end 
  end
end
