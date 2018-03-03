class CompanyProfileMembership < ApplicationRecord
  belongs_to :user 
  belongs_to :company_profile
end
