class Message < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :number
      t.string :text
      t.boolean :inbound
      t.string :user 
      t.float :latitude
      t.float :longitude
      t.string :to_country
      t.string :to_state
      t.string :to_city
      t.string :to_zip
      t.string :from_country
      t.string :from_state
      t.string :from_city
      t.string :from_zip
      t.string :sms_message_sid
      t.string :num_media
      t.string :sms_sid 
      t.integer :company_user_id, index: true
      t.integer :driver_user_id, index: true

      t.timestamps
    end 
  end
end
