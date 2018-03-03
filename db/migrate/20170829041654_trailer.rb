class Trailer < ActiveRecord::Migration[5.1]
  def change
    create_table :trailers do |t|
      t.string :trailer_type
      t.date :year     
      t.string :make 
      t.string :model
      t.string :color
      t.string :number 
      t.string :service_status
      t.string :vin
      t.string :image 
      t.string :notes
      t.string :length
      t.string :door_type
      t.float :latitude
      t.float :longitude
      t.string :plate
      t.string :plate_state
      t.boolean :has_reefer
      t.integer :driver_user_id, index: true
      t.string :gps_unit_ident
      t.string :add_remove_driver 
      t.timestamps
    end
  end
end
