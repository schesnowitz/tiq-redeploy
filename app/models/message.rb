# class Message < ApplicationRecord
#  belongs_to :driver_user, optional: true
#  belongs_to :company_user, optional: true 
#   scope :for_number,        -> (number) { where(number: number).by_date }
#   scope :by_date,           -> { order(created_at: :desc) }
#   scope :recent_by_number,  -> { group(:number).having('created_at = MAX(created_at)') }

#   # geocoded_by :address   # can also be an IP address
#   # after_validation :geocode          # auto-fetch coordinates
    
  
#     def sent_received
#       if
#         self.inbound == true
#         return "received"
#       else
#         self.inbound == false
#         return "sent"
#     end 
#   end
  



#   def address 
#     [ from_city, from_state, from_zip].join(', ') 
#   end
# end
