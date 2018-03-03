class TruckImage < ActiveRecord::Migration[5.1]
  def change
    create_table :truck_images do |t|
      t.string :notes
      t.string :image_file
      t.integer :truck_id, index: true
      t.timestamps
    end
  end
end
