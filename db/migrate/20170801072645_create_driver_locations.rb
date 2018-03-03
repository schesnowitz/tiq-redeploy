class CreateDriverLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :driver_locations do |t|
      t.string :driver_email
      t.string :the_parse_id
      t.float :latitude
      t.float :longitude
      t.float :speed
      t.float :bearing 
      t.datetime :parse_created_at
      t.datetime :parse_updated_at 
      t.integer :driver_user_id, index: true 
      t.timestamps
    end
  end
end
 