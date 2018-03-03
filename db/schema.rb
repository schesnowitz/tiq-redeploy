# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170829065348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "address_category_id"
    t.string "type"
    t.float "latitude"
    t.float "longitude"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "company"
    t.string "contact"
    t.string "phone"
    t.string "notes"
    t.string "pick_up_delivery"
    t.date "pick_up_date"
    t.decimal "miles"
    t.integer "load_id"
    t.integer "trailer_id"
    t.integer "truck_id"
    t.integer "driver_checkin_id"
    t.integer "driver_user_id"
    t.integer "company_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_category_id"], name: "index_addresses_on_address_category_id"
    t.index ["company_user_id"], name: "index_addresses_on_company_user_id"
    t.index ["driver_checkin_id"], name: "index_addresses_on_driver_checkin_id"
    t.index ["driver_user_id"], name: "index_addresses_on_driver_user_id"
    t.index ["load_id"], name: "index_addresses_on_load_id"
    t.index ["trailer_id"], name: "index_addresses_on_trailer_id"
    t.index ["truck_id"], name: "index_addresses_on_truck_id"
  end

  create_table "app_variables", force: :cascade do |t|
    t.string "front_end_color", default: "Teal"
    t.string "app_name"
    t.string "app_logo"
    t.string "app_logo_text"
    t.string "app_tab_text"
    t.string "app_slogan"
    t.string "app_favi"
    t.string "app_frontend_logo_text"
    t.string "email"
    t.string "telephone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "street_2"
    t.string "city_2"
    t.string "state_2"
    t.string "zip_2"
    t.text "app_terms"
    t.text "app_conditions"
    t.string "theme"
    t.string "app_company_name", default: "Margo's Cargo"
    t.string "string_1"
    t.string "string_2"
    t.string "string_3"
    t.string "string_4"
    t.string "string_5"
    t.string "string_6"
    t.string "string_7"
    t.string "string_8"
    t.string "string_9"
    t.string "string_10"
    t.string "string_11"
    t.string "string_12"
    t.string "string_13"
    t.string "string_14"
    t.string "string_15"
    t.string "string_16"
    t.string "string_17"
    t.string "string_18"
    t.string "string_19"
    t.string "string_20"
    t.string "string_21"
    t.string "string_22"
    t.string "string_23"
    t.string "string_24"
    t.string "string_25"
    t.string "string_26"
    t.string "string_27"
    t.string "string_28"
    t.string "string_29"
    t.string "string_30"
    t.text "text_1"
    t.text "text_2"
    t.text "text_3"
    t.text "text_4"
    t.text "text_5"
    t.text "text_6"
    t.text "text_7"
    t.text "text_8"
    t.text "text_9"
    t.text "text_10"
    t.text "text_11"
    t.text "text_12"
    t.text "text_13"
    t.text "text_14"
    t.text "text_15"
    t.text "text_16"
    t.text "text_17"
    t.text "text_18"
    t.text "text_19"
    t.text "text_20"
    t.string "icon_1"
    t.string "icon_2"
    t.string "icon_3"
    t.string "icon_4"
    t.string "icon_5"
    t.string "icon_6"
    t.string "icon_7"
    t.string "icon_8"
    t.string "icon_9"
    t.string "icon_10"
    t.string "icon_11"
    t.string "icon_12"
    t.string "icon_13"
    t.string "icon_14"
    t.string "icon_15"
    t.string "icon_16"
    t.string "icon_17"
    t.string "icon_18"
    t.string "icon_19"
    t.string "icon_20"
    t.string "icon_21"
    t.string "icon_22"
    t.string "icon_23"
    t.string "icon_24"
    t.string "icon_25"
    t.string "icon_26"
    t.string "icon_27"
    t.string "icon_28"
    t.string "icon_29"
    t.string "icon_30"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_profile_memberships", force: :cascade do |t|
    t.integer "company_profile_id"
    t.integer "user_id"
    t.string "membership_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profile_id"], name: "index_company_profile_memberships_on_company_profile_id"
    t.index ["user_id", "company_profile_id"], name: "user_company_profile"
    t.index ["user_id"], name: "index_company_profile_memberships_on_user_id"
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string "company_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "telephone"
    t.string "fax"
    t.string "website"
    t.string "logo"
    t.string "broker_mc_number"
    t.string "carrier_mc_number"
    t.string "us_dot_number"
    t.string "updated_by"
    t.string "contact"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_locations", force: :cascade do |t|
    t.string "driver_email"
    t.string "the_parse_id"
    t.float "latitude"
    t.float "longitude"
    t.float "speed"
    t.float "bearing"
    t.datetime "parse_created_at"
    t.datetime "parse_updated_at"
    t.integer "driver_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_user_id"], name: "index_driver_locations_on_driver_user_id"
  end

  create_table "driver_rates", force: :cascade do |t|
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_statements", force: :cascade do |t|
    t.string "notes"
    t.integer "driver_user_id"
    t.string "payment_status"
    t.date "due_date"
    t.decimal "insurance_payment", default: "0.0"
    t.decimal "trailer_rental", default: "0.0"
    t.decimal "truck_rental", default: "0.0"
    t.decimal "other", default: "0.0"
    t.string "payment_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "front_page_texts", force: :cascade do |t|
    t.string "string_input"
    t.string "text_input"
    t.string "image_input"
    t.boolean "show_default_image", default: false
    t.integer "front_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["front_page_id"], name: "index_front_page_texts_on_front_page_id"
  end

  create_table "front_pages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "load_documents", force: :cascade do |t|
    t.string "doc_file"
    t.string "file_type"
    t.string "note"
    t.integer "load_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_load_documents_on_load_id"
  end

  create_table "loads", force: :cascade do |t|
    t.boolean "has_multiple_pd", default: false
    t.string "commodity"
    t.string "weight"
    t.string "units"
    t.string "load_size"
    t.decimal "miles", default: "0.0"
    t.decimal "invoice_price", default: "0.0"
    t.decimal "booking_fee", default: "0.0"
    t.decimal "percent_deducted"
    t.decimal "total_company_expenses"
    t.decimal "rate_to_owner_operator"
    t.decimal "percent_coverted_to_dollars", default: "0.0"
    t.decimal "driver_cents_pm"
    t.decimal "rate_after_booking_fee", default: "0.0"
    t.decimal "agent_fee", default: "0.0"
    t.date "pick_up_date"
    t.time "pick_up_time"
    t.string "broker_shipper_load_id"
    t.string "pick_up_notes"
    t.date "delivery_date"
    t.time "delivery_time"
    t.string "delivery_notes"
    t.string "equipment_type"
    t.string "status_name"
    t.integer "company_user_id"
    t.integer "driver_user_id"
    t.integer "company_profile_id"
    t.string "updated_by"
    t.string "special_instructions"
    t.string "dimentions"
    t.string "origin_street"
    t.string "origin_city"
    t.string "origin_state"
    t.string "origin_zip"
    t.string "origin_phone"
    t.string "origin_contact"
    t.float "origin_latitude"
    t.float "origin_longitude"
    t.string "destination_street"
    t.string "destination_city"
    t.string "destination_state"
    t.string "destination_zip"
    t.string "destination_phone"
    t.string "destination_contact"
    t.float "destination_latitude"
    t.float "destination_longitude"
    t.string "shipper_company_name"
    t.string "receiver_company_name"
    t.integer "driver_statement_id"
    t.integer "percentage_id"
    t.decimal "national_average_diesel_price"
    t.decimal "estimated_diesel_cost"
    t.decimal "truck_mpg", default: "5.5"
    t.date "truck_year"
    t.string "truck_number"
    t.string "truck_make"
    t.string "truck_model"
    t.string "truck_color"
    t.string "truck_plate"
    t.string "truck_state"
    t.string "truck_vin"
    t.string "trailer_number"
    t.date "trailer_year"
    t.string "trailer_make"
    t.string "trailer_type"
    t.string "trailer_length"
    t.string "trailer_plate"
    t.string "trailer_state"
    t.string "trailer_vin"
    t.string "trailer_door_type"
    t.decimal "pounds"
    t.decimal "kilos"
    t.boolean "is_pounds", default: false
    t.boolean "is_kilos", default: false
    t.boolean "is_hazmat", default: false
    t.boolean "is_temp_control", default: false
    t.boolean "is_fahrenheit", default: false
    t.boolean "is_celsius", default: false
    t.decimal "fahrenheit"
    t.decimal "celsius"
    t.decimal "kilometers"
    t.string "broker_rep_name"
    t.string "broker_rep_email"
    t.string "broker_rep_number"
    t.string "broker_rep_cell"
    t.string "broker_after_hours_instructions"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profile_id"], name: "index_loads_on_company_profile_id"
    t.index ["company_user_id"], name: "index_loads_on_company_user_id"
    t.index ["driver_statement_id"], name: "index_loads_on_driver_statement_id"
    t.index ["driver_user_id"], name: "index_loads_on_driver_user_id"
  end

  create_table "mcs", force: :cascade do |t|
    t.string "type"
    t.string "entity_type"
    t.string "operating_status"
    t.string "out_of_service_date"
    t.string "legal_name"
    t.string "dba_name"
    t.string "physical_address"
    t.string "phone"
    t.string "mailing_address"
    t.string "usdot_number"
    t.string "state_carrier_id_number"
    t.string "mc_mx_ff_numbers"
    t.string "duns_number"
    t.string "power_units"
    t.string "driver_count"
    t.string "mcs_150_form_date"
    t.string "mcs_150_mileage_year"
    t.string "general_freight"
    t.string "household_goods"
    t.string "metal_sheets_coils_rolls"
    t.string "motor_vehicles"
    t.string "drivetow_away"
    t.string "logs_poles_beams_lumber"
    t.string "building_materials"
    t.string "mobile_homes"
    t.string "machinery_large_objects"
    t.string "fresh_produce"
    t.string "safer_layout"
    t.string "liquids_gases"
    t.string "intermodal"
    t.string "passengers"
    t.string "oilfield_equipment"
    t.string "livestock"
    t.string "grain_feed_hay"
    t.string "coal_coke"
    t.string "meat"
    t.string "garbage_refuse"
    t.string "us_mail"
    t.string "chemicals"
    t.string "commodities_dry_bulk"
    t.string "refrigerated_food"
    t.string "beverages"
    t.string "paper_products"
    t.string "utilities"
    t.string "agricultural_farm_supplies"
    t.string "construction"
    t.string "water_well"
    t.string "driver_inspections_count"
    t.string "vehicle_inspections_count"
    t.string "hazmat_inspections_count"
    t.string "iep_inspections_count"
    t.string "driver_inspections_out_service"
    t.string "vehicle_inspections_out_service"
    t.string "hazmat_inspections_out_service"
    t.string "iep_inspections_out_service"
    t.string "driver_inspections_out_service_percent"
    t.string "vehicle_inspections_out_service_percent"
    t.string "hazmat_inspections_out_service_percent"
    t.string "iep_inspections_out_service_percent"
    t.string "crash_fatal"
    t.string "crash_injury"
    t.string "crash_tow"
    t.string "crash_total"
    t.string "cad_vehicle_inspections"
    t.string "cad_driver_inspections"
    t.string "cad_vehicle_out_of_service"
    t.string "cad_driver_out_of_service"
    t.string "cad_vehicle_out_of_service_percent"
    t.string "cad_driver_out_of_service_percent"
    t.string "us_inspections_prev_24"
    t.string "cad_inspections_prev_24"
    t.string "crash_results_24_prior"
    t.string "cad_crash_results_24_prior"
    t.string "cad_crash_fatal"
    t.string "cad_crash_injury"
    t.string "cad_crash_tow"
    t.string "cad_crash_total"
    t.string "us_inspection_results_for_24_months_prior_to"
    t.string "total_inspections"
    t.string "total_iep_inspections"
    t.string "crash_inspections"
    t.string "the_rating_below_is_current_as_of"
    t.string "rating_date"
    t.string "review_date"
    t.string "review_rating"
    t.string "review_type"
    t.string "company_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profile_id"], name: "index_mcs_on_company_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "number"
    t.string "text"
    t.boolean "inbound"
    t.string "user"
    t.float "latitude"
    t.float "longitude"
    t.string "to_country"
    t.string "to_state"
    t.string "to_city"
    t.string "to_zip"
    t.string "from_country"
    t.string "from_state"
    t.string "from_city"
    t.string "from_zip"
    t.string "sms_message_sid"
    t.string "num_media"
    t.string "sms_sid"
    t.integer "company_user_id"
    t.integer "driver_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_user_id"], name: "index_messages_on_company_user_id"
    t.index ["driver_user_id"], name: "index_messages_on_driver_user_id"
  end

  create_table "miles", force: :cascade do |t|
    t.decimal "mileage"
    t.string "type"
    t.string "notes"
    t.integer "trailer_id"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_miles_on_trailer_id"
    t.index ["truck_id"], name: "index_miles_on_truck_id"
  end

  create_table "percentages", force: :cascade do |t|
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trailer_images", force: :cascade do |t|
    t.string "notes"
    t.string "image_file"
    t.integer "trailer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_trailer_images_on_trailer_id"
  end

  create_table "trailers", force: :cascade do |t|
    t.string "trailer_type"
    t.date "year"
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "number"
    t.string "service_status"
    t.string "vin"
    t.string "image"
    t.string "notes"
    t.string "length"
    t.string "door_type"
    t.float "latitude"
    t.float "longitude"
    t.string "plate"
    t.string "plate_state"
    t.boolean "has_reefer"
    t.integer "driver_user_id"
    t.string "gps_unit_ident"
    t.string "add_remove_driver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_user_id"], name: "index_trailers_on_driver_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "expense_type"
    t.decimal "debit", default: "0.0"
    t.decimal "credit", default: "0.0"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.float "latitude"
    t.float "longitude"
    t.string "notes"
    t.integer "transactionable_id"
    t.string "transactionable_type"
    t.string "business_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_images", force: :cascade do |t|
    t.string "notes"
    t.string "image_file"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_truck_images_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.boolean "belongs_to_company", default: false
    t.date "year"
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "number"
    t.string "vin"
    t.string "image"
    t.float "latitude"
    t.float "longitude"
    t.string "plate"
    t.string "plate_state"
    t.string "gps_unit_ident"
    t.string "notes"
    t.string "service_status"
    t.decimal "average_mpg", default: "5.5"
    t.integer "driver_user_id"
    t.string "add_remove_driver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_user_id"], name: "index_trucks_on_driver_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.string "extention"
    t.string "cellphone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "type"
    t.string "emergency_contact"
    t.string "emergency_contact_number"
    t.string "profile_bg"
    t.string "profile_image"
    t.boolean "company_profile_admin", default: false
    t.boolean "admin", default: false
    t.boolean "dispatcher", default: false
    t.boolean "dispatch_admin", default: false
    t.boolean "office", default: false
    t.boolean "maintenance", default: false
    t.boolean "company_driver", default: false
    t.boolean "owner_operator", default: false
    t.boolean "owner_operator_pbm", default: false
    t.boolean "shipping_receiving", default: false
    t.string "employment_status", default: "not_active"
    t.string "time_zone"
    t.boolean "app_agree_terms"
    t.integer "driver_rate_id", default: 1
    t.decimal "driver_rpm"
    t.string "mobile_user_password"
    t.boolean "super_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["driver_rate_id"], name: "index_users_on_driver_rate_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vendor_profiles", force: :cascade do |t|
    t.string "company_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "telephone"
    t.string "fax"
    t.string "website"
    t.string "logo"
    t.string "contact_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
