frontPage = FrontPage.create()

150.times do |num|
front_page_text = FrontPageText.create!(string_input: " -- This is a String.",
                                        text_input: " -- Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                        image_input: "",
                                        front_page_id: 1)
puts front_page_text.inspect                                  
end     
 
    
  
      

front_page_text = FrontPageText.find_or_initialize_by(id: 1)
front_page_text.string_input = " TransportIQ, Inc."
front_page_text.text_input   = "TransportIQ believes meaningful, measurable value isn't just a goal; it's an integral part of our culture. Our dedicated family of employees strives each day to deliver impeccable service and operate as an extension of our customers' enterprises."
front_page_text.image_input  = "1 image"
front_page_text.save!       
  

front_page_text = FrontPageText.find_or_initialize_by(id: 2)
front_page_text.string_input = " support@transportationIQ.com  "
front_page_text.text_input   = "TransportIQ offers a range of truckload transportation services within the United States, including long-haul, regional, local and dedicated."
front_page_text.image_input  = "2 image"
front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 3)
front_page_text.string_input = " 716.313.2172  " 
front_page_text.text_input   = "3 text"
front_page_text.image_input  = "3 image"
front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 4)
front_page_text.string_input = "Transport"
front_page_text.text_input   = "text 4"
front_page_text.image_input  = "4 image"
front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 5)

front_page_text.string_input = "IQ"
front_page_text.text_input   = "5 text"
front_page_text.image_input  = "5 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 6)
 
front_page_text.string_input = "6 string"
front_page_text.text_input   = "6 text"
front_page_text.image_input  = "6 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 7)

front_page_text.string_input = "Transport"
front_page_text.text_input   = "7 text" 
front_page_text.image_input  = "7 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 8)

front_page_text.string_input = "IQ"
front_page_text.text_input   = "8 text"
front_page_text.image_input  = "8 image"

front_page_text.save!     
 
front_page_text = FrontPageText.find_or_initialize_by(id: 9)

front_page_text.string_input = "1001 State Street"
front_page_text.text_input   = "9 text"
front_page_text.image_input  = "9 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 10)

front_page_text.string_input = "Erie"
front_page_text.text_input   = "10 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 11)

front_page_text.string_input = "PA"
front_page_text.text_input   = "11 text"
front_page_text.image_input  = ""

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 12)

front_page_text.string_input = "16501"
front_page_text.text_input   = "12 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 13)

front_page_text.string_input = "13 string"
front_page_text.text_input   = "13 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 14)

front_page_text.string_input = "3024804"
front_page_text.text_input   = "14 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 15)

front_page_text.string_input = "36332"
front_page_text.text_input   = "15 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 16)

front_page_text.string_input = "16 string"
front_page_text.text_input   = "16 text"
front_page_text.image_input  = ""

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 17)

front_page_text.string_input = "17 string"
front_page_text.text_input   = "17 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 18)

front_page_text.string_input = "18 string"
front_page_text.text_input   = "18 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 19)

front_page_text.string_input = "19 string"
front_page_text.text_input   = "19 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 20)

front_page_text.string_input = "20 string"
front_page_text.text_input   = "20 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 21)

front_page_text.string_input = "21 string"
front_page_text.text_input   = "21 text"
front_page_text.image_input  = ""

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 22)

front_page_text.string_input = "22 string"
front_page_text.text_input   = "22 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 23)

front_page_text.string_input = "23 string"
front_page_text.text_input   = "23 text"
front_page_text.image_input  = ""

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 24)

front_page_text.string_input = "24 string"
front_page_text.text_input   = "24 text"
front_page_text.image_input  = "" 

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 25)

front_page_text.string_input = "25 string"
front_page_text.text_input   = "25 text"
front_page_text.image_input  = "25 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 26)

front_page_text.string_input = "26 string"
front_page_text.text_input   = "26 text"
front_page_text.image_input  = "26 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 27)

front_page_text.string_input = "27 string"
front_page_text.text_input   = "27 text"
front_page_text.image_input  = "27 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 28)

front_page_text.string_input = "28 string"
front_page_text.text_input   = "28 text"
front_page_text.image_input  = "28 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 29)

front_page_text.string_input = "29 string"
front_page_text.text_input   = "29 text"
front_page_text.image_input  = "29 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 30)

front_page_text.string_input = "30 string"
front_page_text.text_input   = "30 text"
front_page_text.image_input  = "30 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 31)

front_page_text.string_input = "31 string"
front_page_text.text_input   = "31 text"
front_page_text.image_input  = "31 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 32)

front_page_text.string_input = "32 string"
front_page_text.text_input   = "32 text"
front_page_text.image_input  = "32 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 33)

front_page_text.string_input = "33 string"
front_page_text.text_input   = "33 text"
front_page_text.image_input  = "33 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 34)

front_page_text.string_input = "34 string"
front_page_text.text_input   = "34 text"
front_page_text.image_input  = "34 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 35)

front_page_text.string_input = "35 string"
front_page_text.text_input   = "35 text"
front_page_text.image_input  = "35 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 36)

front_page_text.string_input = "36 string"
front_page_text.text_input   = "36 text"
front_page_text.image_input  = "36 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 37)

front_page_text.string_input = "37 string"
front_page_text.text_input   = "37 text"
front_page_text.image_input  = "37 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 38)

front_page_text.string_input = "38 string"
front_page_text.text_input   = "38 text"
front_page_text.image_input  = "38 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 39)

front_page_text.string_input = "39 string"
front_page_text.text_input   = "39 text"
front_page_text.image_input  = "39 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 40)

front_page_text.string_input = "40 string"
front_page_text.text_input   = "40 text"
front_page_text.image_input  = "40 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 41)

front_page_text.string_input = "41 string"
front_page_text.text_input   = "41 text"
front_page_text.image_input  = "41 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 42)

front_page_text.string_input = "42 string"
front_page_text.text_input   = "42 text"
front_page_text.image_input  = "42 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 43)

front_page_text.string_input = "43 string"
front_page_text.text_input   = "43 text"
front_page_text.image_input  = "43 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 44)

front_page_text.string_input = "44 string"
front_page_text.text_input   = "44 text"
front_page_text.image_input  = "44 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 45)

front_page_text.string_input = "45 string"
front_page_text.text_input   = "45 text"
front_page_text.image_input  = "45 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 46)

front_page_text.string_input = "46 string"
front_page_text.text_input   = "46 text"
front_page_text.image_input  = "46 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 47)

front_page_text.string_input = "47 string"
front_page_text.text_input   = "47 text"
front_page_text.image_input  = "47 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 48)

front_page_text.string_input = "48 string"
front_page_text.text_input   = "48 text"
front_page_text.image_input  = "48 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 49)

front_page_text.string_input = "49 string"
front_page_text.text_input   = "49 text"
front_page_text.image_input  = "49 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 50)

front_page_text.string_input = "50 string"
front_page_text.text_input   = "50 text"
front_page_text.image_input  = "50 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 51)
front_page_text.string_input = "51 string"
front_page_text.text_input   = "51 text"
front_page_text.image_input  = "51 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 52)

front_page_text.string_input = "A single-source solution serving 48 contiguous states and Canada." 
front_page_text.text_input   = "52 text"
front_page_text.image_input  = "52 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 53)

front_page_text.string_input = "From origin to destination, we transport full truckloads without intermediate stops or handling throughout the U.S. and Canada, employing the latest technology and customized support services." 
front_page_text.text_input   = "54 text"
front_page_text.image_input  = "54 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 54)

front_page_text.string_input = "Keep up to date with your shipments with instant tracking." 
front_page_text.text_input   = " 54 text"
front_page_text.image_input  = " 54 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 55)

front_page_text.string_input = "Track your shipment in real-time, we keep you up to date 27/7. Login and stay on top of your load."
front_page_text.text_input   = "55 text"
front_page_text.image_input  = "55 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 56)

front_page_text.string_input = "It's about People."
front_page_text.text_input   = "56 text"
front_page_text.image_input  = "56 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 57)

front_page_text.string_input = "Business runs on it's people. We believe in providing our clients with a great overall customer experience while maintaining professional solutions for your logistics needs."
front_page_text.text_input   = "57 text"
front_page_text.image_input  = "57 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 58)

front_page_text.string_input = "58 string"
front_page_text.text_input   = "58 text"
front_page_text.image_input  = "58 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 59)

front_page_text.string_input = "59 string"
front_page_text.text_input   = "59 text"
front_page_text.image_input  = "59 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 60)

front_page_text.string_input = "60 string"
front_page_text.text_input   = "60 text"
front_page_text.image_input  = "60 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 61)

front_page_text.string_input = "61 string"
front_page_text.text_input   = "61 text"
front_page_text.image_input  = "61 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 62)

front_page_text.string_input = "62 string"
front_page_text.text_input   = "62 text"
front_page_text.image_input  = "62 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 63)

front_page_text.string_input = "63 string"
front_page_text.text_input   = "63 text"
front_page_text.image_input  = "63 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 64)

front_page_text.string_input = "64 string"
front_page_text.text_input   = "64 text"
front_page_text.image_input  = "64 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 65)

front_page_text.string_input = "65 string"
front_page_text.text_input   = "65 text"
front_page_text.image_input  = "65 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 66)

front_page_text.string_input = "66 string"
front_page_text.text_input   = "66 text"
front_page_text.image_input  = "66 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 67)

front_page_text.string_input = "67 string"
front_page_text.text_input   = "67 text"
front_page_text.image_input  = "67 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 68)

front_page_text.string_input = "68 string"
front_page_text.text_input   = "68 text"
front_page_text.image_input  = "68 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 69)

front_page_text.string_input = "69 string"
front_page_text.text_input   = "69 text"
front_page_text.image_input  = "69 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 70)

front_page_text.string_input = "70 string"
front_page_text.text_input   = "70 text"
front_page_text.image_input  = "70 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 71)

front_page_text.string_input = "71 string"
front_page_text.text_input   = "71 text"
front_page_text.image_input  = "71 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 72)

front_page_text.string_input = "72 string"
front_page_text.text_input   = "72 text"
front_page_text.image_input  = "72 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 73)

front_page_text.string_input = " 716.313.2674 "
front_page_text.text_input   = "73 text"
front_page_text.image_input  = "73 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 74)

front_page_text.string_input = "74 string"
front_page_text.text_input   = "74 text"
front_page_text.image_input  = "74 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 75)

front_page_text.string_input = "Industry"
front_page_text.text_input   = "75 text"
front_page_text.image_input  = "75 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 76)
 
front_page_text.string_input = "News"
front_page_text.text_input   = "76 text"
front_page_text.image_input  = "76 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 77)

front_page_text.string_input = "News comes in here"
front_page_text.text_input   = "77 text"
front_page_text.image_input  = "77 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 78)

front_page_text.string_input = "And Here"
front_page_text.text_input   = "78 text"
front_page_text.image_input  = "78 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 79)

front_page_text.string_input = "79 string"
front_page_text.text_input   = "79 text"
front_page_text.image_input  = "79 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 80)
 
front_page_text.string_input = "Intelligent Transport and Logistics Solutions."  
front_page_text.text_input   = "80 text"
front_page_text.image_input  = "80 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 81)

front_page_text.string_input = "Intelligent Transport."
front_page_text.text_input   = "81 text"
front_page_text.image_input  = "81 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 82)

front_page_text.string_input = "82 string"
front_page_text.text_input   = "82 text"
front_page_text.image_input  = "82 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 83)

front_page_text.string_input = "83 string"
front_page_text.text_input   = "83 text"
front_page_text.image_input  = "83 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 84)

front_page_text.string_input = "84 string"
front_page_text.text_input   = "84 text"
front_page_text.image_input  = "84 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 85)

front_page_text.string_input = "85 string"
front_page_text.text_input   = "85 text"
front_page_text.image_input  = "85 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 86)

front_page_text.string_input = " 86 string" 
front_page_text.text_input   = "  86 text"
front_page_text.image_input  = " 86 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 87)

front_page_text.string_input = "87 string"
front_page_text.text_input   = "87 text"
front_page_text.image_input  = "87 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 88)

front_page_text.string_input = "88 string"
front_page_text.text_input   = "88 text"
front_page_text.image_input  = "88 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 89)

front_page_text.string_input = "89 string"
front_page_text.text_input   = "89 text"
front_page_text.image_input  = " 89image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 90)

front_page_text.string_input = "90 string"
front_page_text.text_input   = "90 text"
front_page_text.image_input  = "90 image"

front_page_text.save!   

front_page_text = FrontPageText.find_or_initialize_by(id: 91)

front_page_text.string_input = "91 string " 
front_page_text.text_input   = "91  upate text 5"
front_page_text.image_input  = "91 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 92)

front_page_text.string_input = "92 string"
front_page_text.text_input   = "92 text"
front_page_text.image_input  = "92 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 93)

front_page_text.string_input = "93 string"
front_page_text.text_input   = "93 text"
front_page_text.image_input  = "93 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 94)

front_page_text.string_input = "94 string"
front_page_text.text_input   = "94 text"
front_page_text.image_input  = "94 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 95)

front_page_text.string_input = "95 string"
front_page_text.text_input   = "95 text"
front_page_text.image_input  = "95 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 96)

front_page_text.string_input = "96 string " 
front_page_text.text_input   = "96 text"
front_page_text.image_input  = "96 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 97)

front_page_text.string_input = "97 string"
front_page_text.text_input   = "97 text"
front_page_text.image_input  = "97 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 98)

front_page_text.string_input = "98 string"
front_page_text.text_input   = "98 text"
front_page_text.image_input  = "98 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 99)

front_page_text.string_input = "99 string"
front_page_text.text_input   = "99 text"
front_page_text.image_input  = "99 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 100)

front_page_text.string_input = " 100 string"
front_page_text.text_input   = " 100 text"
front_page_text.image_input  = " 100 image"
front_page_text.save! 

front_page_text = FrontPageText.find_or_initialize_by(id: 101)
front_page_text.string_input = "Technology"
front_page_text.text_input   = "Vehicle tracking provides location-based information our dispatchers use to provide location information to our clients.  This keep you on top of you load minute by minute."
front_page_text.image_input  = "101 image"
front_page_text.save!       
  

front_page_text = FrontPageText.find_or_initialize_by(id: 102)
front_page_text.string_input = "Strategy"
front_page_text.text_input   = "Transportation is a very key element of the logistics process and the supply chain which runs from vendors through to you to your customers. It involves the movement of product, service/speed and cost which are three of the five key issues of effective logistics. It also impacts with the other two logistics-- movement of information and integration within and among suppliers, customers and carriers."
front_page_text.image_input  = "102 image"
front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 103)
front_page_text.string_input = "Safety"
front_page_text.text_input   = "Safety is the highest priority at TransportIQ. Safety for our employees, contractors, customers and motoring public will always remain our primary focus in all the policies, procedures and programs that govern our business."
front_page_text.image_input  = "103 image"
front_page_text.save!      

front_page_text = FrontPageText.find_or_initialize_by(id: 104)
front_page_text.string_input = "Support"
front_page_text.text_input   = "We understand the concerns of both brokers and Shippers, we are uniquely positioned to support your needs. We’ve are successful because of the value we place on the relationships we build with our customers. Look forward to the support and respect that will deliver us both success."
front_page_text.image_input  = "104 image"
front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 105)

front_page_text.string_input = "Fr8Track"
front_page_text.text_input   = "105 text"
front_page_text.image_input  = "105 image"

front_page_text.save!      

front_page_text = FrontPageText.find_or_initialize_by(id: 106)
 
front_page_text.string_input = "That's Intelligent."
front_page_text.text_input   = "106 text"
front_page_text.image_input  = "106 image"

front_page_text.save!     


front_page_text = FrontPageText.find_or_initialize_by(id: 107) 

front_page_text.string_input = "Highest Standards." 
front_page_text.text_input   = "107 text"
front_page_text.image_input  = "107 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 108)

front_page_text.string_input = "Kathy Rodriguez"
front_page_text.text_input   = "108 text"
front_page_text.image_input  = "108 image"

front_page_text.save!     
 
front_page_text = FrontPageText.find_or_initialize_by(id: 109)

front_page_text.string_input = "President & CEO"
front_page_text.text_input   = "109 text"
front_page_text.image_input  = "109 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 110)

front_page_text.string_input = "Steve Chesnowitz"
front_page_text.text_input   = "110 text"
front_page_text.image_input  = "110 image"
front_page_text.save!





front_page_text = FrontPageText.find_or_initialize_by(id: 111) 

front_page_text.string_input = "Safety & Technology" 
front_page_text.text_input   = "111 text"
front_page_text.image_input  = "111 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 112)

front_page_text.string_input = "Lloyd Spencer"
front_page_text.text_input   = "112 text"
front_page_text.image_input  = "112 image"

front_page_text.save!     
 
front_page_text = FrontPageText.find_or_initialize_by(id: 113)

front_page_text.string_input = "Chief Operations Officer"
front_page_text.text_input   = "113 text"
front_page_text.image_input  = "113 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 114)

front_page_text.string_input = "When you need it."
front_page_text.text_input   = "114 text"
front_page_text.image_input  = "114 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 115) 

front_page_text.string_input = "Responsibility" 
front_page_text.text_input   = "115 text"
front_page_text.image_input  = "115 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 116)

front_page_text.string_input = "" 
front_page_text.text_input   = "116 text"
front_page_text.image_input  = "116 image"

front_page_text.save!     
 
front_page_text = FrontPageText.find_or_initialize_by(id: 117)

front_page_text.string_input = ""
front_page_text.text_input   = "117 text"
front_page_text.image_input  = "117 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 118)

front_page_text.string_input = "chrobinson.com" 
front_page_text.text_input   = "118 text"
front_page_text.image_input  = "118 image"
front_page_text.save!  

front_page_text = FrontPageText.find_or_initialize_by(id: 119)

front_page_text.string_input = "" 
front_page_text.text_input   = "119 text"
front_page_text.image_input  = "119 image"

front_page_text.save!     

front_page_text = FrontPageText.find_or_initialize_by(id: 120)

front_page_text.string_input = ""
front_page_text.text_input   = "120 text"
front_page_text.image_input  = "120 image" 
front_page_text.save!



front_page_text = FrontPageText.find_or_initialize_by(id: 121)

front_page_text.string_input = ""
front_page_text.text_input   = "121 text"
front_page_text.image_input  = "121 image"
front_page_text.save!


front_page_text = FrontPageText.find_or_initialize_by(id: 122)

front_page_text.string_input = ""
front_page_text.text_input   = "122 text"
front_page_text.image_input  = "122 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 123)

front_page_text.string_input = "pamtransport.com"
front_page_text.text_input   = "123 text"
front_page_text.image_input  = "123 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 124)

front_page_text.string_input = ""
front_page_text.text_input   = "124 text"
front_page_text.image_input  = "124 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 125)

front_page_text.string_input = ""
front_page_text.text_input   = "125 text"
front_page_text.image_input  = "125 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 126)

front_page_text.string_input = "" 
front_page_text.text_input   = "126 text"
front_page_text.image_input  = "126 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 127)

front_page_text.string_input = "" 
front_page_text.text_input   = "127 text"
front_page_text.image_input  = "127 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 128)

front_page_text.string_input = ""
front_page_text.text_input   = "128 text"
front_page_text.image_input  = "128 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 129)

front_page_text.string_input = ""
front_page_text.text_input   = "129 text"
front_page_text.image_input  = "129 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 130)

front_page_text.string_input = ""
front_page_text.text_input   = "130 text"
front_page_text.image_input  = "130 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 131)

front_page_text.string_input = "131 string"
front_page_text.text_input   = "131 text"
front_page_text.image_input  = "131 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 132)

front_page_text.string_input = "132 string"
front_page_text.text_input   = "132 text"
front_page_text.image_input  = "132 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 133)

front_page_text.string_input = "133 string"
front_page_text.text_input   = "133 text"
front_page_text.image_input  = "133 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 134)

front_page_text.string_input = "134 string"
front_page_text.text_input   = "134 text"
front_page_text.image_input  = "134 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 135)

front_page_text.string_input = "135 string"
front_page_text.text_input   = "135 text"
front_page_text.image_input  = "135 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 136)

front_page_text.string_input = "136 string"
front_page_text.text_input   = "136 text"
front_page_text.image_input  = "136 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 137)

front_page_text.string_input = "137 string"
front_page_text.text_input   = "137 text"
front_page_text.image_input  = "137 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 138)

front_page_text.string_input = "138 string"
front_page_text.text_input   = "138 text"
front_page_text.image_input  = "138 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 139)

front_page_text.string_input = "139 string"
front_page_text.text_input   = "139 text"
front_page_text.image_input  = "139 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 140)

front_page_text.string_input = "140 string"
front_page_text.text_input   = "140 text"
front_page_text.image_input  = "140 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 141)

front_page_text.string_input = "141 string"
front_page_text.text_input   = "141 text"
front_page_text.image_input  = "141 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 142)

front_page_text.string_input = "142 string"
front_page_text.text_input   = "142 text"
front_page_text.image_input  = "142 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 143)

front_page_text.string_input = "143 string"
front_page_text.text_input   = "143 text"
front_page_text.image_input  = "143 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 144)

front_page_text.string_input = "144 string"
front_page_text.text_input   = "144 text"
front_page_text.image_input  = "144 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 145)

front_page_text.string_input = "145 string"
front_page_text.text_input   = "145 text"
front_page_text.image_input  = "145 image"
front_page_text.save!
front_page_text = FrontPageText.find_or_initialize_by(id: 146)

front_page_text.string_input = "146 string"
front_page_text.text_input   = "146 text"
front_page_text.image_input  = "146 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 147)

front_page_text.string_input = "147 string"
front_page_text.text_input   = "147 text"
front_page_text.image_input  = "147 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 148)

front_page_text.string_input = "148 string"
front_page_text.text_input   = "148 text"
front_page_text.image_input  = "148 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 149)

front_page_text.string_input = "149 string"
front_page_text.text_input   = "149 text"
front_page_text.image_input  = "149 image"
front_page_text.save!

front_page_text = FrontPageText.find_or_initialize_by(id: 150)

front_page_text.string_input = "150 string"
front_page_text.text_input   = "150 text"
front_page_text.image_input  = "150 image"
front_page_text.save!