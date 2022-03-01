# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# creates the seeds of all the languages
languages = ["Afrikaans","Albanian","Arabic","Armenian","Basque","Bengali","Bulgarian","Catalan","Cambodian","Chinese (Mandarin)","Croatian","Czech","Danish","Dutch","English","Estonian","Fiji","Finnish","French","Georgian","German","Greek","Gujarati","Hebrew","Hindi","Hungarian","Icelandic","Indonesian","Irish","Italian","Japanese","Javanese","Korean","Latin","Latvian","Lithuanian","Macedonian","Malay","Malayalam","Maltese","Maori","Marathi","Mongolian","Nepali","Norwegian","Persian","Polish","Portuguese","Punjabi","Quechua","Romanian","Russian","Samoan","Serbian","Slovak","Slovenian","Spanish","Swahili","Swedish ","Tamil","Tatar","Telugu","Thai","Tibetan","Tonga","Turkish","Ukrainian","Urdu","Uzbek","Vietnamese","Welsh","Xhosa"]
Language.destroy_all
languages.each do |language|
  Language.create!(name: language)
end


10.times do
  user = User.new(email: "oisin.odoherty@ucdconnect.ie",
      username: "oisinod",
      location: "cologne",
      first_name: "oisin",
      last_name: "odoherty",
      phone: "+353833726941",
      bio: nil, nationality: "Irish",
      availability: nil, age: 55)
end
[#<User id: 1, email: "oisin.odoherty@ucdconnect.ie", username: "oisinod", location: "cologne", first_name: "oisin", last_name: "odoherty", phone: "+353833726941", bio: nil, nationality: "Irish", availability: nil, age: 55, created_at: "2022-03-01 13:30:09.291158000 +0000", updated_at: "2022-03-01 13:30:09.291158000 +0000">]
