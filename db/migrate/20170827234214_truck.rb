class Truck < ActiveRecord::Migration[5.1] 
  def change
    
      create_table :trucks do |t|
      t.boolean :belongs_to_company, default: false 
      t.date :year    
      t.string :make  
      t.string :model
      t.string :color
      t.string :number 
      t.string :vin
      t.string :image
      t.float :latitude
      t.float :longitude
      t.string :plate
      t.string :plate_state
      t.string :gps_unit_ident
      t.string :notes
      t.string :service_status 
      t.decimal :average_mpg, default: 5.5  
      t.integer :driver_user_id, index: true, unique: true 
      t.string :add_remove_driver
      t.timestamps
    end  

  end
end
