class CompanyProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :company_profiles do |t|
      t.string :company_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip  
      t.string :telephone
      t.string :fax
      t.string :website
      t.string :logo
      t.string :broker_mc_number
      t.string :carrier_mc_number
      t.string :us_dot_number
      t.string :updated_by
      t.string :contact
      t.string :email 
      t.timestamps 
    end
  end
end
