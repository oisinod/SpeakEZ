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

Appointment.destroy_all
User.destroy_all
Language.destroy_all
UserLanguage.destroy_all

users = []
user_languages = []

languages = ["English", "Chinese", "Spanish", "French", "Portuguese", "Hindi", "Russian", "German",
             "Japanese", "Swahili", "Javanese", "Turkish", "Korean", "Telugu", "Marathi", "Urdu", "Tamil",
             "Finnish", "Hebrew", "Italian", "Slovak", "Mongolian", "Norwegian", "Polish", "Thai", "Danish",
             "Tibetan", "Czech", "Hausa", "Hungarian", "Maori"].sort
language_objects = []
languages.each do |language|
  flagcode = I18nData.language_code(language)
  flagcode = flagcode.downcase unless flagcode.nil?
  puts "#{language} - #{flagcode}"
  if find_flag(flagcode)
    language_instance = Language.create!(name: language, flagcode: flagcode)
    language_objects.push(language_instance)
  end
end

user = User.new(
  email: "test@1.com,",
  password: 123_456,
  username: "Bootcamp is Love",
  location: "Subbelrather Str. 269, 50825 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@2.com",
  password: 123_456,
  username: "LeWagonLover3",
  location: "Industriestraße 16, 50735 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@3.com",
  password: 123_456,
  username: "Love is Bootcamp",
  location: "Hofstraße 1, 51061 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@4.com",
  password: 123_456,
  username: "LeWagon is Best",
  location: "Burgwiesenstraße 125, 51067 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@5.com",
  password: 123_456,
  username: "GreenRakeIsBestRake",
  location: "Wiersbergstraße 31, 51103 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@6.com",
  password: 123_456,
  username: "ErrorLover123",
  location: "Alfred-Delp-Straße 1, 51149 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@7.com",
  password: 123_456,
  username: "TrustTheProcess",
  location: "Pferdmengesstraße 12, 50968 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@8.com",
  password: 123_456,
  username: "SmallErrorHugeConsequences",
  location: "Neuenhöfer Allee 65, 50935 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@9.com",
  password: 123_456,
  username: "ILoveThisPitch",
  location: "Blaubach 1, 50676 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

user = User.new(
  email: "test@10.com",
  password: 123_456,
  username: "John Snow",
  location: "Sankt-Apern-Straße 17, 50667 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: Faker::TvShows::GameOfThrones.unique.quote,
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: (18..88).to_a.sample
)
user.save
users.push(user)

users.each do |user|
  puts user.username

  user_language = UserLanguage.new(
    skill_level: "5"
  )
  user_language.user = user
  user_language.language = language_objects.sample
  user_language.save!
  user_languages.push(user_language)

  language = user_language.language
  user_language = UserLanguage.new(
    skill_level: (1..3).to_a.sample,
    learning: true
  )
  user_language.user = user
  while language == user.languages.first
    language = language_objects.sample
  end
  user_language.language = language
  user_language.save!
  user_languages.push(user_language)
end


# 20.times do |t|
#   puts t
#   user_language = UserLanguage.new(
#      skill_level: (1..4).to_a.sample,
#     learning: true
#   )
#   user_language.user = users.sample
#   user_language.language = language_objects.sample
#   user_language.save!
#   user_languages.push(user_language)
# end
# p user_languages

# 15.times do |t|
#   puts t
#   user_language = UserLanguage.new(
#     skill_level: (4..5).to_a.sample
#   )
#   user_language.user = users.sample
#   user_language.language = language_objects.sample
#   user_language.save!
#   user_languages.push(user_language)
# end
# p user_languages




# 5.times do |t|
#   puts t
#   appt = Appointment.new(
#     location: "Cologne",
#     datetime: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")
#   )
#   appt.asker_language = user_languages.sample
#   appt.receiver_language = user_languages.sample
#   appt.save
# end
