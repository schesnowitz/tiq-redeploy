class FrontPage < ActiveRecord::Migration[5.1]
  def change
    create_table :front_pages do |t|
      t.string :title
      t.timestamps
    end
  end
end
