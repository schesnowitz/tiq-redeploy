pickup = AddressCategory.where(name: "Pick Up").first_or_create(name: "Pick Up")
delivery = AddressCategory.where(name: "Delivery").first_or_create(name: "Delivery")
pu_delivery = AddressCategory.where(name: "Pick Up and Delivery").first_or_create(name: "Pick Up and Delivery")
final_dest = AddressCategory.where(name: "Final Destination").first_or_create(name: "Final Destination") 