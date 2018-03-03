class Load < ActiveRecord::Migration[5.1]
  def change
create_table :loads do |t|
      t.boolean :has_multiple_pd, default: false  
      t.string :commodity
      t.string :weight
      t.string :units
      t.string :load_size
      t.decimal :miles, default: 0  
      t.decimal :invoice_price, default: 0.00 
      t.decimal :booking_fee, default: 0.00 
      t.decimal :percent_deducted      
      t.decimal :total_company_expenses
      t.decimal :rate_to_owner_operator
      t.decimal :percent_coverted_to_dollars, default: 0.00  
      t.decimal :driver_cents_pm
      t.decimal :rate_after_booking_fee, default: 0.00 
      t.decimal :agent_fee, default: 0.00 
      t.date :pick_up_date
      t.time :pick_up_time
      t.string :broker_shipper_load_id
      t.string :pick_up_notes
      t.date :delivery_date
      t.time :delivery_time
      t.string :delivery_notes      
      t.string :equipment_type
      t.string :status_name 
      t.integer :company_user_id, index: true
      t.integer :driver_user_id, index: true
      t.integer :company_profile_id, index: true       
      t.string :updated_by
      t.string :special_instructions 
      t.string :dimentions
      t.string :origin_street
      t.string :origin_city  
      t.string :origin_state
      t.string :origin_zip
      t.string :origin_phone
      t.string :origin_contact      
      t.float :origin_latitude
      t.float :origin_longitude
      t.string :destination_street
      t.string :destination_city  
      t.string :destination_state
      t.string :destination_zip
      t.string :destination_phone 
      t.string :destination_contact        
      t.float :destination_latitude
      t.float :destination_longitude 
      t.string :shipper_company_name 
      t.string :receiver_company_name
      t.integer :driver_statement_id, index: true
      t.integer :percentage_id
      t.decimal :national_average_diesel_price
      t.decimal :estimated_diesel_cost  
      t.decimal :truck_mpg, default: 5.5 
      t.date :truck_year
      t.string :truck_number
      t.string :truck_make
      t.string :truck_model
      t.string :truck_color
      t.string :truck_plate
      t.string :truck_state
      t.string :truck_vin
      t.string :trailer_number 
      t.date :trailer_year
      t.string :trailer_make
      t.string :trailer_type
      t.string :trailer_length
      t.string :trailer_plate
      t.string :trailer_state
      t.string :trailer_vin
      t.string :trailer_door_type
      t.decimal :pounds
      t.decimal :kilos
      t.boolean :is_pounds, default: false
      t.boolean :is_kilos, default: false
      t.boolean :is_hazmat, default: false
      t.boolean :is_temp_control, default: false
      t.boolean :is_fahrenheit, default: false
      t.boolean :is_celsius, default: false
      t.decimal :fahrenheit
      t.decimal :celsius
      t.decimal :kilometers
      t.string :broker_rep_name
      t.string :broker_rep_email
      t.string :broker_rep_number
      t.string :broker_rep_cell
      t.string :broker_after_hours_instructions
      t.string :description
      t.timestamps
    end 
  end
end