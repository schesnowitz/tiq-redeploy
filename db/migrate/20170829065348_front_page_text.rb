class FrontPageText < ActiveRecord::Migration[5.1]
  def change
    create_table :front_page_texts do |t|
      t.string :string_input
      t.string :text_input
      t.string :image_input
      t.boolean :show_default_image, default: false
      t.integer :front_page_id, index: true

      t.timestamps
    end 
  end
end
