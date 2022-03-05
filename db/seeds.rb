# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'i18n_data'
def find_flag(flagcode)
  ActionController::Base.helpers.asset_path("flags/#{flagcode}.svg")
rescue Sprockets::Rails::Helper::AssetNotFound
  nil
end
User.destroy_all
Appointment.destroy_all
UserLanguage.destroy_all
Language.destroy_all

languages = ["Afrikaans", "Arabic", "Armenian", "Bengali", "Bulgarian", "Cambodian", "Chinese", "Croatian", "Czech", "Danish", "Dutch", "English", "Estonian", "Finnish", "French", "Georgian", "German", "Greek", "Gujarati", "Hebrew", "Hindi", "Hungarian", "Icelandic", "Indonesian", "Irish", "Italian", "Japanese", "Javanese", "Korean", "Latin", "Latvian", "Lithuanian", "Macedonian", "Malay", "Malayalam", "Maltese", "Maori", "Marathi", "Mongolian", "Nepali", "Norwegian", "Persian", "Polish", "Portuguese", "Punjabi", "Quechua", "Romanian", "Russian", "Samoan", "Serbian", "Slovak", "Slovenian", "Spanish", "Swahili", "Swedish ", "Tamil", "Tatar", "Telugu", "Thai", "Tibetan", "Tonga", "Turkish", "Ukrainian", "Urdu", "Uzbek", "Vietnamese", "Welsh"]
language_objects = []
languages.each do |language|
    flagcode = I18nData.language_code(language)
    flagcode = flagcode.downcase unless flagcode.nil?
    puts "#{language} - #{flagcode}"
    language_instance = Language.create(name: language, flagcode: flagcode) if find_flag(flagcode)
    language_objects.push(language_instance)
end

users = []

# 10.times do |time|
#   puts time
#   user = User.new(
#     email: "test@#{time}.com",
#     password: 123_456,
#     username: "#{Faker::Books::CultureSeries.planet}#{(1..100).to_a.sample}",
#     location: "cologne",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone: "123456789",
#     bio: "My favourite quote is #{Faker::Quote.jack_handey}. I'm looking for a speakEZ!",
#     nationality: "Irish",
#     availability: nil,
#     age: (1..100).to_a.sample
#   )
#   user.save
#   users.push(user)
# end

# user_languages = []
# 10.times do |t|
#   puts t
#   user_language = UserLanguage.new(
#     skill_level: (1..5).to_a.sample
#   )
#   user_language.user = users.sample
#   user_language.language = language_objects.sample
#   user_language.save
#   user_languages.push(user_language)
# end
# p user_languages

# 3.times do |t|
#   puts t
#   appt = Appointment.new(
#     location: "Cologne",
#     datetime: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")
#   )
#   appt.asker_language = user_languages.sample
#   appt.receiver_language = user_languages.sample
#   appt.save
# end
