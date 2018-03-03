class LoadDocument < ActiveRecord::Migration[5.1]
  def change
    create_table :load_documents do |t|
      t.string :doc_file
      t.string :file_type
      t.string :note
      t.integer :load_id, index: true
      t.timestamps
    end
  end
end
