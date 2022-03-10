# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'i18n_data'
require 'cloudinary'
require 'open-uri'
def find_flag(flagcode)
  ActionController::Base.helpers.asset_path("flags/#{flagcode}.svg")
rescue Sprockets::Rails::Helper::AssetNotFound
  nil
end
Message.destroy_all
Appointment.destroy_all
User.destroy_all
Language.destroy_all
UserLanguage.destroy_all
cloudinary_path = "https://res.cloudinary.com/oisinod/image/upload/v1646920303/production/"
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
irish = Language.create(name:"Irish", flagcode:"ie")
language_objects << irish
language_objects.sort_by!{ |m| m.name.downcase }
# language_objects.each_with_index {|l,index| p "#{l.name} #{index}"}

user = User.new(
  email: "test@1.com",
  password: 123_456,
  username: "Bootcamp is Love",
  location: "Subbelrather Str. 269, 50825 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "LeWagon is soooooo nice! When you are done here - learn some Ruby",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "25",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}2_rafcc6.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

user = User.new(
  email: "test@marc.com",
  password: 123_456,
  username: "LeWagonLover",
  location: "Eigelstein, Köln",
  first_name: "Marc",
  last_name: "Hannemann",
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "Hi, I'm from Germany and love coding and languages. Would love to meet up for a chat!!",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "32",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}ima0ixhffks2rnds48qop2292zif_bantgd.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/webp')
user.photo.save
users.push(user)


user = User.new(
  email: "test@3.com",
  password: 123_456,
  username: "Love is Bootcamp",
  location: "Hofstraße 1, 51061 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "This app changend my life, let me help you change yours",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "23",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}4_mrbdzy.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

anja = User.new(
  email: "test@anja.com",
  password: 123_456,
  username: "Cruella de Vil",
  location: "Mathilde-Herz-Weg 12, 50827 Köln",
  first_name: "Anja",
  last_name: "Greifenberg",
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "I'm a native German speaker from Cologne, I love meeting new people from different countries and learning languages! Especially looking to learn Irish and would love to meet up over Coffee ☕ (or Beer 🍺 )",
  nationality: "German",
  availability: nil,
  age: "33",
  city: "cologne"
)
anja.save
photo = URI.open("#{cloudinary_path}43c2zyokuigab5po5rm4is48vn0f.jpg")
anja.photo.attach(io: photo, filename: "#{anja.username}.jpg", content_type: 'image/jpg')
anja.photo.save

john = User.new(
  email: "test@10.com",
  password: 123_456,
  username: "StarkatHeart",
  location: "Sankt-Apern-Straße 17, 50667 Köln",
  first_name: "John",
  last_name: "Snow",
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "I have had a very exciting life and would love to tell you about it and learn a new language while doing it! #winteriscoming",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "25",
  city: "cologne"
)
john.save
photo = URI.open("#{cloudinary_path}4mvzsb9ncmzopvbueaic94nzlw1r.webp")
john.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/webp')
john.photo.save
users.push(john)

user = User.new(
  email: "test@4.com",
  password: 123_456,
  username: "LeWagon is Best",
  location: "Burgwiesenstraße 125, 51067 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "LeWagon helped me to learn Ruby. Now I will help to learn an other language",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "28",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}1_h6jld0.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

user = User.new(
  email: "test@5.com",
  password: 123_456,
  username: "GreenRakeIsBestRake",
  location: "Wiersbergstraße 31, 51103 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "I love using this app and improve my language skills while meeting new people",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "41",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}5_ewq86y.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)


user = User.new(
  email: "test@6.com",
  password: 123_456,
  username: "ErrorLover123",
  location: "Alfred-Delp-Straße 1, 51149 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "Always available for a spontaneous meeting - lets talk",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "35",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}1_j6zfs9.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

user = User.new(
  email: "test@7.com",
  password: 123_456,
  username: "TrustTheProcess",
  location: "Pferdmengesstraße 12, 50968 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "All I really need to understand is When you SpeakEZ to me. SpeakEZ to me. SpeakEZ to me SpeakEZ to me. Get jazzy on it...",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "59",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}4_o1686r.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

user = User.new(
  email: "test@2.com",
  password: 123_456,
  username: "LeWagonLover3",
  location: "Industriestraße 16, 50735 Köln",
  first_name: Faker::Name.unique.female_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "I am a friendly guy trying to improve my language skills :D",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "30",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}3_y1nxgk.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

user = User.new(
  email: "test@8.com",
  password: 123_456,
  username: "SmallErrorHugeConsequences",
  location: "Neuenhöfer Allee 65, 50935 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "LeWagon is Love",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "37",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}2_qbrrct.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

user = User.new(
  email: "test@9.com",
  password: 123_456,
  username: "ILoveThisPitch",
  location: "Blaubach 1, 50676 Köln",
  first_name: Faker::Name.unique.male_first_name,
  last_name: Faker::Name.unique.last_name,
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "New to cologne. Would nice to meet some people to improve my German",
  nationality: Faker::Nation.nationality,
  availability: nil,
  age: "22",
  city: "cologne"
)
user.save
photo = URI.open("#{cloudinary_path}3_nccxxx.jpg")
user.photo.attach(io: photo, filename: "#{user.username}.jpg", content_type: 'image/jpg')
user.photo.save
users.push(user)

oisin = User.new(
  email: "test@Oisin.com",
  password: 123_456,
  username: "Leprechaun123",
  location: "Zugweg 14, 50677 Köln",
  first_name: "Oisin",
  last_name: "O Dochartaigh",
  phone: Faker::PhoneNumber.unique.cell_phone,
  bio: "Irish guy - based in Cologne. Always happy to meet someone to improve my German. I ❤ LeWagon",
  nationality: "Irish",
  availability: nil,
  age: "26",
  city: "cologne"
)

photo = URI.open("#{cloudinary_path}IMG_3271_cadqxq.jpg")
oisin.photo.attach(io: photo, filename: "#{oisin.username}.jpg", content_type: 'image/jpg')
oisin.save
oisin.photo.save

# user_languages oisin

oisin_user_language1 = UserLanguage.new(
  skill_level: "5"
)

oisin_user_language1.user = oisin
oisin_user_language1.language = language_objects[1]
oisin_user_language1.save!

oisin_user_language2 = UserLanguage.new(
  skill_level: "4"
)

oisin_user_language2.user = oisin
oisin_user_language2.language = language_objects[6]
oisin_user_language2.save!

oisin_user_language3 = UserLanguage.new(
  skill_level: "3",
  learning: "true"
)

oisin_user_language3.user = oisin
oisin_user_language3.language = language_objects[4]
oisin_user_language3.save!

oisin_user_language4 = UserLanguage.new(
  skill_level: "1",
  learning: "true"
)

oisin_user_language4.user = oisin
oisin_user_language4.language = language_objects[3]
oisin_user_language4.save!

# user_languages anja

anja_user_language1 = UserLanguage.new(
  skill_level: "5"
)

anja_user_language1.user = anja
anja_user_language1.language = language_objects[4]
anja_user_language1.save!

anja_user_language2 = UserLanguage.new(
  skill_level: "4"
)

anja_user_language2.user = anja
anja_user_language2.language = language_objects[1]
anja_user_language2.save!

anja_user_language3 = UserLanguage.new(
  skill_level: "1",
  learning: true
)

anja_user_language3.user = anja
anja_user_language3.language = language_objects[6]
anja_user_language3.save!

# user languages everyone else

users.each do |user|
  puts user.username

  user_language = UserLanguage.new(
    skill_level: "5"
  )
  user_language.user = user
  user_language.language = language_objects[4]
  user_language.save!
  user_languages.push(user_language)

  (rand(1..2)).times do
    language = user_language.language
    user_language = UserLanguage.new(
      skill_level: (3..4).to_a.sample
    )
    user_language.user = user
    # language = language_objects.sample unless user_languages.include?(language)
    language = language_objects.sample while user.languages.include?(language)
    user_language.language = language
    user_language.save!
    user_languages.push(user_language)
  end

  (rand(1..3)).times do
    language = user_language.language
    user_language = UserLanguage.new(
      skill_level: (1..3).to_a.sample,
      learning: true
    )
    user_language.user = user
    # language = language_objects.sample unless user_languages.include?(language)
    language = language_objects.sample while user.languages.include?(language)
    user_language.language = language
    user_language.save!
    user_languages.push(user_language)
  end
end

appt1 = Appointment.new(
  location: "Ginsterweg, Cologne",
  datetime: DateTime.strptime("03/13/2022 17:00", "%m/%d/%Y %H:%M"),
  start_time: DateTime.strptime("03/13/2022 17:00", "%m/%d/%Y %H:%M")
)
appt1.asker_language = UserLanguage.find_by(user: john.id)
appt1.receiver_language = UserLanguage.find_by(user: oisin.id)
appt1.save

appt2 = Appointment.new(
  location: "Pontstrasse, Aachen",
  datetime: DateTime.strptime("03/15/2022 15:00", "%m/%d/%Y %H:%M"),
  start_time: DateTime.strptime("03/15/2022 15:00", "%m/%d/%Y %H:%M")
)
appt2.asker_language = user_languages.sample
appt2.receiver_language = UserLanguage.find_by(user: oisin.id)
appt2.save
