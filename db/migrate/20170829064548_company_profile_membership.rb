class CompanyProfileMembership < ActiveRecord::Migration[5.1]
  def change
    create_table :company_profile_memberships do |t|
      t.integer :company_profile_id, index: true
      t.integer :user_id, index: true
      t.string :membership_type
      t.index [:user_id, :company_profile_id], name: 'user_company_profile'
      t.timestamps
    end
  end
end
