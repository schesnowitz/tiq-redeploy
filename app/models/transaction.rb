class Transaction < ApplicationRecord
  belongs_to :transactionable, polymorphic: true
  validates_presence_of :business_name, :expense_type
end