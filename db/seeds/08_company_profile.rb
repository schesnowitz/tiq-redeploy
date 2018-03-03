
3.times do     
companyprofile = CompanyProfile.create(
company_name: Faker::Company.name, 
telephone: Faker::PhoneNumber.phone_number,
street: Faker::Address.street_address,
city: Faker::Address.city,
state: Faker::Address.state,
zip: Faker::Address.zip,
fax: Faker::PhoneNumber.phone_number,
contact: Faker::Name.first_name, 
website: Faker::Internet.url,
broker_mc_number: "985484",
carrier_mc_number: "985484",
us_dot_number: "2921696",
email: Faker::Internet.email
  )
puts companyprofile.inspect 
end
     