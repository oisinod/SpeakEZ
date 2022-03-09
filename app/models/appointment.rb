class Appointment < ApplicationRecord
  belongs_to :asker_language, class_name: "UserLanguage"
  belongs_to :receiver_language, class_name: "UserLanguage"
  geocoded_by :location
  validates :datetime, presence:true
  after_validation :geocode

  def asker
    asker_language.user
  end

  def receiver
    receiver_language.user
  end

  def a_language
    asker_language.language
  end

  def r_language
    receiver_language.language
  end

  def other_user(current_user)
    return asker if receiver == current_user #the other user - given by controller?

    return receiver if asker == current_user #the other user - given by controller?
  end

  def other_user_language(current_user)
    other_user(current_user) == asker ? asker_language : receiver_language
  end
end
