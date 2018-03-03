class TrailerImage < ActiveRecord::Migration[5.1]
  def change
    create_table :trailer_images do |t|
      t.string :notes
      t.string :image_file
      t.integer :trailer_id, index: true
      t.timestamps
    end
  end
end
