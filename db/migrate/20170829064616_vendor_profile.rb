class VendorProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_profiles do |t|
      t.string :company_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :telephone
      t.string :fax
      t.string :website
      t.string :logo
      t.string :contact_name
      t.string :email
      t.timestamps
    end
  end
end
 